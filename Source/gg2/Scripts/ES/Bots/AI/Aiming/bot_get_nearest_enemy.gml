var targetQueue, testDist, playercheck, closestEnemy, nearestEnemy;

nearestEnemy = -1;
targetQueue = ds_priority_create();

// Build a queue of potential targets
with(Character) {
    testDist = distance_to_object(other);
    ds_priority_add(targetQueue, id, testDist);
}

with(Sentry) {
    testDist = distance_to_object(other);
    if(testDist) {
        ds_priority_add(targetQueue, id, testDist);
    }
}

//with(Generator) {
//    testDist = distance_to_object(other.object);
//    if(testDist) {
//        ds_priority_add(targetQueue, id, testDist);
//    }
//}
if ds_priority_size(targetQueue)>1{
ds_priority_delete_min(targetQueue) //Remove yourself
}
nearestEnemy = -1
closestEnemy = ds_priority_find_min(targetQueue)

while(nearestEnemy == -1 && !ds_priority_empty(targetQueue)) {
    playercheck = ds_priority_delete_min(targetQueue);
    if (playercheck.team != team && playercheck.ubered==0
        && collision_line(object.x,object.y,playercheck.x,playercheck.y,Obstacle,true,true)<0
        //&& collision_line(object.x,object.y,playercheck.x,playercheck.y,TeamGate,true,true)<0
        && collision_line(object.x,object.y,playercheck.x,playercheck.y,ControlPointSetupGate,true,true)<0
        && collision_line(object.x,object.y,playercheck.x,playercheck.y,IntelGate,true,true)<0
        && collision_line(object.x,object.y,playercheck.x,playercheck.y,BulletWall,true,true)<0){
        nearestEnemy = playercheck
    }
}

if nearestEnemy==-1{
if (playercheck.team != team && playercheck.ubered==0
        //&& collision_line(object.x,object.y,playercheck.x,playercheck.y,TeamGate,true,true)<0
        && collision_line(object.x,object.y,playercheck.x,playercheck.y,ControlPointSetupGate,true,true)<0
        && collision_line(object.x,object.y,playercheck.x,playercheck.y,IntelGate,true,true)<0){
        nearestEnemy = playercheck
    }
}
ds_priority_destroy(targetQueue);

target_in_sight = 1

//global.path=plan_path(global.mesh,object.x,object.y,nearestEnemy.x,nearestEnemy.y)

return nearestEnemy
