console_addCommand("maps", "
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

for (i=0; i<ds_list_size(global.map_rotation); i+=1){
    if i==GameServer.currentMapIndex{
        var arrow_string;
        console_print(C_LPINK+ds_list_find_value(global.map_rotation,i)+' <---');
    }else{
        console_print(ds_list_find_value(global.map_rotation,i));
    }
}
", "
console_print('Syntax: maps');
console_print('Shows a list of the maps in the rotation in the current order, however this may be inaccurate under certain circumstances. <--- denotes the current map.');
");
