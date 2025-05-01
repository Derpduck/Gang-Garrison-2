var input, maxLineLength, inputList;
input = argument0;
maxLineLength = argument1;

input = string_replace_all(input, chr(13), chr(10));
input = string_replace_all(input, "#", "\#");

// Turn all existing line breaks into an unused character
//input = string_replace_all(input, chr(10), chr(127));

inputList = ds_list_create();

while (string_length(input) > maxLineLength)
{
    var stringChunk;
    stringChunk = string_copy(input, 1, maxLineLength);
    
    // If possible, create a line break at existing line breaks
    if (string_count(chr(10), stringChunk) != 0)
    {
        // Get the last existing line break in the string chunk
        stringChunk = string_copy(stringChunk, 0, 1 + string_length(stringChunk) - string_pos(chr(10), string_reverse(stringChunk)));
    }
    
    // Add line to the input list
    // If there were no existing line breaks within character limit, insert line break at the end of the string
    ds_list_add(inputList, stringChunk);
    
    // Remove the processed line from the remainder of the input
    input = string_copy(input, string_length(stringChunk) + 1, string_length(input));
}

// Add any remaining text to the input list
ds_list_add(inputList, input);


var output;
output = "";

for (i=0; i<ds_list_size(inputList); i+=1)
{
    var inputListString;
    inputListString = ds_list_find_value(inputList, i);
    
    if (string_count(chr(10), inputListString) > 0)
    {
        output += inputListString;
    }
    else
    {
        output += inputListString + chr(10);
    }
};

output = string_copy(output, 1, string_length(output) - 1);

ds_list_destroy(inputList);

return output;

// TODO: Not bug free but for now works well enough
// TODO: Fix various bugs with cursor placement
// TODO: Fix manually typed line breaks resulting in incorrect line length calculations
// TODO: Fix manually typed line breaks not showing text until after a few characters have been typed
// TODO: Fix text displaying more lines than can fit in the box causing it to overlap with the output
