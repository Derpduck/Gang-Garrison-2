if room==CustomMapRoom{
    exit;
}

var maskDir,mapList,currentMap,chosenMap;
mapList=ds_list_create()
maskDir=working_directory+"\Maps\*.png"

currentMap=file_find_first(maskDir,-1)
ds_list_add(mapList,currentMap)

while(currentMap)!=""{
    currentMap=file_find_next()
    if string_count("_plx",currentMap)==0{
        if string_count("mge_",currentMap)==0{
            ds_list_add(mapList,currentMap)
        }
    }
}
ds_list_delete(mapList,ds_list_size(mapList)-1)

//No maps found
if ds_list_size(mapList)<=0{
    sprite_replace(MapMenuBGS,ctf_conflictS,1,0,0,0,0)
    ds_list_destroy(mapList)
    exit;
}

chosenMap=ds_list_find_value(mapList,irandom_range(0,ds_list_size(mapList)))

/*
if room==DownloadRoom{
    if file_exists(working_directory+"\Maps\"+string(downloadMapName)+".png"){
        chosenMap=downloadMapName+".png"
    }
}
*/

sprite_replace(MapMenuBGS,working_directory+"\Maps\"+string(chosenMap),1,0,0,0,0)

//Try to eliminate some small maps that cause problems
while(sprite_get_height(MapMenuBGS)<159 or sprite_get_width(MapMenuBGS)<199){
    chosenMap=ds_list_find_value(mapList,irandom_range(0,ds_list_size(mapList)))
    sprite_replace(MapMenuBGS,working_directory+"\Maps\"+string(chosenMap),1,0,0,0,0)
}

instance_create(0,0,MapMenuBG)

file_find_close()
ds_list_destroy(mapList)
