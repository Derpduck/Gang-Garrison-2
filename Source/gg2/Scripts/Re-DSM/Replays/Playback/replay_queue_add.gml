var playReplay, fromFolder;
playReplay = argument0; // 0 = Don't play, 1 = Play (Select a file if queue empty)
fromFolder = argument1; // 0 = Individual File, 1 = Folder

var replayFile;
if (!fromFolder)
{
    // Individual File
    replayFile = get_open_filename("Re-DSM Replay File (.rply)|*.rply", working_directory + "\DSM\Replays\*");
    
    if (file_exists(replayFile))
        ds_list_add(global.replayPlaybackQueue, replayFile);
    else
        return false;
}
else
{
    // Folder
    var selectedFolder fileName;
    selectedFolder = get_directory(working_directory + "\DSM\Replays\");
    
    if (selectedFolder == "")
        return false;
    
    // All all files in selected folder to queue
    fileName = file_find_first(selectedFolder + "\" + "*.rply", fa_readonly);
    
    while(fileName != "")
    {
        ds_list_add(global.replayPlaybackQueue, selectedFolder + "\" + fileName);
        fileName = file_find_next();
    }
    file_find_close();
}

if (playReplay)
    replay_play_file();

return true;
