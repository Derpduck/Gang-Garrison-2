// Prints the given string to the console, handling line breaks automatically for longer strings
// Plugins can use this to print info to the console
var input, previousInput, hasColorCode, characterWidth, maxLineLength, stringChunk, stringPosition, colorCode;
input = argument0;
hasColorCode = false;
characterWidth = 8;
maxLineLength = floor((global.consoleWidth - (global.consoleTextPadding * 2)) / characterWidth);

if (string_copy(input, 0, 3) == COL_FLAG)
{
    hasColorCode = true;
    maxLineLength += COLOR_RGB_LENGTH;
}

// Split string into new lines until it no longer exceeds the width of the console
while (string_length(input) > maxLineLength)
{
    previousInput = "";
    stringChunk = string_copy(input, 0, maxLineLength);
    stringPosition = 0;
    
    // If possible, create a line break at spaces
    if (string_count(" ", stringChunk) != 0)
    {
        // Get the last space in the string chunk
        stringPosition = 1 + string_length(stringChunk) - string_pos(" ", string_reverse(stringChunk));
        stringChunk = string_copy(stringChunk, 0, stringPosition);
    }
    
    // Add line to the console history
    // If there were no spaces within character limit, insert line break at the end of the string
    ds_list_add(global.consoleOutputHistory, stringChunk);
    
    // Move onto next line
    if (stringPosition != 0)
    {
        previousInput = input;
        input = string_copy(input, stringPosition + 1, string_length(input));
    }
    else
    {
        previousInput = input;
        input = string_copy(input, maxLineLength + 1, string_length(input));
    }
    
    // If a color code was at the start of this line, prepend it to the next line of text
    if (hasColorCode)
    {
        input = string_copy(previousInput, 0, COLOR_RGB_LENGTH) + input;
    }
}

// Add any remaining text to the console history
ds_list_add(global.consoleOutputHistory, input);

// Limit console log to max size
while (ds_list_size(global.consoleOutputHistory) > global.consoleOutputHistoryMax)
{
    ds_list_delete(global.consoleOutputHistory, 0);
}
