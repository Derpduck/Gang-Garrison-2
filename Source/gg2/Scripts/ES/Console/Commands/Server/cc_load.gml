console_addCommand("load", "
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
success=-1

success=real(config_load(cfgName))

if success==1{
    config_print_load(0,cfgName)
    exit;
}else{
    exit;
}
", "
console_print('Syntax: load <config name>')
console_print('Loads the specified config in the server.')
")
