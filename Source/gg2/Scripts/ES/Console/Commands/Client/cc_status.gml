console_addCommand("status", "
/*
//CLIENT
*/
if global.RCONSentCommand=1{
    console_print(C_PINK+'RCON: '+global.RCONSentCommand_PlayerName+' sent this command:')
    console_print(C_ORNGE+global.RCONCommand_out)
    exit
}

/*
console_print(global.joinedServerName)
//[IP]:[Port]
////[Version]
//[FPS]
console_print(global.currentMap) // - [Gamemode]
console_print(ds_list_size(global.players)+' / '+) //[Players] / [Player Limit] - [VIP Threshold]
//[Password Y/N]
//[Lobby Visible Y/N]
//[RCON Y/N]
*/

", "
console_print('Syntax: status')
console_print('Prints information about the server to console.')
")
