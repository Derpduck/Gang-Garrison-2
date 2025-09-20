if (!global.recordingReplay or global.playingReplay) exit;

global.recordingReplay = false;

// Was recording stopped automatically by a map change?
var mapChangeStop;
mapChangeStop = argument0;

// Continue recording if continuous recording is on, or if auto-record is on
if ((mapChangeStop)
    and ((global.replaysContinuous)
    or (mapChangeStop and global.isHost and global.replaysAutoRecordHost)
    or (mapChangeStop and !global.isHost and global.replaysAutoRecordClient)))
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
var saveReplay;
saveReplay = write_buffer_to_file(global.replayRecordBuffer, working_directory + "\DSM\Replays\" + replayFileName);
buffer_destroy(global.replayRecordBuffer);

if (saveReplay)
    console_print(COL_PURPLE_LT + "Replay saved: " + COL_YELLOW + "/../DSM/Replays/" + replayFileName);
else
    console_print(COL_RED + "[ERROR] Failed to save replay: " + + COL_YELLOW + "/../DSM/Replays/" + replayFileName);
