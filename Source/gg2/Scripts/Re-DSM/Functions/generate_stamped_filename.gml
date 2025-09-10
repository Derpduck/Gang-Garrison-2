// Create a file name with the current date / time, server name, and map name
var prefix, extension;
prefix = string(argument0);
extension = string(argument1); // Without the "."

// Add separator for prefix if given
if (string_length(prefix) > 0)
    prefix += " ";

// Use system format for date and time
//var dateAndTime;
//dateAndTime = string(date_datetime_string(date_current_datetime()));

var currentDate, timestamp;
currentDate = date_current_datetime();
timestamp = string(date_get_year(currentDate)) + "-";
if (date_get_month(currentDate) < 10) { timestamp = timestamp + "0"; }
timestamp += string(date_get_month(currentDate)) + "-";
if (date_get_day(currentDate) < 10) { timestamp = timestamp + "0"; }
timestamp += string(date_get_day(currentDate)) + " ";
if (date_get_hour(currentDate) < 10) { timestamp = timestamp + "0"; }
timestamp += string(date_get_hour(currentDate)) + "-";
if (date_get_minute(currentDate) < 10) { timestamp = timestamp + "0"; }
timestamp += string(date_get_minute(currentDate)) + "-";
if (date_get_second(currentDate) < 10) { timestamp = timestamp + "0"; }
timestamp += string(date_get_second(currentDate));

// Add server name and map if possible
var serverMapName;
if (instance_exists(PlayerControl))
    serverMapName = " " + global.joinedServerName + " " + global.currentMap;
else
    serverMapName = "";

// Concatenate file name
var fileName;
fileName = prefix + timestamp + serverMapName;

// Sanitize file name
var invalidCharacters, i;
invalidCharacters = '<>:"/\|?*.';

for(i = 1; i <= string_length(invalidCharacters); i += 1)
    sanitised = string_replace_all(fileName, string_char_at(invalidCharacters, i), '_');

return fileName + "." + extension;
