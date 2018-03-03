console_addCommand("unbind","
/*
//CLIENT
*/
if global.RCONSentCommand=1{
    console_print(C_PINK+'RCON: '+global.RCONSentCommand_PlayerName+' sent this command:')
    console_print(C_ORNGE+global.RCONCommand_out)
    exit
}

var bind;
bind=string_upper(input[1])

if string_pos('$',string(input[1])){
    bind=string_digits(bind)
    for (i = 0; i < ds_list_size(global.bindsCtrl); i+=1){
        if real(ds_list_find_value(global.bindsCtrl,i))==real(bind){
            ds_list_delete(global.bindsCtrl,i)
            ds_list_delete(global.bindCommandsCtrl,i)
            write_binds_to_file_special()
            console_print('Removed bind: '+string(bind))
            exit;
        }
    }
}else{
    for (i = 0; i < ds_list_size(global.binds); i+=1){
        if real(ds_list_find_value(global.binds,i))==real(ord(bind)){
            ds_list_delete(global.binds,i)
            ds_list_delete(global.bindCommands,i)
            write_binds_to_file()
            console_print('Removed bind: '+string(ord(bind)))
            exit;
        }
    }
}

//User tried to remove a bind that does not exist, or just failed the command.
console_print('Bind: '+string(bind)+' does not exist. Type <binds> for a list of all current binds.')
", "
console_print('Syntax: unbind <key>')
console_print('Removes the selected bind.')
")
