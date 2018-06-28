// Pyro fighting behavior

if (ds_list_empty(directionList) or task != 'objective') and target_in_sight{
    dir = sign(nearestEnemy.x-botPlayer.object.x)

    if abs(nearestEnemy.x-botPlayer.object.x) < 41{
        dir = 1
    }
}

if dir == 0{
    dir = sign(nearestEnemy.x-botPlayer.object.x)
}

// M1 firing
if(collision_line(botPlayer.object.x,object.y,predictedEnemy_x,predictedEnemy_y,Obstacle,true,true)<0
    && collision_line(botPlayer.object.x,botPlayer.object.y,predictedEnemy_x,predictedEnemy_y,TeamGate,true,true)<0
    && collision_line(botPlayer.object.x,botPlayer.object.y,predictedEnemy_x,predictedEnemy_y,ControlPointSetupGate,true,true)<0
    && collision_line(botPlayer.object.x,botPlayer.object.y,predictedEnemy_x,predictedEnemy_y,IntelGate,true,true)<0
    && collision_line(botPlayer.object.x,botPlayer.object.y,predictedEnemy_x,predictedEnemy_y,BulletWall,true,true)<0)
    or object.ubered{
    //LMB = 1
}

// Airblasting rockets
var hs, vs, distance, factor
with Rocket{
    if team == other.botPlayer.team{
        // I only want to calculate enemy rockets.
        continue;
    }
    
    if point_distance(x, y, other.botPlayer.object.x, other.botPlayer.object.y) < 150{
        // 150=airblast range.
        hs = other.botPlayer.object.x-x
        vs = other.botPlayer.object.y-x
        distance = sqrt(power(hs, 2)+power(vs, 2));

        factor = 13/distance // 13=rocket_speed;

        hs *= factor // normalize the rocket-me vector, multiply it with 13 to make it the same length as the rocket speed, and compare the hspeed and vspeed.
        vs *= factor

        if distance > 42 and abs(hs-hspeed) < 5 and abs(vs-vspeed) < 5{
            //42=flamethrower_length; And I couldn't come up with something better to test whether the rocket is going to hit you.
            // airblast
            if sign(other.botPlayer.object.x-x)==sign(other.botPlayer.object.x-other.predictedEnemy_x){
                reflect_ai()
            }
            other.RMB = 1
            other.aimDirection = point_direction(other.botPlayer.object.x, other.botPlayer.object.y, x, y)
            other.LMB = 0
        }
    }
}

if reloadCounter > 0 or object.currentWeapon.ammoCount < 6{
    LMB = 0
    RMB = 0
    if reloadCounter <= 0{
        reloadCounter = 60// Chosen randomly. 50 to even start reloading.
    }
}
