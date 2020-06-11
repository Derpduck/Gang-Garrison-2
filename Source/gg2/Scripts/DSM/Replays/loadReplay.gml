var name;
name = get_open_filename(working_directory+"\Replays\*.gg2r", "")
if file_exists(name){
    global.isPlayingReplay = true;
    buffer_clear(global.replayBuffer);
    append_file_to_buffer(global.replayBuffer, name)
}else{
    global.isPlayingReplay = false;
    exit;
}
global.replaySpeed = 1
global.replayTime = 0
