chat_addCommandSent("vmap", "
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
var newMap;
newMap=string_lower(input[1])

map_create_vote(global.chatCommandPlayerID,newMap)
", "
console_print('Syntax: vmap <map name>')
console_print('Creates a vote for the next map.')
")
