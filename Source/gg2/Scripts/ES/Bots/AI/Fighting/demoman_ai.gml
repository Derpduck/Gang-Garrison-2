var enemyX,enemyY;
var weapon_speed,weapon_velocity,time,calc_y,calc_vspeed;
enemyX=nearestEnemy.x
enemyY=nearestEnemy.y

weapon_speed = 12
weapon_velocity = weapon_speed * sign(nearestEnemy.x-botPlayer.object.x)

if weapon_velocity-nearestEnemy.hspeed == 0{
    enemyX = nearestEnemy.x
    time = 0
}else{
    time = (nearestEnemy.x-botPlayer.object.x)/(weapon_velocity-nearestEnemy.hspeed)
    enemyX = botPlayer.object.x+(weapon_velocity*time)
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
        }
    }
    enemyY = calc_y
}else{
    enemyY = nearestEnemy.y
}
if time!=0{
    enemyY-=min(0.2/time,8)*power(time, 2)
}else{
    enemyY-=min(0.2,8)*power(time, 2)
}
if botPlayer.object.y<enemyY{
    enemyY-=(enemyY-botPlayer.object.y)/2
}else if botPlayer.object.y>enemyY{
    enemyY+=(enemyY-botPlayer.object.y)/2
}

aimDirection = point_direction(object.x, object.y, enemyX, enemyY)

// Always follow the movements of your opponent.
if (ds_list_empty(directionList) or task != 'objective') and target_in_sight{
    dir = sign(nearestEnemy.hspeed)
    
    if object.ubered{
        dir = sign(nearestEnemy.x-botPlayer.object.x)

        if abs(nearestEnemy.x-botPlayer.object.x) < 41{
            dir = 1
        }
    }
    
    if dir == 0{
        dir = sign(nearestEnemy.x-botPlayer.object)
    }
}

if(collision_line(botPlayer.object.x,botPlayer.object.y,enemyX,enemyY,Obstacle,true,true)<0
    && collision_line(botPlayer.object.x,botPlayer.object.y,enemyX,enemyY,TeamGate,true,true)<0
    && collision_line(botPlayer.object.x,botPlayer.object.y,enemyX,enemyY,ControlPointSetupGate,true,true)<0
    && collision_line(botPlayer.object.x,botPlayer.object.y,enemyX,enemyY,IntelGate,true,true)<0
    && collision_line(botPlayer.object.x,botPlayer.object.y,enemyX,enemyY,BulletWall,true,true)<0){
    LMB = 1
    if nearestEnemy!=botPlayer.object{
        with (botPlayer.object.currentWeapon){
            botTarget=other.nearestEnemy
        }
    }
}

RMB=0
if botDet==1{
    RMB=1
    botDet=0
}
target_x=enemyX
target_y=enemyY
