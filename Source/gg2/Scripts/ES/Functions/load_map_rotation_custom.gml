//Loads a map rotation from a custom list

//argument0=list to get rotation from
//argument1=shuffle rotation
customRotationList=argument0
shuffleCustomRotation=argument1

if room!=Gang_Garrison_2{
    ds_list_destroy(global.map_rotation)
}
global.map_rotation = ds_list_create();

for (i=0; i<ds_list_size(customRotationList); i+=1){
    ds_list_add(global.map_rotation,ds_list_find_value(customRotationList,i))
}

global.customMapdesginated = 1

var map, i;
if (shuffleCustomRotation) {
    with(ModController){
        alarm[0]=20/global.delta_factor
    }
}
