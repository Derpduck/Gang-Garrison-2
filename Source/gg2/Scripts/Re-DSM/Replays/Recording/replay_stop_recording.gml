if (!global.recordingReplay) exit;

global.recordingReplay = false;

var replayFileName;
replayFileName = generate_stamped_filename("", "rply");

write_ushort(global.replayRecordBuffer, 1);
write_ubyte(global.replayRecordBuffer, REPLAY_END);

write_buffer_to_file(global.replayRecordBuffer, working_directory + "\DSM\Replays\" + replayFileName);
buffer_destroy(global.replayRecordBuffer);

console_print(COL_PURPLE_LT + "Replay saved: " + COL_YELLOW + "/../DSM/Replays/" + replayFileName);
