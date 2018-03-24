console_addCommand("bind", "
/*
//CLIENT
*/
if global.RCONSentCommand=1{
    console_print(C_PINK+'RCON: '+global.RCONSentCommand_PlayerName+' sent this command:')
    console_print(C_ORNGE+global.RCONCommand_out)
    exit
}
var bind, command,number;
command=string(input[2])
if command==''{
    console_print('Binding failed. No command specified.')
    exit;
}

/*
if input[3]!=''{
    command+=' '+string(input[3])
}
if input[4]!=''{
    command+=' '+string(input[4])
}
if input[5]!=''{
    command+=' '+string(input[5])
}
*/

if ord(input[1])!=0 and string_length(string(input[1]))==1{
    //Create a bind for a normal character
    bind=string_upper(input[1])
    if (ds_list_find_index(global.binds,ord(bind))==-1){
        ds_list_add(global.binds,ord(bind))
        ds_list_add(global.bindCommands,command)
        write_binds_to_file()
        console_print('Bound: '+string(chr(ord(bind)))+' ('+string(ord(bind))+') to: '+command)
        exit;
    }else{
        ds_list_replace(global.bindCommands,ds_list_find_index(global.binds,ord(bind)),command)
        write_binds_to_file()
        console_print('Overwrote bind: '+string(chr(ord(bind)))+' ('+string(ord(bind))+') to: '+command)
        exit;
    }
}else if string_pos('$',string(input[1])){
    //Create a bind for a non-character key, denote it with a $
    bind=string_digits(input[1])
    if (ds_list_find_index(global.bindsCtrl,bind)==-1){
        ds_list_add(global.bindsCtrl,string(real(bind)))
        ds_list_add(global.bindCommandsCtrl,command)
        write_binds_to_file_special()
        console_print('Bound: '+'Non-character key'+' ('+string(real(bind))+') to: '+command)
        exit;
    }else{
        ds_list_replace(global.bindCommandsCtrl,ds_list_find_index(global.bindsCtrl,bind),command)
        write_binds_to_file_special()
        console_print('Overwrote bind: '+'Non-character key'+' ('+string(real(bind))+') to: '+command)
        exit;
    }
}else{
    console_print('Binding failed. Trying to bind to invalid key.')
    exit;
}

//Somehow we failed...
console_print('Binding failed. Ensure the command is encased in quotes.')
", "
console_print('Syntax: bind <key> <command>')
console_print('Binds a console command to a typable key.')
")

