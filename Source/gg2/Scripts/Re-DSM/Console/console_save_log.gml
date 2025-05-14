// Save console log to file
if (!global.saveConsoleLog) exit;

var datetime, logFile, logFileName;

datetime=string(date_datetime_string(date_current_datetime()))
{
    datetime=string_replace_all(datetime, "<", "_");datetime=string_replace_all(datetime, ">", "_");
    datetime=string_replace_all(datetime, ":", "_");datetime=string_replace_all(datetime, '"', "_");
    datetime=string_replace_all(datetime, "/", "_");datetime=string_replace_all(datetime, "\", "_");
    datetime=string_replace_all(datetime, "|", "_");datetime=string_replace_all(datetime, "?", "_");
    datetime=string_replace_all(datetime, "*", "_");datetime=string_replace_all(datetime, ".", "_");
}

logFileName = "Console_" + datetime + ".txt"
logFile = file_text_open_write(working_directory + "\DSM\Logs\" + logFileName);

for(i=0; i<ds_list_size(global.consoleOutputHistory); i+=1)
{
    var outputLine;
    outputLine = ds_list_find_value(global.consoleOutputHistory, i);
    
    // Remove color codes from log file
    while (string_count(COL_FLAG, outputLine) > 0)
    {
        outputLine = string_delete(outputLine, string_pos(COL_FLAG, outputLine), COLOR_RGB_LENGTH);
    }
    
    file_text_write_string(logFile, outputLine);
    file_text_writeln(logFile);
}

file_text_close(logFile);

console_print("Console log saved: /../DSM/Logs/" + logFileName);
