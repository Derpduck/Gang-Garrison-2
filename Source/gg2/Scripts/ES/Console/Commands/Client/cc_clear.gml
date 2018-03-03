console_addCommand("clear", "
/*
//CLIENT
*/
if global.RCONSentCommand=1{
    console_print(C_PINK+'RCON: '+global.RCONSentCommand_PlayerName+' sent this command:')
    console_print(C_ORNGE+global.RCONCommand_out)
    exit
}

with Console{
    clearScreenTimer = 25
}
", "
console_print('Syntax: clear')
console_print('Clears the console.')
");
