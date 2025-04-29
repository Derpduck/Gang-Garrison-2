console_add_command('execute', '
if (arg[0] >= 1)
{
    execute_string(arg[1]);
    console_print(COL_ORANGE + "Executed Code: " + arg[1]);
}
else
{
    console_print(COL_RED + "[ERROR] No code given to execute");
}
', '
console_print("Syntax: execute <code>);
console_print("Executes the given code immediately. Use with caution.");
', 0);
