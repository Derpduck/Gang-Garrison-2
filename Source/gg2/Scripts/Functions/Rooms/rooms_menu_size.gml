switch(global.resolutionkind){
case 0: // 5:4
    global.roomwidth = 900;
    global.roomheight = 720;
    break;
case 1: // 4:3
    global.roomwidth = 960; //1024
    global.roomheight = 720; //768
    break;
case 2: // 16:10
    global.roomwidth = 1152;
    global.roomheight = 720;
    break;
case 3: // 16:9
    global.roomwidth = 1280;
    global.roomheight = 720;
    break;
case 4: // 2:1
    global.roomwidth = 1440;
    global.roomheight = 720;
    break;
}

var maprooms, nummaps;
nummaps = 7;

maprooms[0] = Menu
maprooms[1] = Options
maprooms[2] = ModOptions
maprooms[3] = Lobby
maprooms[4] = DownloadRoom
maprooms[5] = Options
maprooms[6] = BuilderOptions

for(i = 0; i < nummaps; i += 1){
    room_set_width(maprooms[i],global.roomwidth)
    room_set_height(maprooms[i],global.roomheight)
    room_set_view(maprooms[i], 0, true, 0, 0, global.roomwidth, global.roomheight,  0, 0, global.roomwidth, global.roomheight, 0, 0, 0, 0, noone);
}
