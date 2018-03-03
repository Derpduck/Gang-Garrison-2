console_addCommand("record", "
/*
//HOST ONLY
*/
if global.RCONSentCommand=1{
    console_print(C_PINK+'RCON: '+global.RCONSentCommand_PlayerName+' sent this command:')
    console_print(C_ORNGE+global.RCONCommand_out)
    exit
}

if !global.isHost{
    console_print('Only the host can use this command.')
    exit;
}

if (!global.recordingReplay){
    beginRecording();
}
", "
console_print('Syntax: record')
console_print('Begins a replay recording.')
")
