var replayFile;

if (!ds_list_empty(global.replayPlaybackQueue))
{
    // Get next replay in the queue
    replayFile = ds_list_find_value(global.replayPlaybackQueue, 0);
    ds_list_delete(global.replayPlaybackQueue, 0);
}
else
{
    return false;
}

if (file_exists(replayFile))
{
    // Get replay from file and load replay as a client
    global.replayBuffer = buffer_create();
    global.playingReplay = true;
    global.recordingReplay = false;
    global.isHost = false;
    
    var readReplay;
    readReplay = append_file_to_buffer(global.replayBuffer, replayFile);
    
    if (!readReplay)
    {
        show_notification_message("Failed to read replay file.");
        buffer_destroy(global.replayBuffer);
        
        // Skip to next replay if we can't play this one
        if (!ds_list_empty(global.replayPlaybackQueue))
        {
            replay_play_file();
            return true;
        }
        return false;
    }
    
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
    // Skip to next replay if we can't play this one
    if (!ds_list_empty(global.replayPlaybackQueue))
    {
        replay_play_file();
        return true;
    }
    
    return false;
}
