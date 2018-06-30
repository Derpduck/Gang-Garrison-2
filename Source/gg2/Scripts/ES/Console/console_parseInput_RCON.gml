// Takes user input and tries to guess what it is.
// argument0 = user input string

// First step: Parse the arguments
var numOfCommands, parseString, pos, quote_pos;
numOfCommands = 0;
input = 0;
parseString = argument0;

parseString = string_replace_all(parseString, chr(10), " ");
parseString = string_replace_all(parseString, chr(13), " ");

while string_count(" ", parseString) > 0{
    pos = string_pos(" ", parseString)-1;
    quote_pos = string_pos('"', parseString);

    if quote_pos == 1{
        // Quotes starting here
        // Find the end quote
        pos = string_pos('"', string_copy(parseString, quote_pos+1, string_length(parseString)))-1;
        if pos < 0{
            // If there's none
            // Just copy the rest of the input
            pos = string_length(parseString);
        }else{
            parseString = string_copy(parseString, quote_pos+1, string_length(parseString));
        }
        
        input[numOfCommands] = string_copy(parseString, 0, pos);
        numOfCommands += 1;
        
        parseString = string_copy(parseString, pos+3, string_length(parseString));
    }else{
        input[numOfCommands] = string_copy(parseString, 0, pos);
        numOfCommands += 1;

        parseString = string_copy(parseString, pos+2, string_length(parseString));
    }
}
input[numOfCommands] = parseString;// For the last argument, there's no ' ' left.
numOfCommands += 1;

while numOfCommands <= 10{// Fill up until 10 arguments, that way there are no errors.
    input[numOfCommands] = "";
    numOfCommands += 1;
}

//Remove case sensitivity for command name
input[0]=string_lower(input[0])

// Second step: Find out what command it is and execute it.
if ds_map_exists(global.consoleCommandMap, input[0]){
    global.RCONSentCommand=1
    global.RCONSentCommand_PlayerName=argument1
    global.RCONCommand_out=argument0
    execute_string(ds_map_find_value(global.consoleCommandMap, input[0]));
    global.RCONSentCommand=0
}else{
    console_print(C_RED+"Unknown RCON command: "+input[0]);
    //console_print('Type "help" for a list of available commands.');
}

console_print('');