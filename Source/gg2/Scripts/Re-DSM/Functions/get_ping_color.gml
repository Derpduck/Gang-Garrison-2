// Returns a color code for a given ping value
if (!string_is_real(string(argument0)))
{
    return c_gray;
}

if (argument0 >= 240)
    return c_red;
else if (argument0 >= 170)
    return c_orange;
else if (argument0 >= 130)
    return c_yellow;
else if (argument0 >= 60)
    return c_green;
else if (argument0 >= 0)
    return c_aqua;
else
    return c_gray;
