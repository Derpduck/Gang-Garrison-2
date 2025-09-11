if (global.recordingReplay)
{
    // TODO: Write current replay frame to allow for skipping / fast forwarding
    
    // Write short specifying length of buffer packet to be written / read from the replay
    write_ushort(global.replayRecordBuffer, buffer_size(global.sendBuffer));
    
    // Write all data sent from the server
    write_buffer(global.replayRecordBuffer, global.sendBuffer);
}
