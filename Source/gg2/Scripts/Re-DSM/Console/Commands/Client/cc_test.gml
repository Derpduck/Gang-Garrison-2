console_add_command('test', '
for (i=1; i<=arg[0]; i+=1)
{
    console_print(COL_ORANGE + arg[i]);
};

if (console_validate_args(1, arg[0], "test") == false) exit;

console_get_player(arg[1], false)
', '', CC_CLIENT);
