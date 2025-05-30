var iniHeader, optionName, defaultValue, iniValue;

iniValue = ini_read_string(iniHeader, optionName, defaultValue);
ini_write_string(iniHeader, optionName, iniValue);

return iniValue;
