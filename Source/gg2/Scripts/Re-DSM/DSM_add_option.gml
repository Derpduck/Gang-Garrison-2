var iniHeader, optionName, defaultValue, iniValue;

iniValue = ini_read_real(iniHeader, optionName, defaultValue);
ini_write_real(iniHeader, optionName, iniValue);

return iniValue;
