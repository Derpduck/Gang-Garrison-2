{
    with(Client)
        instance_destroy();
    portForwarded = true;
    if (global.attemptPortForward) {
        upnp_set_description("GG2 (TCP)")
        var discovery_error, forwarding_error;
        discovery_error = upnp_discover(2000);
        if (upnp_error_string(discovery_error) != "") {
            show_message(upnp_error_string(discovery_error))
            portForwarded = false;
        }else{
        forwarding_error = upnp_forward_port(string(global.hostingPort), string(global.hostingPort), "TCP", "0")
            if (upnp_error_string(forwarding_error) != "") {
                show_message(upnp_error_string(forwarding_error))
                portForwarded = false;
            }
        }
    }
    hostSeenMOTD = false;
    global.players = ds_list_create();
    global.playerListExists=1
    global.tcpListener = -1;
    global.serverSocket = -1;
    
    global.privChatRedBuffer = buffer_create();
    global.privChatBlueBuffer = buffer_create();
    global.privChatSpecBuffer = buffer_create();
    global.publicChatBuffer = buffer_create();
    global.chatBanList=ds_list_create()
    global.clientChatBanList=ds_list_create()
    ds_list_clear(global.clientChatBanList)
    //if global.defaultConfig!="" and global.currentConfig==""{
    //    config_load(argument0)
    //}
    //Bots
    global.totalBots=0
    
    global.banned_ips = ds_list_create();
    global.banned_names = ds_list_create();
    var text, str, name_str;
    if (file_exists("Banned_IPs.txt")){
        // If a list of banned ips exists, load them into the list
        text = file_text_open_read("Banned_IPs.txt")
        while not file_text_eof(text){
            str = file_text_read_string(text)
            name_str=string_copy(str,string_pos("@",str)+1,21)
            str = string_delete(str,string_pos("@",str),string_length(name_str)+1)
            file_text_readln(text)
            ds_list_add(global.banned_ips, str)
            ds_list_add(global.banned_names, name_str)
        }
        file_text_close(text);
    }
    
    global.rcon_ips = ds_list_create()
    global.rcon_names = ds_list_create()
    var rcon_text, rcon_str, rcon_name_str;
    if (file_exists("RCON_IPs.txt")){
        rcon_text = file_text_open_read("RCON_IPs.txt")
        while not file_text_eof(rcon_text){
            rcon_str = file_text_read_string(rcon_text)
            rcon_name_str=string_copy(rcon_str,string_pos("@",rcon_str)+1,21)
            rcon_str = string_delete(rcon_str,string_pos("@",rcon_str),string_length(rcon_name_str)+1)
            file_text_readln(rcon_text)
            ds_list_add(global.rcon_ips, rcon_str)
            ds_list_add(global.rcon_names,rcon_name_str)
        }
        file_text_close(rcon_text);
    }
    
    var i;
    serverId = buffer_create();
    for (i = 0; i < 16; i += 1)
        write_ubyte(serverId, irandom(255));
    
    serverbalance=0;
    balancecounter=0;
    frame = 0;
    updatePlayer = 1;
    impendingMapChange = -1; // timer variable used by GameServerBeginStep, when it hits 0, the server executes a map change to global.nextMap
    syncTimer = 0; //called in GameServerBeginsStep on CP/intel cap to update everyone with timer/caps/cp status
    
    // Player 0 is reserved for the Server.
    serverPlayer = instance_create(0,0,Player);
    serverPlayer.name = global.playerName;
    serverPlayer.permID=global.permIDCounter
    global.permIDCounter+=1
    ds_list_add(global.players, serverPlayer);
    ds_map_add(rupPlayers,serverPlayer,0)

    for (a=0; a<10; a+=1)
    {
        if (global.classlimits[a] >= global.playerLimit)
            global.classlimits[a] = 255;
    }
    
    global.tcpListener = tcp_listen(global.hostingPort);
    if(socket_has_error(global.tcpListener))
    {
        var dcMsgBox;
        dcMsgBox=instance_create(0,0,DisconnectMessage)
        dcMsgBox.msg="Unable to host: " + socket_error(global.tcpListener)
        instance_destroy();
        exit;
    }
    global.serverSocket = tcp_connect("127.0.0.1", global.hostingPort);
    if(socket_has_error(global.serverSocket))
    {
        var dcMsgBox;
        dcMsgBox=instance_create(0,0,DisconnectMessage)
        dcMsgBox.msg="Unable to connect to self. Epic fail, dude."
        instance_destroy();
        exit;
    }
    
    var loopbackStartTime;
    loopbackStartTime = current_time;
    do {
        if(current_time - loopbackStartTime > 500) // 0.5s should be enough to create a loopback connection...
        {
            var dcMsgBox;
            dcMsgBox=instance_create(0,0,DisconnectMessage)
            dcMsgBox.msg="Unable to host: Maybe the port is already in use."
            instance_destroy();
            exit;
        }
        serverPlayer.socket = socket_accept(global.tcpListener);
        io_handle(); // Make sure the game doesn't appear to freeze
    } until(serverPlayer.socket>=0);

    global.playerID = 0;
    global.myself = serverPlayer;
    if(global.rewardKey != "" and global.rewardId != "")
    {
        var challenge;
        challenge = rewardCreateChallenge();
        rewardAuthStart(serverPlayer, hmac_md5_bin(global.rewardKey, challenge), challenge, false, global.rewardId);
    }
    if(global.queueJumping)
        serverPlayer.queueJump = global.queueJumping;
    
    instance_create(0,0,PlayerControl);

    var map, i;
    if (global.shuffleRotation) {
        if global.shuffleRotation==3{
            with(ModController){
                alarm[0]=20/global.delta_factor
            }
        }else{
            ds_list_shuffle(global.map_rotation);
            map = ds_list_find_value(global.map_rotation, 0);
            // "Shuffle, don't make arena map first" chosen
            if (global.shuffleRotation == 1) {
                // if first map is arena
                if (string_copy(map, 0, 6) == 'arena') {
                    // try to find something else
                    for (i = 0; i < ds_list_size(global.map_rotation); i += 1) {
                        map = ds_list_find_value(global.map_rotation, i);
                        // swap with first map
                        if (string_copy(map, 0, 6) != 'arena') {
                            ds_list_replace(global.map_rotation, i, ds_list_find_value(global.map_rotation, 0));
                            ds_list_replace(global.map_rotation, 0, map);
                        }
                    }
                }
            }
        }
    }
    
    var mapName
    global.jumpMode=0
    mapName = ds_list_find_value(global.map_rotation, 0);
    if global.jumpMapMode==1{
        global.jumpMode=1
    }else if global.jumpMapMode==2{
        prefixIndex[0]="rj"
        prefixIndex[1]="dj"
        prefixIndex[2]="rr"
        prefixIndex[3]="sj"
        prefixIndex[4]="ej"
        prefixIndex[5]="qr"
        prefixIndex[6]="pj"
        prefixIndex[7]="jt"
        prefixIndex[8]="surf"
        prefixIndex[9]="jump"
        for (i=0; i<10; i+=1){
            if string_pos(prefixIndex[i],string_lower(mapName))==1{
                global.jumpMode=1
            }
        }
    }

    currentMapIndex = -1;
    global.currentMapArea = 1;
    
    if(global.launchMap == "")
        serverGotoMap(nextMapInRotation());
    else
        serverGotoMap(global.launchMap);
    
    global.joinedServerName = global.serverName; // so no errors of unknown variable occur when you create a server
    global.mapchanging = false; 
    
    GameServerDefineCommands();
    
    // load server-sent plugins, if any
    if (string_length(global.serverPluginList))
    {
        // Get hashes of latest versions for plugin list
        pluginList = getpluginhashes(global.serverPluginList);
        if (pluginList == 'failure')
        {
            show_message("Error ocurred getting server-sent plugin hashes.");
            game_end();
            exit;
        }
        
        if (string_length(pluginList) > 65535){
            show_message("Error: you are requiring too many server-sent plugins.");
            game_end();
            exit;
        }

        // Load plugins
        if (!loadserverplugins(pluginList))
        {
            show_message("Error ocurred loading server-sent plugins.");
            game_end();
            exit;
        }
        global.serverPluginsInUse = true;
    }
    else
    {
        pluginList = '';
    }
    
    // Disable vsync to minimize framerate drops which would be noticed as lag issues by all players.
    // "vsync makes the server desync" --Arctic
    set_synchronization(false);
}
