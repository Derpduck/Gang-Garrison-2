var iniHeader, optionName, defaultValue, iniValue, useLowerLimit, lowerLimit, useUpperLimit, upperLimit;
iniHeader = argument0;
optionName = argument1;
defaultValue = argument2;
// Blank arguments default to 0, so extra check for the limits
useLowerLimit = argument3;
lowerLimit = argument4;
useUpperLimit = argument5;
upperLimit = argument6;

iniValue = ini_read_real(iniHeader, optionName, defaultValue);

// Apply limits
if (useLowerLimit)
    iniValue = max(iniValue, lowerLimit);
if (useUpperLimit)
    iniValue = min(iniValue, upperLimit);

ini_write_real(iniHeader, optionName, iniValue);

return iniValue;
