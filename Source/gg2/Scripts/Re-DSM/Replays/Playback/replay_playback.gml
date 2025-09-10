if (global.playingReplay)
{
    if (global.myself == -1)
    {
        global.myself = instance_create(0, 0, Player);
        instance_create(0, 0, PlayerControl);
    }
    
    var length;
    for(a=0; a < global.replayTimescale; a+=1)
    {
        length = read_ushort(global.replayBuffer);
        for(i = 0; i < length; i += 1)
        {
            write_ubyte(global.replaySocket, read_ubyte(global.replayBuffer));
        }
        global.replayTick += 1;
    }
    socket_send(global.replaySocket);
}
