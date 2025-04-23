// https://gmlscripts.com/script/hex_to_dec
var str, dec, dig, len, pos;

str = argument0;
dec = 0;
dig = "0123456789ABCDEF";
len = string_length(str);

for (pos = 1; pos <= len; pos += 1)
{
    dec = dec << 4 | (string_pos(string_char_at(str, pos), dig) - 1);
}

return dec;
