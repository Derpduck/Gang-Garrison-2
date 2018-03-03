console_addCommand("autostart", "
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

if global.autoStart==0{
    global.autoStart=1
    global.forceReady=1
    console_print('Rounds will now be automatically started.')
}else if global.autoStart==1{
    global.autoStart=0
    console_print('Rounds will no longer be automatically started.')
}
", "
console_print('Syntax: autostart')
console_print('Makes all subsequent rounds automatically start, with no ready-up period.')
")
