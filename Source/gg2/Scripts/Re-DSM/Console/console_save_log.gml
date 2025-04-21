// Save console log to file
var datetime, logFile, logFileName;

datetime=string(date_datetime_string(date_current_datetime()))
{
    datetime=string_replace_all(datetime, "<", "_");datetime=string_replace_all(datetime, ">", "_");
    datetime=string_replace_all(datetime, ":", "_");datetime=string_replace_all(datetime, '"', "_");
    datetime=string_replace_all(datetime, "/", "_");datetime=string_replace_all(datetime, "\", "_");
    datetime=string_replace_all(datetime, "|", "_");datetime=string_replace_all(datetime, "?", "_");
    datetime=string_replace_all(datetime, "*", "_");datetime=string_replace_all(datetime, ".", "_");
}

DSM_logs_directory();

logFileName = "Console_" + datetime + ".txt"
logFile = file_text_open_write(working_directory + "\Logs\" + logFileName);

for(i=0; i<ds_list_size(global.consoleOutputHistory); i+=1){
    file_text_write_string(logFile, ds_list_find_value(global.consoleOutputHistory, i));
    file_text_writeln(logFile);
}

file_text_close(logFile);

console_print("Console log saved: /../Logs/" + logFileName);
