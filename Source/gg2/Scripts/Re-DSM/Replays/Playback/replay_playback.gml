if (global.playingReplay)
{
    if (global.myself == -1)
    {
        global.myself = instance_create(0, 0, Player);
        instance_create(0, 0, PlayerControl);
    }

    var bufferLength, timescale;
    
    if (global.replayPaused)
        timescale = 0;
    else
        timescale = global.replayTimescale / 100;
        
    // Correct playback for framerate and timescale
    if (global.replayFramerate == 1 and global.frameratekind == 0) // 60 FPS replay / 30 FPS client
        global.ticksToRead += 2 * timescale;
    else if (global.replayFramerate == 0 and global.frameratekind == 1) // 30 FPS replay / 60 FPS client
        global.ticksToRead += 0.5 * timescale;
    else
        global.ticksToRead += 1 * timescale; // Replay and client FPS match
    
    // Change playback speed with timescale
    
    //global.replayTimescale
    
    if (global.ticksToRead >= 1)
    {
        for(a=0; a < global.ticksToRead; a+=1)
        {
            // Get length of next buffer packet
            bufferLength = read_ushort(global.replayBuffer);
            
            for(i = 0; i < bufferLength; i += 1)
            {
                // Read next buffer packet and send data to the client
                write_ubyte(global.replaySocket, read_ubyte(global.replayBuffer));
            }
            
            global.replayTick += 1;
            global.replayLastReadTick = global.replayTick;
        }
        
        global.ticksToRead = 0;
        
        // Simulate server sending data to client
        socket_send(global.replaySocket);
    }
    
    // Ensure game always runs at correct speed
    io_handle();
}
