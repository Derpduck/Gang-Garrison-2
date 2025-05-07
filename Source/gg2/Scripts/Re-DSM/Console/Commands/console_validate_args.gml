// Checks if command has the correct number of arguments
var required, actual, syntax;
required = argument0;
actual = argument1;
syntax = argument2;

if (actual < required)
{
    console_print(COL_RED + "[ERROR] Incorrect number of arguments given, " + string(required) + " required");
    console_print(COL_RED + "[ERROR] Syntax: " + syntax);
    return false;
}

return true;
