scale = max(0, argument0);

if (scale == 100)
    window_set_region_scale(-1, false);
else if (window_get_fullscreen())
{
    scale *= window_get_height() / global.ingameheight;
    window_set_region_scale(scale / 100, false);
}
else
    window_set_region_scale(scale / 100, false);

window_default();
