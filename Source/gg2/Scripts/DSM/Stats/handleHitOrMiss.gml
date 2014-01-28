//argument0 is the player that owns the shot.
//argument1 is if the shot hit or miss.

//var shooter, hit;
//shooter=argument0
//hit=argument1

if global.recordStats==0 exit;

if argument1==1{
    argument0.stats[HIT]+=1
}else{
    argument0.stats[MISSED]+=1
}
