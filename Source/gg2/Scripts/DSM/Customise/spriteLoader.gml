x=0
while(sprite_exists(x)){
    if file_exists("Custom/"+sprite_get_name(x)+".png"){
        sprite_replace(x,"Custom/"+sprite_get_name(x)+".png",sprite_get_number(x),true,false,sprite_get_xoffset(x),sprite_get_yoffset(x))
    }
    x+=1
}
