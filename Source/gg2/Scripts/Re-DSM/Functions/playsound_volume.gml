//Origin (x, y) of the sound, Sound to play
{
    var vol, isWindows8DotX;
    //vol = calculateVolume(argument0, argument1) * argument3;
    if(argument3==0) exit;
    
    // Prevent crashes on Win8 (NT Kernel 6.2)
    isWindows8DotX = (global.NTKernelVersion == 6.2 or global.NTKernelVersion == 6.3) and global.CurrentMajorVersionNumber == -1;
    if (isWindows8DotX or global.forceAudioFix)
        sound_stop(argument2);
    
    // We square root the volume twice to make the scale more accurate, don't ask my why it works that way for this and not global volume
    sound_volume(argument2, calc_linear_volume(calc_linear_volume(argument3)));
    //sound_pan(argument2, calculatePan(argument0));
    sound_play(argument2);
}
