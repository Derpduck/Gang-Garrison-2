{
    var vol;
    vol = calculateVolume(argument0, argument1);
    if(vol==0) exit;
    
    if global.isLive==0 and global.noSoundsDuringRUP==1{
        if !instance_exists(NoticeO){
            exit;
        }
    }
    
    // Prevent crashes on Win8 (NT Kernel 6.2)
    if (global.NTKernelVersion >= 6.2)
        sound_stop(argument2);
    
    sound_volume(argument2, vol);
    sound_pan(argument2, calculatePan(argument0));
    sound_play(argument2);
}
