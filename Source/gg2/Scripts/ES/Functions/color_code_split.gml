//Not for chat colour codes
//argument0=original colour code string to be checked and split into 3, split by commas
var oldCode, red, green, blue;
oldCode=string(argument0)

//Incorrect number of values
if string_count(",",oldCode)!=2{
    //show_message("Incorrect number of values for color code:#"+oldCode)
    return make_color_rgb(255,255,255)
    exit;
}
    

//Split into 3 numbers
//RED
red=real(string_copy(oldCode,0,string_pos(",",oldCode)-1))
oldCode=string_delete(oldCode,1,string_pos(",",oldCode))
//GREEN
green=real(string_copy(oldCode,0,string_pos(",",oldCode)-1))
oldCode=string_delete(oldCode,1,string_pos(",",oldCode))
//BLUE
blue=real(oldCode)

return make_color_rgb(red,green,blue);
