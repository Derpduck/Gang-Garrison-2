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
console_print("Syntax: message <text>);
console_print("Sends all clients a notification bearing the message");
', CC_HOST_RCON);
