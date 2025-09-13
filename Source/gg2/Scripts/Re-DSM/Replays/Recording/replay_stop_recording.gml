if (!global.recordingReplay or global.playingReplay) exit;

global.recordingReplay = false;

if (global.replaysContinuous)
    global.continueReplayRecording = true;

var replayFileName, fpsName;
if (global.frameratekind == 1)
    fpsName = "(60 FPS)";
else
    fpsName = "(30 FPS)";

replayFileName = generate_stamped_filename("", fpsName, "rply");

// Write replay end byte
write_ushort(global.replayRecordBuffer, 1);
write_ubyte(global.replayRecordBuffer, REPLAY_END);

// Save replay to file
write_buffer_to_file(global.replayRecordBuffer, working_directory + "\DSM\Replays\" + replayFileName);
buffer_destroy(global.replayRecordBuffer);

console_print(COL_PURPLE_LT + "Replay saved: " + COL_YELLOW + "/../DSM/Replays/" + replayFileName);
