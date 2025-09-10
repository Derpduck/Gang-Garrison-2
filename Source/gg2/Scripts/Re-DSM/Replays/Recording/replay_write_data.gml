if (global.recordingReplay)
{
    // TODO: Write current replay frame to allow for skipping / fast forwarding
    
    write_ushort(global.replayRecordBuffer, buffer_size(global.sendBuffer));
    write_buffer(global.replayRecordBuffer, global.sendBuffer);
}
