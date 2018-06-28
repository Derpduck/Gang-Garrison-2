console_addCommand("binds","
/*
//CLIENT
*/
if global.RCONSentCommand=1{
    console_print(C_PINK+'RCON: '+global.RCONSentCommand_PlayerName+' sent this command:')
    console_print(C_ORNGE+global.RCONCommand_out)
    exit
}

special=string(input[1])

if special!=''{
    if special=='help'
    splash_set_main(false)
    splash_set_border(false)
    splash_set_interrupt(false)
    splash_set_size(1024,600)
    splash_set_interrupt(0)
    splash_show_web('https://github.com/Derpduck/Gang-Garrison-2/wiki/Non-Character-Key-Binds',0)
    exit;
}

var bindListSize,index;
bindListSize=ds_list_size(global.binds)
index=0
console_print(C_LBLUE+'Character Key Binds:')
while(index<bindListSize){
    console_print(string(chr(34))+string(chr(real(ds_list_find_value(global.binds,index))))+string(chr(34))+string(' ---> ')+string(ds_list_find_value(global.bindCommands,index)))
    index+=1
}

//Non-character binds
var bindListSizeCtrl,indexCtrl;
bindListSizeCtrl=ds_list_size(global.bindsCtrl)
indexCtrl=0
console_print(C_LBLUE+'Non-Character Key Binds:')
while(indexCtrl<bindListSizeCtrl){
    console_print(string(chr(34))+string(real(ds_list_find_value(global.bindsCtrl,indexCtrl)))+string(chr(34))+string(' ---> ')+string(ds_list_find_value(global.bindCommandsCtrl,indexCtrl)))
    indexCtrl+=1
}
", "
console_print('Syntax: binds')
console_print('Lists all binds assigned by the user.')
console_print('Append <list> to open the wiki page on non-character key binds.')
")
