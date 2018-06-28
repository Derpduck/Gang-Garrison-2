var enemyX,enemyY;
var weapon_speed,weapon_velocity,time,calc_y,calc_vspeed;
enemyX=nearestEnemy.x
enemyY=nearestEnemy.y

weapon_speed = 13
weapon_velocity = weapon_speed * sign(nearestEnemy.x-object.x)

if weapon_velocity-nearestEnemy.hspeed == 0{
    enemyX = nearestEnemy.x
    time = 0
}else{
    time = (nearestEnemy.x-object.x)/(weapon_velocity-nearestEnemy.hspeed)
    enemyX = object.x+(weapon_velocity*time)
}

if time < 0{
    enemyX = nearestEnemy.x
    time = 0
}

if !position_meeting(nearestEnemy.x, nearestEnemy.y+1, Obstacle){  // This checks, or tries to check, the y positions of the target.
    calc_y = nearestEnemy.y                                        // It does this by iterating because there is no better solution.
    calc_vspeed = nearestEnemy.vspeed                              // Also, this gets completely owned by stairs.

    time = min(150, time)

    for (i=0; i<=time; i+=1){
        calc_y += calc_vspeed
        calc_vspeed += 0.6
        if position_meeting(nearestEnemy.x+(nearestEnemy.hspeed*i), calc_y+(nearestEnemy.sprite_height-nearestEnemy.sprite_yoffset)+1, Obstacle){
            break
        }else{
            enemyX+=nearestEnemy.hspeed/6
        }
    }
    enemyY = calc_y
}else{
    enemyY = nearestEnemy.y
}
//if time!=0{
//    enemyY-=min(0.2/time,8)*power(time, 2)
//}else{
//    enemyY-=min(0.2,8)*power(time, 2)
//}
//if global.myself.object.y<enemyY{
//    enemyY-=(enemyY-global.myself.object.y)/2
//}else if global.myself.object.y>enemyY{
//    enemyY+=(enemyY-global.myself.object.y)/2
//}

aimDirection = point_direction(object.x, object.y, enemyX, enemyY)

target_x=enemyX
target_y=enemyY
