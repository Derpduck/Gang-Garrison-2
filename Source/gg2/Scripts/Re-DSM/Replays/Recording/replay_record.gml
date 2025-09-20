if (global.playingReplay or global.recordingReplay) exit;

var replayHeaderBuffer;
global.replayRecordBuffer = buffer_create();
global.recordingReplay = true;
global.continueReplayRecording = false;
replayHeaderBuffer = buffer_create();

// Write header data to replay
write_ubyte(replayHeaderBuffer, REPLAY_HEADER);
write_ubyte(replayHeaderBuffer, REPLAY_VERSION);
write_ushort(replayHeaderBuffer, VERSION);
write_ubyte(replayHeaderBuffer, global.frameratekind);

// Write join state to replay to simulate joining server and sync current game state
// Should mirror STATE_CLIENT_AUTHENTICATED in serviceJoiningPlayer
write_ubyte(replayHeaderBuffer, HELLO);

write_ubyte(replayHeaderBuffer, string_length(global.serverName));
write_string(replayHeaderBuffer, global.serverName);

write_ubyte(replayHeaderBuffer, string_length(global.currentMap));
write_string(replayHeaderBuffer, global.currentMap);

write_ubyte(replayHeaderBuffer, string_length(global.currentMapMD5));
write_string(replayHeaderBuffer, global.currentMapMD5);

write_ubyte(replayHeaderBuffer, global.serverPluginsRequired);

write_ushort(replayHeaderBuffer, string_length(GameServer.pluginList));
write_string(replayHeaderBuffer, GameServer.pluginList);

socket = replayHeaderBuffer;
ServerJoinUpdate(replayHeaderBuffer);

write_ushort(global.replayRecordBuffer, buffer_size(replayHeaderBuffer));
write_buffer(global.replayRecordBuffer, replayHeaderBuffer);

buffer_destroy(replayHeaderBuffer);

console_print(COL_PURPLE_LT + "Recording replay...");
//console_print(string(buffer_size(global.sendBuffer)));
//console_print(string(buffer_size(global.replayRecordBuffer)));
