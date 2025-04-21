// Reverses given string input
var input, length, output, stackSize;
input = string(argument0);
length = string_length(input);
output = "";

stack = ds_stack_create();

// Add each character into the stack individually
for (i=1; i<length + 1; i+=1)
{
    ds_stack_push(stack, string_char_at(input, i));
};

// Take characters from the stack and push them into a string, putting them in reverse order
stackSize = ds_stack_size(stack);
for (i=0; i<stackSize; i+=1)
{
    output += ds_stack_pop(stack);
};

ds_stack_destroy(stack);

return output;
