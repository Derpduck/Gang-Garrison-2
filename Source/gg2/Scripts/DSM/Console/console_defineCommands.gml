//This defines all the built-in commands
//input[1] = first argument, input[2] = second, etc...

//it seems sticking a bracket in console_print will fuck it up, great parsing game maker as always

console_addCommand("help", "
if global.RCONSentCommand=1{
    console_print('RCON: '+global.RCONSentCommand_PlayerName+' sent this command.')
    exit;
}

var command;
command=Console.input[1]

if command == ''{
    var key;
    //User didn't ask any specific command, just give the general command list and infos.
    console_print('DSM '+string(DSM_VERSION_STRING)+' console;');
    console_print('');
    console_print('-Usage: Type in the wanted command followed by its arguments in this syntax: command argument1 argument2 argument3');
    //console_print('');
    console_print('-If an argument contains spaces, please surround it with '+chr(34)+' '+chr(34)+'.');
    console_print('-Some commands require Player IDs, the command '+chr(34)+'listPlayers'+chr(34)+' can show them to you.');
    console_print('-All commands are camel case, beginning with a lower case letter.');
    //console_print('');
    console_print('-The current command list:');
    key = ds_map_find_first(global.DSM_commandMap);
    console_print(key);
    for (i=0; i<ds_map_size(global.DSM_commandMap)-1; i+=1){
        key = ds_map_find_next(global.DSM_commandMap, key);
        console_print(key);
    }
    console_print('')
    console_print('For more details on each command, enter '+chr(34)+'help commandName'+chr(34)+'.')
    console_print('----------------------------------------------------------------------------------');
}else{
    if ds_map_exists(global.DSM_documentationMap, command){
        execute_string(ds_map_find_value(global.DSM_documentationMap, command));
    }else{
        console_print('No documentation could be found for that command.');
    }
}
", "
console_print('Try entering help once, not twice.');
");

//Other commands put into scripts to make them easier to look at
console_command_kick()
console_command_ban()
console_command_tempBan()
console_command_listBans()
console_command_listBans()
console_command_listPlayers()
console_command_clearScreen()
console_command_broadcast()
console_command_shuffleRotation()
console_command_endRound()
console_command_serverPassword()
console_command_execute()
console_command_quit()
console_command_nextMap()
console_command_classlimits()
console_command_kill()
console_command_time()
console_command_lock()
console_command_unlock()
console_command_bind()
console_command_unbind()
console_command_listBinds()
console_command_showRotation()
console_command_unmute()
console_command_rcon()
console_command_unban()
console_command_autokill()
console_command_record();
