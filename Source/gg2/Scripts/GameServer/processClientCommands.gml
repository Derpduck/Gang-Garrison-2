var player, playerId, commandLimitRemaining;

player = argument0;
playerId = argument1;

// To prevent players from flooding the server, limit the number of commands to process per step and player.
commandLimitRemaining = 10;

with(player) {
    if(!variable_local_exists("commandReceiveState")) {
        // 0: waiting for command byte.
        // 1: waiting for command data length (1 byte)
        // 2: waiting for command data.
        commandReceiveState = 0;
        commandReceiveExpectedBytes = 1;
        commandReceiveCommand = 0;
    }
}

while(commandLimitRemaining > 0) {
    var socket;
    socket = player.socket;
    if(!tcp_receive(socket, player.commandReceiveExpectedBytes)) {
        return 0;
    }
    
    switch(player.commandReceiveState)
    {
    case 0:
        player.commandReceiveCommand = read_ubyte(socket);
        switch(commandBytes[player.commandReceiveCommand]) {
        case commandBytesInvalidCommand:
            // Invalid byte received. Wait for another command byte.
            break;
            
        case commandBytesPrefixLength1:
            player.commandReceiveState = 1;
            player.commandReceiveExpectedBytes = 1;
            break;

        case commandBytesPrefixLength2:
            player.commandReceiveState = 3;
            player.commandReceiveExpectedBytes = 2;
            break;

        default:
            player.commandReceiveState = 2;
            player.commandReceiveExpectedBytes = commandBytes[player.commandReceiveCommand];
            break;
        }
        break;
        
    case 1:
        player.commandReceiveState = 2;
        player.commandReceiveExpectedBytes = read_ubyte(socket);
        break;

    case 3:
        player.commandReceiveState = 2;
        player.commandReceiveExpectedBytes = read_ushort(socket);
        break;
        
    case 2:
        player.commandReceiveState = 0;
        player.commandReceiveExpectedBytes = 1;
        commandLimitRemaining -= 1;
        
        switch(player.commandReceiveCommand)
        {
        case PLAYER_LEAVE:
            socket_destroy(player.socket);
            player.socket = -1;
            break;
            
        case PLAYER_CHANGECLASS:
            if instance_exists(ArenaHUD) and global.isLive==1{
                if ArenaHUD.roundStart == 0 && ArenaHUD.endCount == 0{
                    break;
                }
            }
            var class;
            class = read_ubyte(socket);
            if(getCharacterObject(class) != -1)
            {
                if(player.object != -1)
                {
                    with(player.object)
                    {
                        if (collision_point(x,y,SpawnRoom,0,0) < 0)
                        {
                            if (!instance_exists(lastDamageDealer) or lastDamageDealer == player)
                            {
                                sendEventPlayerDeath(player, player, noone, DAMAGE_SOURCE_BID_FAREWELL);
                                doEventPlayerDeath(player, player, noone, DAMAGE_SOURCE_BID_FAREWELL);
                            }else{
                                var assistant;
                                assistant = secondToLastDamageDealer;
                                if (lastDamageDealer.object){
                                    if (lastDamageDealer.object.healer){
                                        assistant = lastDamageDealer.object.healer;
                                    }
                                }
                                sendEventPlayerDeath(player, lastDamageDealer, assistant, DAMAGE_SOURCE_FINISHED_OFF);
                                doEventPlayerDeath(player, lastDamageDealer, assistant, DAMAGE_SOURCE_FINISHED_OFF);
                            }
                        }else
                        instance_destroy(); 
                    }
                }else if(player.alarm[5]<=0){
                    player.alarm[5] = 1;
                }
                if !instance_exists(MGE_HUD){
                    class = checkClasslimits(player, player.team, class);
                }
                player.class = class;
                ServerPlayerChangeclass(playerId, player.class, global.sendBuffer);
            }
            break;
            
        case PLAYER_CHANGETEAM:
            var newTeam, balance, redSuperiority;
            newTeam = read_ubyte(socket);
            
            if global.lockedTeams==1{
                break;
            }
            
            if instance_exists(PugController){
                if (global.pugMode==1 and PugController.stage<5) and PugController.war==0{
                    break;
                }
                
                if PugController.war==1 and (PugController.stage!=3 and PugController.stage<5){
                    break;
                }
            }
            
            if global.maxPlayers!=-1{
                var redTeam,blueTeam;
                redTeam=0
                blueTeam=0
                for (i=0; i<ds_list_size(global.players); i+=1){
                    player=ds_list_find_value(global.players, i)
                    if player.team==TEAM_RED{
                        redTeam+=1
                    }else if player.team==TEAM_BLUE{
                        blueTeam+=1
                    }
                }
                if redTeam>=global.maxPlayers and newTeam==TEAM_RED{
                    exit;
                }
                if blueTeam>=global.maxPlayers and newTeam==TEAM_BLUE{
                    exit;
                }
            }

            // Invalid team was requested, treat it as a random team
            if(newTeam != TEAM_RED and newTeam != TEAM_BLUE and newTeam != TEAM_SPECTATOR){
                newTeam = TEAM_ANY;
            }
            
            if instance_exists(MGE_HUD){
                if player.MGE_currentArena==-1{
                    newTeam=TEAM_SPECTATOR
                    
                    message = global.chatPrintPrefix+C_WHITE+"Type "+C_GREEN+"/arena <1-5> "+C_WHITE+"to join."
                    write_ubyte(player.socket, CHAT_PUBLIC_MESSAGE);
                    write_ushort(player.socket, string_length(message));
                    write_string(player.socket, message);
                    write_byte(player.socket,-1)
                    if player==global.myself{
                        print_to_chat(message);
                    }
                }else{
                    exit;
                }
            }
            
            redSuperiority = 0   //calculate which team is bigger
            balance = -1;

            if(balance != newTeam){
                //Bots
                //Human VS Bots: Dynamic
                if global.botMode == 2{
                    if newTeam == TEAM_SPECTATOR{
                        with Player{
                            if isBot{
                                remove_bot(botSocket)
                            }
                        }
                    }else{
                        switch (global.botChosenTeam){
                            case TEAM_RED:
                                newTeam = TEAM_BLUE;
                                create_bot(get_bot_team(), get_bot_class());
                                break;
            
                            case TEAM_BLUE:
                                newTeam = TEAM_RED;
                                create_bot(get_bot_team(), get_bot_class());
                                break;
                        }
                    }
                }
                
                if(getCharacterObject(player.class) != -1 or newTeam==TEAM_SPECTATOR)
                {  
                    if(player.object != -1)
                    {
                        with(player.object)
                        {
                            if (!instance_exists(lastDamageDealer) || lastDamageDealer == player)
                            {
                                sendEventPlayerDeath(player, player, noone, DAMAGE_SOURCE_BID_FAREWELL);
                                doEventPlayerDeath(player, player, noone, DAMAGE_SOURCE_BID_FAREWELL);
                            }
                            else
                            {
                                var assistant;
                                assistant = secondToLastDamageDealer;
                                if (lastDamageDealer.object)
                                    if (lastDamageDealer.object.healer)
                                        assistant = lastDamageDealer.object.healer;
                                sendEventPlayerDeath(player, lastDamageDealer, assistant, DAMAGE_SOURCE_FINISHED_OFF);
                                doEventPlayerDeath(player, lastDamageDealer, assistant, DAMAGE_SOURCE_FINISHED_OFF);
                            }
                        }
                        if global.isLive==1{
                            if !instance_exists(MGE_HUD){
                                player.alarm[5] = global.Server_Respawntime / global.delta_factor
                            }else{
                                player.alarm[5] = 30 / global.delta_factor
                            }
                        }
                    }else if(player.alarm[5]<=0){
                        player.alarm[5] = 1;
                    }
                    var newClass;
                    newClass = checkClasslimits(player, newTeam, player.class);
                    if newClass != player.class
                    {
                        player.class = newClass;
                        ServerPlayerChangeclass(playerId, player.class, global.sendBuffer);
                    }
                    player.team = newTeam;
                    ServerPlayerChangeteam(playerId, player.team, global.sendBuffer);
                    ServerBalanceTeams();
                }
            }
            break;
            
        case CHAT_BUBBLE:
            var bubbleImage;
            bubbleImage = read_ubyte(socket);
            if(global.aFirst and bubbleImage != 45){
                bubbleImage = 0;
            }
            write_ubyte(global.sendBuffer, CHAT_BUBBLE);
            write_ubyte(global.sendBuffer, playerId);
            write_ubyte(global.sendBuffer, bubbleImage);
            
            setChatBubble(player, bubbleImage);
            break;
            
        case BUILD_SENTRY:
            if(player.object != -1)
            {
                if(player.class == CLASS_ENGINEER
                        and collision_circle(player.object.x, player.object.y, 50, Sentry, false, true) < 0
                        and player.object.nutsNBolts == 100
                        and (collision_point(player.object.x,player.object.y,SpawnRoom,0,0) < 0)
                        and !player.sentry
                        and !player.object.onCabinet)
                {
                    write_ubyte(global.sendBuffer, BUILD_SENTRY);
                    write_ubyte(global.sendBuffer, playerId);
                    write_ushort(global.serializeBuffer, round(player.object.x*5));
                    write_ushort(global.serializeBuffer, round(player.object.y*5));
                    write_byte(global.serializeBuffer, player.object.image_xscale);
                    buildSentry(player, player.object.x, player.object.y, player.object.image_xscale);
                }
            }
            break;

        case DESTROY_SENTRY:
            with(player.sentry)
                instance_destroy();
            break;
        
        case DROP_INTEL:
            if (player.object != -1)
            {
                if (player.object.intel)
                {
                    sendEventDropIntel(player);
                    doEventDropIntel(player);
                }
            }
            break;
              
        case OMNOMNOMNOM:
            if(player.object != -1) {
                if(!player.humiliated
                    and !player.object.taunting
                    and !player.object.omnomnomnom
                    and player.object.canEat
                    and player.class==CLASS_HEAVY){
                    write_ubyte(global.sendBuffer, OMNOMNOMNOM);
                    write_ubyte(global.sendBuffer, playerId);
                    with(player.object)
                    {
                        omnomnomnom = true;
                        omnomnomnomindex=0;
                        omnomnomnomend=32;
                        xscale=image_xscale;
                        jOldHspeed=hspeed
                        jOldVspeed=vspeed
                    }
                }
            }
            break;
             
        case TOGGLE_ZOOM:
            if player.object != -1 {
                if player.class == CLASS_SNIPER {
                    write_ubyte(global.sendBuffer, TOGGLE_ZOOM);
                    write_ubyte(global.sendBuffer, playerId);
                    toggleZoom(player.object);
                }
            }
            break;
                                                      
        case PLAYER_CHANGENAME:
            var nameLength;
            nameLength = socket_receivebuffer_size(socket);
            if(nameLength > MAX_PLAYERNAME_LENGTH)
            {
                write_ubyte(player.socket, KICK);
                write_ubyte(player.socket, KICK_NAME);
                with(player){
                    alarm[7]=30/global.delta_factor
                }
                break;
            }
            else
            {
                with(player)
                {
                    if(variable_local_exists("lastNamechange")) 
                        if(current_time - lastNamechange < 1000)
                            break;
                    lastNamechange = current_time;
                    oldname=name
                    name = read_string(socket, nameLength);
                    var color;
                    color=getPlayerColor(player, true)
                    chat_sendmsg(global.chatPrintPrefix+color+c_filter(oldname)+" "+C_WHITE+"has changed their name to"+color+" "+c_filter(name)+C_WHITE+".",global.printNames)
                    
                    write_ubyte(global.sendBuffer, PLAYER_CHANGENAME);
                    write_ubyte(global.sendBuffer, playerId);
                    write_ubyte(global.sendBuffer, string_length(name));
                    write_string(global.sendBuffer, name);
                }
            }
            break;
            
        case INPUTSTATE:
            if(player.object != -1){
                with(player.object){
                    keyState = read_ubyte(socket);
                    netAimDirection = read_ushort(socket);
                    if player.autoSpinjump==1 and (!((keyState | pressedKeys) & $10) and !((keyState | pressedKeys) & $08)){
                        if global.run_virtual_ticks{
                            if aimDirection>=180{
                                aimDirection=0
                                netAimDirection=0*65536/360
                            }else{
                                aimDirection=180
                                netAimDirection=180*65536/360
                            }
                        }
                    }else{
                        aimDirection = netAimDirection*360/65536;
                    }
                    aimDistance = read_ubyte(socket)*2;

                    event_user(1);
                }
            }
            break;
        
        case REWARD_REQUEST:
            player.rewardId = read_string(socket, socket_receivebuffer_size(socket));
            player.challenge = rewardCreateChallenge();
            
            write_ubyte(socket, REWARD_CHALLENGE_CODE);
            write_binstring(socket, player.challenge);
            break;
            
        case REWARD_CHALLENGE_RESPONSE:
            var answer, i, authbuffer;
            answer = read_binstring(socket, 16);
            
            with(player)
                if(variable_local_exists("challenge") and variable_local_exists("rewardId")){
                    rewardAuthStart(player, answer, challenge, true, rewardId);
                }
           
            break;

        case PLUGIN_PACKET:
            var packetID, buf, success;

            packetID = read_ubyte(socket);
            
            // get packet data
            buf = buffer_create();
            write_buffer_part(buf, socket, socket_receivebuffer_size(socket));

            // try to enqueue
            success = _PluginPacketPush(packetID, buf, player);
            
            // if it returned false, packetID was invalid
            if (!success)
            {
                // clear up buffer
                buffer_destroy(buf);

                // kick player
                write_ubyte(player.socket, KICK);
                write_ubyte(player.socket, KICK_BAD_PLUGIN_PACKET);
                with(player){
                    alarm[7]=30/global.delta_factor
                }
            }
            break;
            
        case CLIENT_SETTINGS:
            var mirror;
            mirror = read_ubyte(player.socket);
            player.queueJump = mirror;
            
            write_ubyte(global.sendBuffer, CLIENT_SETTINGS);
            write_ubyte(global.sendBuffer, playerId);
            write_ubyte(global.sendBuffer, mirror);
            break;
        
        case RCON_LOGIN:
            var rconCommand,commandLength;
            commandLength=socket_receivebuffer_size(player.socket)
            rconCommand=read_string(player.socket,commandLength)
            
            if global.RCONAllowed==0 break;
            if global.RCONPassword=="" break;
            
            if string(rconCommand)==string(global.RCONPassword){
                write_ubyte(player.socket,RCON_LOGIN)
                write_ubyte(player.socket,RCON_LOGIN_SUCCESSFUL) //valid password
                ds_list_add(global.RCONList,player)
                
                //Write to file
                if ds_list_find_index(global.rcon_ips,socket_remote_ip(player.socket))==-1{
                    ds_list_add(global.rcon_ips,socket_remote_ip(player.socket))
                    ds_list_add(global.rcon_names,player.name)
                    
                    var rcon_text, rcon_str, i;
                    rcon_str=''
                    for (i=0; i<ds_list_size(global.rcon_ips); i+=1){
                        rcon_str+=ds_list_find_value(global.rcon_ips,i)+'@'+ds_list_find_value(global.rcon_names,i)+chr(10)
                    }
                    rcon_text=file_text_open_write('RCON_IPs.txt')
                    file_text_write_string(rcon_text,rcon_str)
                    file_text_close(rcon_text)
                }
            
                console_print(C_PINK+'RCON: '+player.name+' given RCON access.')
                var color;
                color=getPlayerColor(player, true);
                chat_sendmsg(global.chatPrintPrefix+color+c_filter(player.name)+C_WHITE+' given '+C_PINK+'RCON'+C_WHITE+' access.',global.printRCONStatus)
            }else{
                write_ubyte(player.socket,RCON_LOGIN)
                write_ubyte(player.socket,RCON_LOGIN_FAILED) //invalid password
            }
            break;
        
        case RCON_COMMAND:
            var rconCommand,commandLength;
            commandLength=socket_receivebuffer_size(player.socket)
            rconCommand=read_string(player.socket,commandLength)
            
            if global.RCONAllowed==0 or ds_list_find_value(global.RCONList,ds_list_find_index(global.RCONList,player))!=player{
                write_ubyte(player.socket,RCON_COMMAND)
                write_ubyte(player.socket,RCON_COMMAND_FAILED)
                break;
            }
            
            if(string_length(rconCommand) > MAX_RCON_COMMAND_LENGTH){
                write_ubyte(player.socket, KICK)
                write_ubyte(player.socket, KICK_RCON)
                console_print(C_PINK+'RCON: '+player.name+' sent a command with a length over the maximum limit; kicking.')
                with(player){
                    alarm[7]=30/global.delta_factor
                }
                break;
            }
            
            console_parseInput_RCON(rconCommand,player.name)
            write_ubyte(player.socket,RCON_COMMAND)
            write_ubyte(player.socket,RCON_COMMAND_SUCESSFUL)
            break;
            
        case CHAT_PUBLIC_MESSAGE:
            var messageLength;
            messageLength = socket_receivebuffer_size(socket);
            if(messageLength > CHAT_MAX_STRING_LENGTH){
                write_ubyte(player.socket, KICK);
                write_ubyte(player.socket, KICK_CHAT_LENGTH);
                with(player){
                    alarm[7]=30/global.delta_factor
                    break;
                }
            }else{
                with(player){
                    //dont send messgaes from muted players
                    if ds_list_find_index(global.chatBanList,id)!=-1{
                        break;
                    }
                    if(current_time - lastChatTime < 500){
                        break;
                    }
                    lastChatTime = current_time;
                    
                    var message;
                    message = read_string(socket, messageLength);
                    // Prevent messing with the color code as well
                    if(string_count("/:/", message) > 0){
                        message = c_filter(message)
                    }
                    
                    message = parse_custom_color(message)
                    playerListID=ds_list_find_index(global.players,id)
                    
                    if string_char_at(message,0)=="!"{
                        var globalCommand;
                        globalCommand=string_delete(message,1,1)
                        chat_parseInputCommandSent(string(globalCommand), player)
                    }
                    
                    if object!=-1 and team!=TEAM_SPECTATOR{
                        with object{
                            sAfkTimer=sAfkTimeout
                        }
                    }
                    
                    var color, roleColour;
                    color = getPlayerColor(player, true);
                    
                    if isDerpduck==1{
                        roleColour=P_ORNGE
                    }else if ds_list_find_index(global.players, player)==0{
                        roleColour=P_YELLW
                    }else if ds_list_find_index(global.RCONList, player)!=-1{
                        roleColour=C_LPINK
                    }else{
                        roleColour=C_WHITE
                    }
                    
                    if team == TEAM_RED{
                        message = color + c_filter(name) + ": " + roleColour + message;
                    }else if team == TEAM_BLUE{
                        message = color + c_filter(name) + ": " + roleColour + message;
                    }else{
                        message = color + c_filter(name) + ": " + roleColour + message;
                    }
                    
                    write_ubyte(global.publicChatBuffer, CHAT_PUBLIC_MESSAGE);
                    write_ushort(global.publicChatBuffer, string_length(message));
                    write_string(global.publicChatBuffer, message);
                    write_byte(global.publicChatBuffer,playerListID);
                    
                    // For the host, who never receives stuff
                    if ds_list_find_index(global.clientChatBanList,permID)!=-1{
                        break;
                    }
                    print_to_chat(message);
                }
            }
            break;

        case CHAT_PRIV_MESSAGE:
            var messageLength;
            messageLength = socket_receivebuffer_size(socket);
            if(messageLength > CHAT_MAX_STRING_LENGTH){
                write_ubyte(player.socket, KICK);
                write_ubyte(player.socket, KICK_CHAT_LENGTH);
                with(player){
                    alarm[7]=30/global.delta_factor
                    break;
                }
            }else{
                with(player){
                    //dont send muted players messages
                    if ds_list_find_index(global.chatBanList,id)!=-1{
                        break;
                    }
                    if(current_time - lastChatTime < 500){
                        break;
                    }
                    lastChatTime = current_time;
                    var message, teambuffer;
                    message = read_string(socket, messageLength);
                    // Prevent messing with the color code as well
                    if(string_count("/:/", message) > 0){
                        message = c_filter(message)
                    }
                    
                    message = parse_custom_color(message)
                    playerListID=ds_list_find_index(global.players,id)
                    
                    if string_char_at(message,0)=="!"{
                        var globalCommand;
                        globalCommand=string_delete(message,1,1)
                        chat_parseInputCommandSent(string(globalCommand), player)
                    }
                    
                    if object!=-1 and team!=TEAM_SPECTATOR{
                        with object{
                            sAfkTimer=sAfkTimeout
                        }
                    }

                    var color;
                    color = getPlayerColor(player, false);
                    
                    if team == TEAM_RED{
                        teambuffer = global.privChatRedBuffer;
                        message = color + "(team) " + c_filter(name) + ": " + message;
                    }else if team == TEAM_BLUE{
                        teambuffer = global.privChatBlueBuffer;
                        message = color + "(team) " + c_filter(name) + ": " + message;
                    }else{
                        teambuffer = global.privChatSpecBuffer;
                        message = color + "(team) " + c_filter(name) + ": " + message;
                    }
                    write_ubyte(teambuffer, CHAT_PRIV_MESSAGE);
                    write_ushort(teambuffer, string_length(message));
                    write_string(teambuffer, message);
                    write_byte(teambuffer,playerListID);

                    // For the host, who never receives stuff
                    if global.myself.team == team or (global.myself.team==TEAM_SPECTATOR and global.specReadChat==1){
                        if ds_list_find_index(global.clientChatBanList,permID)!=-1{
                            break;
                        }
                        print_to_chat(message);
                    }
                }
            }
            break;
            
        case RUP_READY:
            with(player){
                if(current_time - lastChatTime < 800){
                    break;
                }
                lastChatTime=current_time;
                
                if team==TEAM_SPECTATOR{
                    break;
                }
                if object!=-1{
                    with object{
                        sAfkTimer=sAfkTimeout
                    }
                }
            }
            
            if global.canStart==0{
                break;
            }
            
            if ds_map_find_value(rupPlayers,player)==0{
                ds_map_replace(rupPlayers,player,1)
                var color;
                color=getPlayerColor(player, true)
                chat_sendmsg(global.chatPrintPrefix+color+c_filter(player.name)+C_WHITE+" is ready.",global.printRUP)
            }
            break;
            
        case RUP_UNREADY:
            with(player){
                if(current_time - lastChatTime < 800){
                    break;
                }
                lastChatTime=current_time;
                
                if team==TEAM_SPECTATOR{
                    break;
                }
                if object!=-1{
                    with object{
                        sAfkTimer=sAfkTimeout
                    }
                }
            }
            
            if global.canStart==0{
                break;
            }
            
            if ds_map_find_value(rupPlayers,player)==1{
                ds_map_replace(rupPlayers,player,0)
                var color;
                color=getPlayerColor(player, true)
                chat_sendmsg(global.chatPrintPrefix+color+c_filter(player.name)+C_WHITE+" is no longer ready.",global.printRUP)
            }
            break;
            
        case DC_REASON_USER:
            with(player){
                dcReason=DC_REASON_USER
            }
            break;
            
        case PLAYER_PING:
            if(player.object != -1){
                with(player.object){
                    playerPing=read_ushort(player.socket)
                }
            }
            break;
            
        case MGE_CHANGE_ARENA:
            var newArena;
            newArena = read_byte(player.socket);
            
            if player.MGE_currentArena==newArena{
                exit;
            }
            
            //Check if the arena exists
            if newArena!=-1{
                if (newArena==0 and (!instance_exists(SpawnPointRed) or !instance_exists(SpawnPointBlue))) exit;
                if (newArena==1 and (!instance_exists(SpawnPointRed1) or !instance_exists(SpawnPointBlue1))) exit;
                if (newArena==2 and (!instance_exists(SpawnPointRed2) or !instance_exists(SpawnPointBlue2))) exit;
                if (newArena==3 and (!instance_exists(SpawnPointRed3) or !instance_exists(SpawnPointBlue3))) exit;
                if (newArena==4 and (!instance_exists(SpawnPointRed4) or !instance_exists(SpawnPointBlue4))) exit;
                
                var newArenaRed,newArenaBlue;
                newArenaRed=0
                newArenaBlue=0
                for (i=0; i<ds_list_size(global.players); i+=1){
                    if ds_list_find_value(global.players,i).MGE_currentArena==newArena{
                        if newArena!=-1{
                            if ds_list_find_value(global.players,i).team==TEAM_RED newArenaRed+=1
                            if ds_list_find_value(global.players,i).team==TEAM_BLUE newArenaBlue+=1
                        }
                    }
                }
                
                if newArenaRed>0 and newArenaBlue>0{
                    exit;
                }
            }
            
            player.MGE_currentArena=newArena
            
            if(player.object!=-1){
                with(player.object){
                    if (!instance_exists(lastDamageDealer) || lastDamageDealer == player){
                        sendEventPlayerDeath(player, player, noone, DAMAGE_SOURCE_BID_FAREWELL);
                        doEventPlayerDeath(player, player, noone, DAMAGE_SOURCE_BID_FAREWELL);
                    }else{
                        var assistant;
                        assistant = secondToLastDamageDealer;
                        if (lastDamageDealer.object){
                            if (lastDamageDealer.object.healer){
                                assistant = lastDamageDealer.object.healer;
                            }
                        }
                        sendEventPlayerDeath(player, lastDamageDealer, assistant, DAMAGE_SOURCE_FINISHED_OFF);
                        doEventPlayerDeath(player, lastDamageDealer, assistant, DAMAGE_SOURCE_FINISHED_OFF);
                    }
                }
                if global.isLive==1{
                    player.alarm[5] = 30 / global.delta_factor
                }
            }else if(player.alarm[5]<=0){
                player.alarm[5] = 1;
            }
            
            if newArena==-1{
                player.team=TEAM_SPECTATOR
                ServerPlayerChangeteam(playerId, player.team, global.sendBuffer);
            }
            
            if newArena!=-1{
                if newArenaRed==0 and newArenaBlue==0{
                    player.team=choose(TEAM_RED,TEAM_BLUE)
                }else if newArenaRed==0 and newArenaBlue>0{
                    player.team=TEAM_RED
                }else if newArenaRed>0 and newArenaBlue==0{
                    player.team=TEAM_BLUE
                }
                ServerPlayerChangeteam(playerId, player.team, global.sendBuffer);
            }
            break;
            
        case PUG_CAPTAIN:
            if global.pugMode==0{
                break;
            }
            
            //Alternate behaviour for war mode
            if PugController.war==1 and PugController.stage==3{
                if player==PugController.redCaptain{
                    if PugController.warRedOk==0{
                        PugController.warRedOk=1
                        
                        chat_sendmsg(global.chatPrintPrefix+P_RED+"RED "+C_WHITE+"team is ready!")
                    }else if PugController.warRedOk==1{
                        PugController.warRedOk=0
                        chat_sendmsg(global.chatPrintPrefix+P_RED+"RED "+C_WHITE+"team is no longer ready!")
                    }
                }
                
                if player==PugController.blueCaptain{
                    if PugController.warBlueOk==0{
                        PugController.warBlueOk=1
                        chat_sendmsg(global.chatPrintPrefix+P_BLUE+"BLUE "+C_WHITE+"team is ready!")
                    }else if PugController.warBlueOk==1{
                        PugController.warBlueOk=0
                        chat_sendmsg(global.chatPrintPrefix+P_BLUE+"BLUE "+C_WHITE+"team is no longer ready!")
                    }
                }
                
                if PugController.warRedOk==1 and PugController.warBlueOk==1{
                    PugController.stage=4
                    PugController.alarm[2]=30/global.delta_factor
                    
                    chat_sendmsg(global.chatPrintPrefix+C_WHITE+"Teams have been confirmed and locked!")
                    
                    with(PugController){
                        event_user(5)
                    }
                }
                break;
            }
            
            
            
            
            if PugController.stage<1 or PugController.stage>2{
                break;
            }
            
            if player.team!=TEAM_SPECTATOR{
                break;
            }
            
            if PugController.stage==1{
                player.team=TEAM_RED
                PugController.redCaptain=player
                PugController.stage=2 //blue captain
                
                chat_sendmsg(global.chatPrintPrefix+P_RED+player.name+C_WHITE+" selected as "+P_RED+"RED team's"+C_WHITE+" captain!")
                chat_sendmsg(global.chatPrintPrefix+C_WHITE+"Type "+C_GREEN+"/captain"+C_WHITE+" to become "+P_BLUE+"BLUE team's"+C_WHITE+" captain.")
            }else if PugController.stage==2{
                player.team=TEAM_BLUE
                PugController.blueCaptain=player
                PugController.stage=3 //picking teams
                PugController.alarm[1]=30/global.delta_factor
                
                chat_sendmsg(global.chatPrintPrefix+P_BLUE+player.name+C_WHITE+" selected as "+P_BLUE+"BLUE team's"+C_WHITE+" captain!")
            }
            ServerPlayerChangeteam(ds_list_find_index(global.players,player),player.team,global.sendBuffer)
            break;
            
        case PUG_PICK:
            if global.pugMode==0{
                break;
            }
            var playerPicked,listPick;
            playerPicked=read_byte(socket)
            
            if PugController.stage!=3{
                break;
            }
            
            PugController.pickedPlayerTeam=player.team
            
            if PugController.pickedPlayerTeam!=PugController.teamToPick{
                break;
            }
            
            if PugController.teamToPick==0{
                if player!=PugController.redCaptain{
                    break
                }
            }else if PugController.teamToPick==1{
                if player!=PugController.blueCaptain{
                    break
                }
            }
            
            listPick=ds_list_find_value(PugController.pickingPlayers,playerPicked-1)
            if ds_list_find_index(PugController.pickingPlayers,listPick)!=-1{
                PugController.pickedPlayer=listPick
                PugController.pickedColour=getPlayerColor(player,true)
                
                //Picking goes in ABBA order
                //4v4: R BB RR B
                //5v5: R BB RR BB R
                PugController.pickNumber+=1
                //Manually doing this, messy but works for now
                if PugController.pickNumber==1 PugController.teamToPick=0
                if PugController.pickNumber==2 PugController.teamToPick=1
                if PugController.pickNumber==4 PugController.teamToPick=0
                if PugController.pickNumber==6 PugController.teamToPick=1
                if PugController.pickNumber==8 PugController.teamToPick=0
                if PugController.pickNumber==10 PugController.teamToPick=1
                if PugController.pickNumber==12 PugController.teamToPick=0
                if PugController.pickNumber==14 PugController.teamToPick=1
                if PugController.pickNumber==16 PugController.teamToPick=0
                if PugController.pickNumber==18 PugController.teamToPick=1
                if PugController.pickNumber==20 PugController.teamToPick=0
                if PugController.pickNumber==22 PugController.teamToPick=1
                
                with(PugController){
                    event_user(1)
                }
            }
            break;
            
        case PUG_MAP:
            mapLength = socket_receivebuffer_size(socket);
            mapName = read_string(socket, mapLength);
            
            if global.pugMode==0{
                break;
            }
            
            if PugController.stage!=4{
                break;
            }
            
            if PugController.mapPickerTeam==0{
                if PugController.mix==0{
                    if player!=PugController.redCaptain{
                        break
                    }
                }
            }else if PugController.mapPickerTeam==1{
                if PugController.mix==0{
                    if player!=PugController.blueCaptain{
                        break
                    }
                }
            }
            
            if player.team!=PugController.mapPickerTeam{
                break;
            }
            
            //Invalid map check
            if(!file_exists('Maps/' + mapName + '.png')){
                chat_sendmsg(global.chatPrintPrefix+C_GREEN+string(mapName)+C_WHITE+" is not a valid map name; pick another map or ensure you have typed it correctly.")
                break;
            }
            
            //Map is already in the list
            if ds_list_find_index(PugController.mapList,mapName)!=-1{
                chat_sendmsg(global.chatPrintPrefix+C_GREEN+string(mapName)+C_WHITE+" has already been selected, please choose another map.")
                break;
            }
            
            //Do this until we have picked 5 maps in total
            if PugController.mapsPickedCount<global.pugVoteMaps{
                //Map is valid, add to list
                if PugController.mapPickerTeam==0{
                    ds_list_add(PugController.mapList,mapName)
                    PugController.mapPickerTeam=1 //switch to blue team
                    PugController.mapsPickedCount+=1
                
                    chat_sendmsg(global.chatPrintPrefix+P_RED+"RED team"+C_WHITE+" picked: "+C_GREEN+mapName+C_WHITE+"! "+P_BLUE+"BLUE's"+C_WHITE+" turn to pick.")
                    if PugController.mapsPickedCount<global.pugVoteMaps{
                        break;
                    }
                }else if PugController.mapPickerTeam==1{
                    ds_list_add(PugController.mapList,mapName)
                    PugController.mapPickerTeam=0 //switch to red team
                    PugController.mapsPickedCount+=1
                
                    var message,switchString;
                    switchString=P_RED+"RED's"+C_WHITE+" turn to pick."
                    if PugController.mapsPickedCount==5{
                        switchString="Maps shuffled!"
                    }
                    
                    chat_sendmsg(global.chatPrintPrefix+P_BLUE+"BLUE team"+C_WHITE+" picked: "+C_GREEN+mapName+C_WHITE+"! "+switchString)
                    if PugController.mapsPickedCount<global.pugVoteMaps{
                        break;
                    }
                }
            }
            
            //Shuffle the maps and set a new rotation, then end the map
            ds_list_shuffle(PugController.mapList)
            ds_list_insert(PugController.mapList,0,ds_list_find_value(PugController.mapList,0)) //duplicate the first map so it doesnt get skipped
            //load_map_rotation_custom(PugController.mapList,0)
            var mapString;
            mapString=""
            
            for (i=1; i<ds_list_size(PugController.mapList); i+=1){
                
                mapString+=string(ds_list_find_value(PugController.mapList,i))+", "
            }
            mapString=string_delete(mapString,string_length(mapString)-1,2)
            
            chat_sendmsg(global.chatPrintPrefix+C_WHITE+"The rotation is: "+C_GREEN+mapString)
            
            //Everything is done, start the PUG
            PugController.alarm[3]=150/global.delta_factor
            break;
            
        case PLAYER_TELEPORT:
            var xTele, yTele;
            xTele = read_ushort(socket)*5
            yTele = read_ushort(socket)*5
            
            if player.object!=-1{
                if instance_exists(player.object){
                    with(player.object){
                        if ((global.teleportAllowed==1) or (global.teleportAllowed==2 and global.jumpMode==1) or (player=ds_list_find_value(global.players,0))
                            or (global.teleportAllowed==3 and player=ds_list_find_value(global.RCONList,ds_list_find_index(global.players,player)))){
                            x=xTele
                            y=yTele
                        }
                    }
                }
            }
            break;
            
        //   
        //end of cases
        //
        }
        break;
    } 
}
