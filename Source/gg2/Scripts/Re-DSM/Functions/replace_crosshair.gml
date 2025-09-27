if (file_exists(global.CrosshairFilename) and global.CrosshairFilename != "")
{
    sprite_replace(CrosshairS,global.CrosshairFilename,1,global.CrosshairRemoveBG,false,0,0);
    sprite_set_offset(CrosshairS,sprite_get_width(CrosshairS)/2,sprite_get_height(CrosshairS)/2);
}
else
{
    //sprite_replace(CrosshairS,global.CrosshairFilename,1,global.CrosshairRemoveBG,false,0,0);
    //sprite_set_offset(CrosshairS,sprite_get_width(CrosshairS)/2,sprite_get_height(CrosshairS)/2);
    sprite_assign(CrosshairS, DefaultCrosshairS);
}
