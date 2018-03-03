console_addCommand("loadmaps", "
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

load_map_rotation()
console_print('Map rotation loaded from file.')
", "
console_print('Syntax: loadmaps')
console_print('Reloads the map rotation from file, clearing the current map rotation.')
")
