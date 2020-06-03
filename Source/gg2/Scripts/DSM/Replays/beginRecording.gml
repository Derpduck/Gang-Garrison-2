global.recordingReplay = true;
var tempBuffer;
tempBuffer = buffer_create();
write_ubyte(tempBuffer, HELLO);
write_ubyte(tempBuffer, string_length(global.serverName));
write_string(tempBuffer, global.serverName);
write_ubyte(tempBuffer, string_length(global.currentMap));
write_string(tempBuffer, global.currentMap);
write_ubyte(tempBuffer, string_length(global.currentMapMD5));
write_string(tempBuffer, global.currentMapMD5);
write_ubyte(tempBuffer, global.serverPluginsRequired);
write_ushort(tempBuffer, string_length(GameServer.pluginList));
write_string(tempBuffer, GameServer.pluginList);
socket = tempBuffer;
ServerJoinUpdate(tempBuffer);
write_ushort(global.replayBuffer, buffer_size(tempBuffer));
write_buffer(global.replayBuffer, tempBuffer);
buffer_destroy(tempBuffer);
console_print("Began recording replay.");
