{
    if global.isLive==0 and global.noSoundsDuringRUP==1{
        if !instance_exists(NoticeO){
            exit;
        }
    }
    sound_stop(argument0);
}
