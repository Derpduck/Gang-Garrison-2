var s, n;
s = argument0;
n = string_length(string_digits(s));
return n and n == string_length(s) - (string_char_at(s, 1) == "-") - (string_pos(".", s) != 0);
