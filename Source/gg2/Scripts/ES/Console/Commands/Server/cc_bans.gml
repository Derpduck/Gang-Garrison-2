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

var nameLength, spacesNumber, spacesUsed;
nameLength=0
spacesNumber=20
spacesUsed=''

for (i=0; i<ds_list_size(global.banned_ips); i+=1){
    spacesUsed=''
    nameLength=string_length(ds_list_find_value(global.banned_names,i))
    spacesNumber=20-nameLength
    repeat(spacesNumber){
            spacesUsed=string_insert(' ',spacesUsed,0)
        }
    console_print(c_filter(ds_list_find_value(global.banned_names,i))+spacesUsed+' | IP: '+string(ds_list_find_value(global.banned_ips,i)))
    exit;
}
", "
console_print('Syntax: bans')
console_print('Lists every IP in your ban list.)
");
