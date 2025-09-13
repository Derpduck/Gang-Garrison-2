var replayFile;
replayFile = get_open_filename(working_directory + "\DSM\Replays\*.rply", "");

if (file_exists(replayFile))
{
    // Get replay from file and load replay as a client
    global.playingReplay = true;
    global.recordingReplay = false;
    global.isHost = false;
        
    global.replayBuffer = buffer_create();
    append_file_to_buffer(global.replayBuffer, replayFile);
    
    // TODO: Read first byte to check for REPLAY_HEADER (read short first)
    
    global.serverIP = 127.0.0.1;
    global.serverPort = global.hostingPort;
    instance_create(0, 0, Client);
    Client.returnRoom = Menu;
    
    // Time controls
    global.replayPaused = false;
    global.replayTimescale = 100;
    global.replayTick = 0;
    global.replayLastReadTick = global.replayTick;
    global.ticksToRead = 0;
    
    return true;
}
else
{
    return false;
}
