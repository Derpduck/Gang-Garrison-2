console_add_command('record', '
if (!global.recordingReplay and !global.playingReplay)
{
    console_print(COL_ORANGE + "Starting replay recording", rconPlayer);
    replay_record();
}
else
{
    if (global.recordingReplay)
        console_print(COL_RED + "[ERROR] Replay is already being recorded", rconPlayer);
    
    if (global.playingReplay)
        console_print(COL_RED + "[ERROR] Cannot record a replay during playback", rconPlayer);
}
', '
console_print(COL_ORANGE + "Syntax: record");
console_print(COL_ORANGE + "Starts recording a replay");
', console_init_access_level('record', CC_HOST));
