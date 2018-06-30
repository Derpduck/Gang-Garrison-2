chat_addCommandSent("forceload", "
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
hostCheck=ds_list_find_index(global.players,global.chatCommandPlayerID)
rconCheck=0

for (i=0; i<ds_list_size(global.players); i+=1){
    RCONPlayer=ds_list_find_value(global.RCONList,i)
    if  real(global.chatCommandPlayerID)==real(RCONPlayer){
        rconCheck=1
    }
}

if rconCheck==0{
    if hostCheck!=0{
        chat_sendmsg(global.chatPrintPrefix+C_WHITE+'Only admins can use this command.')
        exit;
    }
}

success=-1

success=real(config_load(cfgName))

if success==1{
    config_print_load(0,cfgName)
    exit;
}else{
    exit;
}
", "
console_print('Syntax: forceload <config name>')
console_print('Loads the specified config in the server.')
")
