console_addCommand("execute", "
/*
//CLIENT
*/
if global.RCONSentCommand=1{
    console_print(C_PINK+'RCON: '+global.RCONSentCommand_PlayerName+' sent this command:')
    console_print(C_ORNGE+global.RCONCommand_out)
    exit
}

execute_string(input[1]);
console_print(C_LPINK+'Executed code: '+input[1])
", "
console_print('Syntax: execute <code>);
console_print('Executes the given code immediately. Use with caution.');
");
