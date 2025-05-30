var iniHeader, optionName, defaultValue, iniValue;
iniHeader = argument0;
optionName = argument1;
defaultValue = argument2;

iniValue = ini_read_real(iniHeader, optionName, defaultValue);
ini_write_real(iniHeader, optionName, iniValue);

return iniValue;
