console_add_command('password', '
if (console_validate_args(1, arg[0], "password <new password>", true) == false)
{
    // No password given, remove the password
    global.serverPassword = "";
    console_print(COL_ORANGE + "Server password has been removed");
}
else
{
    if (global.serverPassword == arg[1])
    {
        console_print(COL_ORANGE + "Server password is already set to: " + COL_YELLOW + arg[1]);
    }
    else
    {
        global.serverPassword = string(arg[1]);
        console_print(COL_ORANGE + "Server password set to: " + COL_YELLOW + arg[1]);
    }
}
', '
console_print(COL_ORANGE + "Syntax: password <new password>");
console_print(COL_ORANGE + "Changes the server password to the given text");
console_print(COL_ORANGE + "Leave <new password> blank to remove the current password");
', CC_HOST_RCON);
