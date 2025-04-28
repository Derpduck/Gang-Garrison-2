console_add_command("test", "
for (args=0; args<inputArguments; args+=1)
{
    console_print(COL_YELLOW + arg[args]);
};
", "", 0)
