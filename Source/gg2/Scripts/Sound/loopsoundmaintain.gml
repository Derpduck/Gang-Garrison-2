{
    if global.isLive==0 and global.noSoundsDuringRUP==1{
        if !instance_exists(NoticeO){
            exit;
        }
    }
    sound_volume(argument2, calculateVolume(argument0, argument1));
    sound_pan(argument2, calculatePan(argument0));
}
