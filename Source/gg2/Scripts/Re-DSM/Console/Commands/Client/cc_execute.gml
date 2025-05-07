console_add_command('execute', '
if (console_validate_args(1, arg[0], "execute <code>") == false) exit;

var code;
code = string_delete(originalInput, 1, string_length("execute "));

execute_string(code);
console_print(COL_ORANGE + "Executed Code: " + code);
', '
console_print("Syntax: execute <code>);
console_print("Executes the given code immediately. Use with caution.");
', CC_CLIENT);
