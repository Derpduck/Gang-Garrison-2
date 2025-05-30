var LIMIT;
LIMIT = 30;

if (argument0 == "")
    return "None (default hitsound)";
else if (string_length(argument0) <= LIMIT)
    return argument0;
else
    return "..." + string_copy(argument0, string_length(argument0)-(LIMIT-3-1), LIMIT-3);
