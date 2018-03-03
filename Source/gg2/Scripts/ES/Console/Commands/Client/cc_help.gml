console_addCommand("help", "
/*
//CLIENT
*/
if global.RCONSentCommand=1{
    console_print(C_PINK+'RCON: '+global.RCONSentCommand_PlayerName+' sent this command:')
    console_print(C_ORNGE+global.RCONCommand_out)
    exit
}

var command;
command=input[1]//Console.input[1]

if command == ''{
    var key,temp_print;
    //console_print('Usage: Type in the wanted command followed by its arguments in this syntax: command argument1 argument2 argument3');
    console_print('If an argument contains spaces, surround it with '+chr(34)+' '+chr(34)+'.');
    console_print('For more details on each command, enter '+chr(34)+'help <command name>'+chr(34)+'.')
    //console_print('The current command list:');
    key = ds_map_find_first(global.consoleCommandMap);
    temp_print=string(key)+', '
    for (i=0; i<ds_map_size(global.consoleCommandMap)-1; i+=1){
        key = ds_map_find_next(global.consoleCommandMap, key);
        temp_print+=string(key)+', '
    }
    console_print(C_ORNGE+temp_print);
}else{
    if ds_map_exists(global.documentationMap, command){
        execute_string(ds_map_find_value(global.documentationMap, command));
    }else{
        console_print('No documentation could be found for that command.');
    }
}
", "
console_print('Syntax: help <command>');
console_print('Try entering help once, not twice.');
");
