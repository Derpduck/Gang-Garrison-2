//nearestEnemy=-1

nearestEnemy=bot_get_nearest_enemy()

//We don't have a task yet, so pick one
if task=="none"{
    bot_task(task)
}

//Run the behaviour for the current task
bot_task_behaviour()

// Aiming and Fighting
if nearestEnemy != -1{
    if botPath==-2{
        botPath=plan_path(global.mesh,botPlayer.object.x,botPlayer.object.y,nearestEnemy.x,nearestEnemy.y)
    }
    
    update_position(global.mesh,botPath,botPlayer.object.x,botPlayer.object.y,(bbox_right-bbox_left)/2)
    //if update_position(global.mesh,botPath,botPlayer.object.x,botPlayer.object.y,(bbox_right-bbox_left)/2)==-2{
        //free_path()
        //botPath=plan_path(global.mesh,botPlayer.object.x,botPlayer.object.y,nearestEnemy.x,nearestEnemy.y)
    //}
    //dir=get_input(botPath,botPlayer.object.x,botPlayer.object.y,botPlayer.object.hspeed,botPlayer.object.vspeed)
    
    if point_distance(object.x, object.y, nearestEnemy.x, nearestEnemy.y) < 350{
        if !wasFighting{
            wasFighting = 1
        }
        
        if task != 'objective' and target != nearestEnemy and !target_in_sight{
            ds_list_clear(directionList)
            target = nearestEnemy
        }

        // Some random jumping...
        if random(40)<4{
            //jump = 1
        }

        switch (class){
            case CLASS_SCOUT:
                bot_aim()
                scout_ai()
                break
            
            case CLASS_PYRO:
                bot_aim()
                pyro_ai()
                break

            case CLASS_SOLDIER:
                soldier_ai()
                break

            case CLASS_HEAVY:
                heavy_ai()
                break
                
            case CLASS_DEMOMAN:
                demoman_ai()
                break

            case CLASS_ENGINEER:
                engineer_ai()
                break
                
            case CLASS_SPY:
                spy_ai()
                break

            case CLASS_SNIPER:
                sniper_ai()
                break
                
            case CLASS_QUOTE:
                quote_ai()
                break
        }
    }else if wasFighting{
        if task != 'objective'{
            ds_list_clear(directionList)
            target = -1
        }
        wasFighting = 0
    }
}else if wasFighting{
    if task != 'objective'{
        ds_list_clear(directionList)
        target = -1
    }
    wasFighting = 0
}else if nearestEnemy==-1{
    bot_avoid_obstacle()
}

if class == CLASS_MEDIC{
    medic_ai()
}

aimDistance=min(255, point_distance(botPlayer.object.x, botPlayer.object.y, target_x, target_y)/2)

/*
// Stuck alarm handling
if stuckTimer != 0{
    if stuckTimer < -8 and stuckTimer >= -10{
        jump = 1
    }else if stuckTimer < -30{
        dir *= -1
        stuckTimer = 0
    }
}
*/

if dir == -1{
    left = 1
    right = 0
}else if dir == 1{
    left = 0
    right = 1
}

if abs(dir)>=2{
    jump=1
}

if reloadCounter > 0{
    reloadCounter -= 1
}

oldX = object.x
oldY = object.y
