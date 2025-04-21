// Returns a color from a hex color code string given in the format <!>xxyyzz
var colorCode;

colorCode = string_upper(string_copy(argument0, 4, COLOR_RGB_LENGTH - 3));

return make_color_rgb(hex_to_dec(string_copy(colorCode, 1, 2)), hex_to_dec(string_copy(colorCode, 3, 2)), hex_to_dec(string_copy(colorCode, 5, 2)));
