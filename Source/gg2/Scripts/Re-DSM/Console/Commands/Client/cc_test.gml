console_add_command('test', '
for (i=1; i<arg[0]; i+=1)
{
    console_print(COL_ORANGE + arg[i]);
};
', '', 0)
