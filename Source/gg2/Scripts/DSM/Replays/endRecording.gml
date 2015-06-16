global.recordingReplay = false;
var text, name, currentDate, timestamp, serverMap, uniqueSuffix, nextUniqueSuffixNr, filename;

write_ushort(global.replayBuffer, 1);
write_ubyte(global.replayBuffer, REPLAY_END);

currentDate = date_current_datetime();
timestamp = string(date_get_year(currentDate)) + "-";
if (date_get_month(currentDate) < 10) { timestamp = timestamp + "0"; }
timestamp += string(date_get_month(currentDate)) + "-";
if (date_get_day(currentDate) < 10) { timestamp = timestamp + "0"; }
timestamp += string(date_get_day(currentDate)) + " ";
if (date_get_hour(currentDate) < 10) { timestamp = timestamp + "0"; }
timestamp += string(date_get_hour(currentDate)) + "-";
if (date_get_minute(currentDate) < 10) { timestamp = timestamp + "0"; }
timestamp += string(date_get_minute(currentDate)) + "-";
if (date_get_second(currentDate) < 10) { timestamp = timestamp + "0"; }
timestamp += string(date_get_second(currentDate))

var evilChars, sanitised, i;
evilChars = '<>:"/\|?*';
sanitised = " " + global.joinedServerName;
for(i = 1; i <= string_length(evilChars); i += 1)
    sanitised = string_replace_all(sanitised, string_char_at(evilChars, i), '_');
if (!directory_exists(working_directory + "\Replays\"))
    directory_create(working_directory+"\Replays\");
filename = working_directory+"\Replays\" + timestamp + sanitised + ".gg2r";
write_buffer_to_file(global.replayBuffer, filename);
buffer_clear(global.replayBuffer);
console_print('Replay saved as: ' + filename);
