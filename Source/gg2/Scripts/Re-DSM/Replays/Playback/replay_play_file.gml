var replayFile;
replayFile = get_open_filename(working_directory + "\DSM\Replays\*.rply", "");

if (file_exists(replayFile))
{
    global.playingReplay = true;
    global.isHost = false;
        
    global.replayBuffer = buffer_create();
    append_file_to_buffer(global.replayBuffer, replayFile);
    
    global.serverIP = 127.0.0.1;
    global.serverPort = global.hostingPort;
    instance_create(0, 0, Client);
    Client.returnRoom = Menu;
    
    global.replayTimescale = 1;
    global.replayTick = 0;
    
    return true;
}
else
{
    return false;
}
