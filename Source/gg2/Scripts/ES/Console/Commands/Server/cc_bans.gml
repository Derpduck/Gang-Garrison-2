console_addCommand("bans", "
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
for (i=0; i<ds_list_size(global.banned_ips); i+=1){
    console_print(string(real(i+1))+': '+ds_list_find_value(global.banned_ips,i))
    exit;
}
", "
console_print('Syntax: bans')
console_print('Lists every IP in your ban list.)
");
