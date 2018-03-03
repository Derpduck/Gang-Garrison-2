chat_addCommandSent("load", "
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

cfgName=string(input[1])
config_create_vote(cfgName,global.chatCommandPlayerID)
", "
console_print('Syntax: load <config name>')
console_print('Requests the server to load the config.')
")
