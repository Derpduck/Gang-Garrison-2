// Execute user input from console, splitting input into arguments
// argument0 = Input string
// argument1 = RCON player sending the command, if applicable
var input, inputArguments;
input = argument0 + " "; // Insert space on the end to run the splitting code on the last argument
inputArguments = 0;

// Don't declare these so they can be used in the executed commands
arg[0] = "";
originalInput = "";
rconPlayer = argument1;

// Sanitize newlines
input = string_replace_all(input, chr(10), " ");
input = string_replace_all(input, chr(13), " ");
input = string_replace_all(input, "\#", "#");
originalInput = string_delete(input, string_length(input), 1);

// Print user input
if (rconPlayer == -1)
{
    console_print(COL_ORANGE + ">" + COL_WHITE + originalInput);
}

// Split input into arguments at spaces until there are none left
while (string_count(" ", input) > 0)
{
    //show_message(input)
    var separatorIndex, startIndex, endIndex, quoteString;
    
    // Find the first space in the string; remove if it's the first character
    separatorIndex = string_pos(" ", input);
    
    if (separatorIndex == 1)
    {
        input = string_delete(input, 1, 1);
        continue;
    }
    
    // Find the first quote in the string
    startIndex = string_pos('"', input);

    // If argument starts with a quote
    if (startIndex == 1)
    {
        // Remove the first quote
        input = string_delete(input, 1, 1);
        
        // Find the end quote
        endIndex = string_pos('"', string_copy(input, 1, string_length(input)));
        quoteString = 1;
    }
    // Argument does not start with a quote
    else
    {
        startIndex = 1;
        
        // End when a space is reached
        endIndex = separatorIndex;
        quoteString = 0;
    }
        
    // If no end quote / following space is found; take the entire rest of the string as the argument (minus the last character for the added space)
    if (endIndex == 0)
    {
        arg[inputArguments] = string_copy(input, 1, string_length(input) - 1);
        input = "";
    }
    // End quote / following space exists; take the string up to the end quote / following space
    else
    {
        arg[inputArguments] = string_copy(input, 1, endIndex - 1);
        
        // Remove the copied argument and the ending quote from the input string
        input = string_copy(input, 1 + quoteString + string_length(arg[inputArguments]), string_length(input));
    }
    
    inputArguments += 1;
}

// Save the number of arguments to arg[0], excluding the command itself
consoleCommand = string_lower(arg[0]);
arg[0] = inputArguments - 1;

// Execute the command from the name given in the first argument
if (ds_map_exists(global.consoleCommandMap, consoleCommand))
{
    // Check command rules before executing
    var execute;
    execute = console_get_rules(ds_map_find_value(global.consoleCommandMapRules, consoleCommand), rconPlayer, originalInput);
    
    if (execute)
    {
        execute_string(ds_map_find_value(global.consoleCommandMap, consoleCommand));
    }
}
else
{
    console_print(COL_RED + "[ERROR] Unknown command: " + consoleCommand);
}
