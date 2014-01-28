x=0
while(sprite_exists(x)){
    if file_exists("Custom/"+sprite_get_name(x)+".png"){
        bboxleft = sprite_get_bbox_left(x)
        bboxright = sprite_get_bbox_right(x)
        bboxtop = sprite_get_bbox_top(x)
        bboxbottom = sprite_get_bbox_bottom(x)
        sprite_replace(x,"Custom/"+sprite_get_name(x)+".png",sprite_get_number(x),true,false,sprite_get_xoffset(x),sprite_get_yoffset(x))
        sprite_collision_mask(x,0,2,bboxleft,bboxtop,bboxright,bboxbottom,1,0)
    }
    x+=1
}
