
// Predicts the movements of the nearest enemy and aims

if class == CLASS_SCOUT{
    weapon_speed = 13+botPlayer.object.hspeed
}else if class == CLASS_SOLDIER{
    weapon_speed = 13
}else if class == CLASS_HEAVY{
    weapon_speed = 12
}else if class == CLASS_PYRO{
    weapon_speed = 8
}else if class == CLASS_ENGINEER{
    weapon_speed = 13+botPlayer.object.hspeed
}else if class == CLASS_MEDIC{
    weapon_speed = 9
}else if class != CLASS_SNIPER{
    weapon_speed = 13
}

if class == CLASS_SNIPER{
    predictedEnemy_x = nearestEnemy.x
    predictedEnemy_y = nearestEnemy.y
}else{
    weapon_velocity = weapon_speed * sign(nearestEnemy.x-object.x)

    if weapon_velocity-nearestEnemy.hspeed == 0{
        predictedEnemy_x = nearestEnemy.x
        time = 0
    }else{
        time = (nearestEnemy.x-botPlayer.object.x)/(weapon_velocity-nearestEnemy.hspeed)
        predictedEnemy_x = botPlayer.object.x+(weapon_velocity*time)
    }
    
    if time < 0{
        predictedEnemy_x = nearestEnemy.x
        time = 0
    }

    if !position_meeting(nearestEnemy.x, nearestEnemy.y+1, Obstacle){
                                            // This checks, or tries to check, the y positions of the target.
        calc_y = nearestEnemy.y             // It does this by iterating because there is no better solution.
        calc_vspeed = nearestEnemy.vspeed   // Also, this gets completely owned by stairs.

        time = min(150, time)
        
        for (i=0; i<=time; i+=1){
            calc_y += calc_vspeed
            calc_vspeed += 0.6
            if position_meeting(nearestEnemy.x+(nearestEnemy.hspeed*i), calc_y+(nearestEnemy.sprite_height-nearestEnemy.sprite_yoffset)+1, Obstacle){
                break
            }
        }
        predictedEnemy_y = calc_y
    }else{
        predictedEnemy_y = nearestEnemy.y
    }
    
    if class == CLASS_HEAVY{
        // Take in account; bullets also have gravity.
        predictedEnemy_y -= 0.15*power(time, 2)
    }else if class == CLASS_MEDIC{
        // So do needles
        predictedEnemy_y -= 0.2*power(time, 2)
    }
}

aimDirection = point_direction(botPlayer.object.x, botPlayer.object.y, predictedEnemy_x, predictedEnemy_y)

/*if (class == CLASS_SCOUT or class == CLASS_ENGINEER) and object.speed != 0// Bullets are modified by your momentum, compensate for that
{
    var vectorX, vectorY, X1, Y1, X2, Y2 distance;
    
    X1 = (predictedEnemy_x-object.x)
    Y1 = (predictedEnemy_y-object.y)
        
    vectorX = X1 - object.hspeed*time
    vectorY = Y1 - object.vspeed*time
    
    vectorX /= sqrt(power(vectorX, 2)+power(vectorY, 2))// Normalize the result
    vectorY /= sqrt(power(vectorX, 2)+power(vectorY, 2))
    
    aimDirection = point_direction(object.x, object.y, object.x+vectorX, object.y+vectorY)
}*/