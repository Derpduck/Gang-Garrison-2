console_addCommand("log", "
/*
//CLIENT
*/
if global.RCONSentCommand=1{
    console_print(C_PINK+'RCON: '+global.RCONSentCommand_PlayerName+' sent this command:')
    console_print(C_ORNGE+global.RCONCommand_out)
    exit
}

global.commandLogged=1
with(Console){
    event_user(0)
}
with(ChatBox){
    event_user(0)
}
global.commandLogged=0
", "
console_print('Syntax: log')
console_print('Writes the console/chat log, in its current state, to a file regardless of logging setting.')
")
