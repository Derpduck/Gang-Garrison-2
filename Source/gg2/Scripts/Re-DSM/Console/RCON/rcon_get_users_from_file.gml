// Get all saved RCON user from file, create a file if it doesn't exist
global.rconSavedUsers = ds_map_create();

if (global.rconEnabled)
{
    if (file_exists(working_directory + "\DSM\RCON_Users.txt"))
    {
        var rconFile, rconLine, rconIP, rconName;
        rconFile = file_text_open_read(working_directory + "\DSM\RCON_Users.txt");
        
        while !file_text_eof(rconFile)
        {
            rconLine = file_text_read_string(rconFile);
            rconIP = string_copy(rconLine, 1, string_pos("@", rconLine) - 1);
            rconName = string_copy(rconLine, string_pos("@", rconLine) + 1, string_length(rconName));
            
            if (!ds_map_exists(global.rconSavedUsers, rconIP))
            {
                ds_map_add(global.rconSavedUsers, rconIP, rconName);
            }
            
            file_text_readln(rconFile)
        }
        
        file_text_close(rconFile);
    }
}
