global.recordingReplay = true;
global.replayRecordBuffer = buffer_create();

// TODO
// Write game settings to the beginning of the replay
// Game version and DSM version
// Frame rate

// Write current server state to the beginning of the replay
var joinBuffer;
joinBuffer = buffer_create();
write_ubyte(joinBuffer, HELLO);

write_ubyte(joinBuffer, string_length(global.serverName));
write_string(joinBuffer, global.serverName);

write_ubyte(joinBuffer, string_length(global.currentMap));
write_string(joinBuffer, global.currentMap);

write_ubyte(joinBuffer, string_length(global.currentMapMD5));
write_string(joinBuffer, global.currentMapMD5);

write_ubyte(joinBuffer, global.serverPluginsRequired);

write_ushort(joinBuffer, string_length(GameServer.pluginList));
write_string(joinBuffer, GameServer.pluginList);

socket = joinBuffer;
ServerJoinUpdate(joinBuffer);

write_ushort(global.replayRecordBuffer, buffer_size(joinBuffer));
write_buffer(global.replayRecordBuffer, joinBuffer);
buffer_destroy(joinBuffer);

console_print(COL_PURPLE_LT + "Recording replay...");
