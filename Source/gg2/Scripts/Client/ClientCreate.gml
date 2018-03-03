{
    // Only one client object may exist at a time
    if(instance_number(object_index)>1) {
        nocreate=true;
        instance_destroy();
        exit;
    }
    nocreate=false;
    usePreviousPwd = false;
    // Prevent overwriting
    if (!variable_local_exists('skippedPlugins'))
        skippedPlugins = false;
    noUnloadPlugins = false;
    noReloadPlugins = false;
    
    global.players = ds_list_create();
    global.playerListExists=1
    global.deserializeBuffer = buffer_create();
    global.isHost = false;
    global.isRCON=0;
    
    global.clientChatBanList=ds_list_create()
    ds_list_clear(global.clientChatBanList)

    global.myself = -1;
    gotServerHello = false;
    returnRoom = Menu;
    downloadingMap = false;
    downloadMapBuffer = -1;
    
    global.serverSocket = tcp_connect(global.serverIP, global.serverPort);
    
    write_ubyte(global.serverSocket, HELLO);
    write_buffer(global.serverSocket, global.protocolUuid);
    socket_send(global.serverSocket);
    
    room_goto_fix(DownloadRoom);
}
