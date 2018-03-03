chat_addCommandSent("shuffle", "
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

shuffle_create_vote(global.chatCommandPlayerID)
", "
console_print('Syntax: shuffle')
console_print('Creates a team shuffle vote. Usable in PUG mode.')
")
