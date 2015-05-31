with(Player)
{
    write_buffer(socket, global.sendBuffer);
    socket_send(socket);
}
if (global.recordingReplay)
{
    write_ushort(global.replayBuffer, buffer_size(global.sendBuffer));
    write_buffer(global.replayBuffer, global.sendBuffer);
}
buffer_clear(global.sendBuffer);

global.runningMapDownloads = 0;
global.mapBytesRemainingInStep = global.mapdownloadLimitBps/room_speed;
with(JoiningPlayer)
    if(state==STATE_CLIENT_DOWNLOADING)
        global.runningMapDownloads += 1;

acceptJoiningPlayer();        
with(JoiningPlayer)
    serviceJoiningPlayer();
