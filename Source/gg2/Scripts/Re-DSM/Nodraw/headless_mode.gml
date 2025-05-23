if (global.headlessMode)
{
    global.dedicatedMode = 1;
    set_automatic_draw(false);
    window_set_visible(false);
    discard_backgrounds();
    discard_sounds();
}
