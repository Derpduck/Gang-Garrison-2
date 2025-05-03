// Prints the given string to the console, handling line breaks automatically for longer strings
// Plugins can use this to print info to the console
var input, characterWidth, maxLineLength;
input = sanitiseNewlines(argument0);
input = string_replace_all(input, chr(10), " ");
input = string_replace_all(input, chr(13), " ");
input = string_replace_all(input, "\#", "#");
characterWidth = 8;
maxLineLength = (global.consoleWidth - (global.consoleTextPadding * 2)) div characterWidth;

// If no color code is given at the start of the string, prepend white
if (string_copy(input, 0, 3) != COL_FLAG)
    input = COL_WHITE + input;

// Split string into new lines until it no longer exceeds the width of the console
// Include color codes in length calculation
while (string_length(input) > maxLineLength + (string_count(COL_FLAG, input) * COLOR_RGB_LENGTH))
{
    var stringChunk, colorCodeCount, lastColorCode;
    stringChunk = "";
    colorCodeCount = 0;
    
    // Get string chunk until it reaches the maxLineLength, taking into account color codes
    while (string_length(stringChunk) < maxLineLength + (colorCodeCount * COLOR_RGB_LENGTH))
    {
        stringChunk = string_copy(input, 1, maxLineLength + (colorCodeCount * COLOR_RGB_LENGTH));
        colorCodeCount = string_count(COL_FLAG, stringChunk);
        
        // If stringChunk has reached the max length, check for a cut off color code and prevent it from being split across 2 lines
        if (string_length(stringChunk) >= maxLineLength + (colorCodeCount * COLOR_RGB_LENGTH))
        {
            // Check if a color code is within COLOR_RGB_LENGTH of the end of the string + the next 2 characters after to capture a cut off COL_FLAG
            var colorCodeChunk, colorCodeIndex;
            colorCodeChunk = string_copy(input, string_length(stringChunk) - COLOR_RGB_LENGTH + 1, COLOR_RGB_LENGTH + 2);
            colorCodeIndex = string_pos(COL_FLAG, colorCodeChunk);
            
            if (colorCodeIndex != 0)
            {
                var colorCodeStart, colorCodeEnd, stringRemainder;
                // Get the length of the cut off code included in the current stringChunk
                colorCodeStart = string_copy(stringChunk, string_length(stringChunk) + colorCodeIndex - COLOR_RGB_LENGTH, string_length(stringChunk));
                
                // Copy the remainder of the code over, and the characters after it up to the number cut off
                colorCodeEnd = string_copy(input, 1 + string_length(stringChunk), COLOR_RGB_LENGTH);
                stringChunk += colorCodeEnd;
            }
        }
    }
    
    // If possible, create a line break at spaces
    if (string_count(" ", stringChunk) != 0)
    {
        // Get the last space in the string chunk
        stringChunk = string_copy(stringChunk, 0, 1 + string_length(stringChunk) - string_pos(" ", string_reverse(stringChunk)));
    }
    
    // Add line to the console history
    // If there were no spaces within character limit, insert line break at the end of the string
    ds_list_add(global.consoleOutputHistory, string_replace_all(stringChunk, "#", "\#"));
    
    // Get the last color code in the processed line
    lastColorCode = string_copy(stringChunk, string_length(stringChunk) - string_pos(string_reverse(COL_FLAG), string_reverse(stringChunk)) - 1, COLOR_RGB_LENGTH)
    
    // Remove the processed line from the remainder of the input
    input = string_copy(input, string_length(stringChunk) + 1, string_length(input));
    
    // Prepend the last color code from the previous line
    // If string starts with color code, skip
    if (input != "" and string_copy(input, 0, 3) != COL_FLAG)
    {
        input = lastColorCode + input;
    }
}

// Add any remaining text to the console history
ds_list_add(global.consoleOutputHistory, string_replace_all(input, "#", "\#"));

// Limit console log to max size
while (ds_list_size(global.consoleOutputHistory) > global.consoleOutputHistoryMax)
{
    ds_list_delete(global.consoleOutputHistory, 0);
}
