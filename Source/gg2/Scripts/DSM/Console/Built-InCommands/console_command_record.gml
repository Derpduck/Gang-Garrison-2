console_addCommand("record", "
if (input[1] == 'start' and !global.recordingReplay)
{
    console_print('Recording Replay.');
    beginRecording();
}
if (input[1] == 'stop' and global.recordingReplay)
{
    endRecording();
}
", "
console_print('Syntax: record <start/stop>')
console_print('Use: Begins/stops a replay recording.')
")
