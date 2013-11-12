var text, name, currentDate, timestamp, uniqueSuffix, uniqueSuffixNr;
//From screenshot code, so replays don't overwrite eachother with their autoname
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
timestamp += string(date_get_second(currentDate));
    
uniqueSuffix = "";
uniqueSuffixNr = 2;
while (file_exists("Replays/" + timestamp + uniqueSuffix + ".rp ")) {
    uniqueSuffix = " ("+string(uniqueSuffixNr)+")";
    uniqueSuffixNr += 1;
}

write_ushort(global.replayBuffer, 1)// Length of the coming message
write_ubyte(global.replayBuffer, REPLAY_END)

//name = get_save_filename(".rp",working_directory+"\Replays\Replay.rp")
name = get_save_filename(".rp",working_directory+"\Replays\"+global.currentMap+" "+timestamp + uniqueSuffix+".rp") 

if name != ""{
    text = file_bin_open(name, 1)
    while buffer_bytes_left(global.replayBuffer) > 0{
        file_bin_write_byte(text, read_ubyte(global.replayBuffer));
    }
    file_bin_close(text);
    
    buffer_clear(global.replayBuffer)
    global.recordingEnabled = 0
}
