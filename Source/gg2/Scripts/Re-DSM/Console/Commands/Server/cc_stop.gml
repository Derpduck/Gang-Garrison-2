console_add_command('stop', '
if (global.recordingReplay and !global.playingReplay)
{
    console_print(COL_ORANGE + "Stopping replay recording", rconPlayer);
    replay_stop_recording(false);
}
else
{
    if (!global.recordingReplay)
        console_print(COL_RED + "[ERROR] Replay is not currently being recorded", rconPlayer);
    
    if (global.playingReplay)
        console_print(COL_RED + "[ERROR] Cannot stop recording during playback", rconPlayer);
}
', '
console_print(COL_ORANGE + "Syntax: stop");
console_print(COL_ORANGE + "Ends replay recording");
', console_init_access_level('stop', CC_HOST));
