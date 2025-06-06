console_add_command('execute', '
if (console_validate_args(1, arg[0], "execute <code>") == false) exit;

var code;
code = string_delete(originalInput, 1, string_length("execute "));

execute_string(code);
console_print(COL_ORANGE + "Executed Code: " + COL_YELLOW + code);
', '
console_print(COL_ORANGE + "Syntax: execute <code>");
console_print(COL_ORANGE + "Runs the given text as GML code, use with caution");
', console_init_access_level('execute', CC_CLIENT));
