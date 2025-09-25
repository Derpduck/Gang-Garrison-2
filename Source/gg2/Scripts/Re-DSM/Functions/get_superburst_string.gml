var uberCharge, superburstString;
uberCharge = string(round(argument0));

switch(string_length(uberCharge))
{
case 3:
    superburstString = "SUPERBURST:"
    break;
case 2:
    superburstString = "SUPERBURST: "
    break;
default:
    superburstString = "SUPERBURST:  "
    break;
}

return superburstString + uberCharge + "%";
