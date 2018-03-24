if(socket_has_error(socket) or (current_time-lastContact > 30000)){
    // Connection closed unexpectedly or timed out, remove client
    socket_destroy(socket);
    instance_destroy();
    exit;
}

if(state==STATE_CLIENT_DOWNLOADING)
{
    lastContact = current_time;
    cumulativeMapBytes += global.mapdownloadLimitBps/(room_speed*global.runningMapDownloads);
    if(cumulativeMapBytes>=400 and global.mapBytesRemainingInStep>0)
    {
        var bytesToSend;
        bytesToSend = round(min(max(global.mapBytesRemainingInStep, 400), cumulativeMapBytes));
        write_buffer_part(socket, mapDownloadBuffer, bytesToSend);
        socket_send(socket);
        global.mapBytesRemainingInStep -= bytesToSend;
        cumulativeMapBytes -= bytesToSend;
        if(!buffer_bytes_left(mapDownloadBuffer))
        {
            buffer_destroy(mapDownloadBuffer);
            mapDownloadBuffer = -1;
            state = STATE_EXPECT_COMMAND;
            expectedBytes = 1;
        }
    }
    exit;
}

if(!tcp_receive(socket, expectedBytes))
    exit;

lastContact = current_time;

var newState;
newState = -1;

switch(state)
{
case STATE_EXPECT_HELLO:
    var sameProtocol, noOfPlayers;
    sameProtocol = (read_ubyte(socket) == HELLO);
    buffer_set_readpos(global.protocolUuid, 0)
    for(i=0; i<4; i+=1)
        if(read_uint(socket) != read_uint(global.protocolUuid)){
            sameProtocol = false;
        }
        if ds_list_find_index(global.banned_ips, socket_remote_ip(socket)) >= 0{
            // This person is banned, kill the socket (->kick them)
            write_ubyte(socket, KICK);
            write_ubyte(socket, KICK_BANNED);
            alarm[6]=30/global.delta_factor
            exit;
        }
            
    if(!sameProtocol)
        write_ubyte(socket, INCOMPATIBLE_PROTOCOL);
    else if(global.serverPassword == "")
    {
        newState = STATE_CLIENT_AUTHENTICATED;
        expectedBytes = 0;
    }
    else
    {
        write_ubyte(socket, PASSWORD_REQUEST);
        newState = STATE_EXPECT_MESSAGELEN;
        messageState = STATE_EXPECT_PASSWORD;
        expectedBytes = 1;
    }
    break;

case STATE_EXPECT_MESSAGELEN:
    expectedBytes = read_ubyte(socket);
    newState = messageState;
    break;

case STATE_EXPECT_PASSWORD:
    if(read_string(socket, expectedBytes) == global.serverPassword)
    {
        newState = STATE_CLIENT_AUTHENTICATED;
        expectedBytes = 0;
    }
    else
        write_ubyte(socket, PASSWORD_WRONG);
    break;

case STATE_CLIENT_AUTHENTICATED:
    write_ubyte(socket, HELLO);
    write_ubyte(socket, string_length(global.serverName));
    write_string(socket, global.serverName);
    write_ubyte(socket, string_length(global.currentMap));
    write_string(socket, global.currentMap);
    write_ubyte(socket, string_length(global.currentMapMD5));
    write_string(socket, global.currentMapMD5);
    
    write_ubyte(socket, global.serverPluginsRequired);
    write_ushort(socket, string_length(GameServer.pluginList));
    write_string(socket, GameServer.pluginList);
    
    advertisedMap = global.currentMap;
    advertisedMapMd5 = global.currentMapMD5;
    newState = STATE_EXPECT_COMMAND;
    expectedBytes = 1;
    break;
    
case STATE_EXPECT_COMMAND:
    switch(read_ubyte(socket))
    {
    // keeps connection open when downloading plugins
    case PING:
        newState = STATE_EXPECT_COMMAND;
        expectedBytes = 1;
        break;

    case PLAYER_JOIN:
        newState = STATE_EXPECT_MESSAGELEN;
        messageState = STATE_EXPECT_NAME;
        expectedBytes = 1;
        break;
        
    case DOWNLOAD_MAP:
        if(advertisedMapMd5 != "" and file_exists("Maps/" + advertisedMap + ".png")){
            // If the md5 was empty, we advertised an internal map, which obviously can't be downloaded.
            buffer_destroy(mapDownloadBuffer);
            mapDownloadBuffer = buffer_create();
            if(!append_file_to_buffer(mapDownloadBuffer, "Maps/" + advertisedMap + ".png")) {
                buffer_destroy(mapDownloadBuffer);
                mapDownloadBuffer = -1;
                break;
            }
            write_uint(socket, buffer_size(mapDownloadBuffer));
            newState = STATE_CLIENT_DOWNLOADING;
        }
        break;
    // Other stuff like RCON_LOGIN can branch off here.
    }
    break;

case STATE_EXPECT_NAME:
    var noOfPlayers, player;
    noOfPlayers = ds_list_size(global.players);
    if(global.dedicatedMode)
        noOfPlayers -= 1;
        
    if(noOfPlayers >= global.playerLimit)
    {
        write_ubyte(socket, SERVER_FULL);
        break;
    }
    
    //Bots
    // Mixed VS Mixed: Fill Server
    if global.botMode == 3{
        //Destroy one bot
        with Player{
            if isBot{
                remove_bot(botSocket)
                break;
            }
        }
    }
    
    ServerJoinUpdate(socket);
    
    player = instance_create(0,0,Player);
    player.socket = socket;
    socket = -1; // Prevent the socket from being destroyed with the JoiningPlayer - it belongs to the Player now.
    
    player.name = read_string(player.socket, expectedBytes);
    player.name = string_copy(player.name, 0, MAX_PLAYERNAME_LENGTH);
    
    //Bots
    if ds_map_exists(global.botNameSocketMap, player.name)!=0{
        player.isBot = 1
        player.botSocket = ds_map_find_value(global.botNameSocketMap, player.name)
        ds_map_delete(global.botNameSocketMap, player.name)
        player.name = generate_bot_names()
        
        with player{
            bot_init()
        }
    }
    
    ds_list_add(global.players, player);
    ServerPlayerJoin(player.name, global.sendBuffer);
    
    with(ModController){
        event_user(0)
    }
    if global.chatPBF_1==1{
        var message;
        message = global.chatPrintPrefix+C_GREEN+c_filter(player.name)+C_WHITE+" has joined the server."
        write_ubyte(global.publicChatBuffer, CHAT_PUBLIC_MESSAGE);
        write_ushort(global.publicChatBuffer, string_length(message));
        write_string(global.publicChatBuffer, message);
        write_byte(global.publicChatBuffer,-1)
        print_to_chat(message);// For the hostconsole_sendmsg
    }
    
    if (ds_list_find_index(global.rcon_ips, socket_remote_ip(player.socket)) != -1) and global.autoRCON==1{
        write_ubyte(player.socket,RCON_LOGIN)
        write_ubyte(player.socket,RCON_LOGIN_SUCCESSFUL)
        ds_list_add(global.RCONList,player)
        
        console_print(C_PINK+'RCON: '+player.name+' given RCON access.')
        var message, color;
        color=getPlayerColor(player, true);
        message = global.chatPrintPrefix+color+c_filter(player.name)+C_WHITE+' given '+C_PINK+'RCON'+C_WHITE+' access.'
        write_ubyte(global.publicChatBuffer, CHAT_PUBLIC_MESSAGE);
        write_ushort(global.publicChatBuffer, string_length(message));
        write_string(global.publicChatBuffer, message);
        write_byte(global.publicChatBuffer,-1)
        print_to_chat(message);// For the hostconsole_sendmsg
    }
    
    //RUP
    ds_map_add(rupPlayers,player,0)
    
    // message lobby to update playercount if we became full
    if(noOfPlayers+1 == global.playerLimit)
        sendLobbyRegistration();
    
    if(global.welcomeMessage != "")
        ServerMessageString(global.welcomeMessage, player.socket);
    
    break;
}

socket_send(socket);
state = newState;
if(state==-1){
    // We're done, either because of a protocol error or because the client finished joining.
    instance_destroy();
    exit;
}
