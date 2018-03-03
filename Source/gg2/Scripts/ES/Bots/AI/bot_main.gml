nearestEnemy=-1

nearestEnemy=bot_get_nearest_enemy()

// Target Selection
while target == -1{
    switch (task){
        case 'roam':
        case 'objective':

            if instance_exists(Intelligence) or instance_exists(IntelligenceBase){
                bot_ctf()
            }else if instance_exists(KothControlPoint){
                target = instance_nearest(object.x, object.y, KothControlPoint)
            }else if instance_exists(ArenaControlPoint){
                if nearestEnemy != -1{
                    task = 'hunt'
                }else{
                    target = ArenaControlPoint
                }
            }else if instance_exists(KothRedControlPoint){
                switch (team){
                    case TEAM_RED:
                        target = KothBlueControlPoint
                        break;
                    case TEAM_BLUE:
                        target = KothRedControlPoint
                        break;
                }
            }else if instance_exists(Generator){
                target = Generator
            }else if instance_exists(ControlPoint){
                bot_cp()
            }else{
                bot_default()
            }

            break;

        case 'hunt':

            if nearestEnemy != -1{
                target = nearestEnemy
            }else{
                switch (team){
                    case TEAM_RED:
                        target = SpawnPointBlue
                        break;
                    case TEAM_BLUE:
                        target = SpawnPointRed
                        break;
                }
            }
            break
    }
    
    if target != -1{
        if target.x < object.x and ds_list_empty(directionList) and !wasFighting{
            dir = -1
        }else if ds_list_empty(directionList) and !wasFighting{
            dir = 1
        }
    }
}

if task == 'hunt' and nearestEnemy != -1 and target != nearestEnemy{
    target = nearestEnemy
    ds_list_clear(directionList)
}

// Aiming and Fighting
if nearestEnemy != -1{
    //bot_aim()

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
            jump = 1
        }

        switch (class){
            case CLASS_SCOUT:
                bot_aim()
                scout_ai()
                break
            
            case CLASS_PYRO:
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
}

if class == CLASS_MEDIC{
    medic_ai()
}

aimDistance=min(255, point_distance(object.x, object.y, target_x, target_y)/2)

/*
// Movement
if instance_number(Node) > 0 and target != -1{
    node = collision_circle(object.x, object.y, 3, Node, 0, 1)
    if node >= 0{
        if !touchingNode{
            if !ds_list_empty(directionList){
                if ds_list_find_value(directionList, 0) != node{                
                    get_node_list(node)
                }else{            
                    ds_list_delete(directionList, 0)// Cross this node off the list
                    
                    if !ds_list_empty(directionList){
                        command = ds_list_find_value(node.commands, ds_list_find_index(node.connections, ds_list_find_value(directionList, 0)))

                        if abs(command) > 1{
                            jump = 1
                        }

                        dir = sign(command)
                    }

                    touchingNode = 1

                    stuckTimer = 0
                }
            }else{
                get_node_list(node)
            }
        }
    }else{
        touchingNode = 0
    }
    
    // Predict a collision, to brake before getting there. That way the bot can change direction correctly
    node = collision_circle(object.x+object.hspeed*3+(object.runPower*object.controlFactor)*9, object.y+object.vspeed*3+(0.2*power(3, 2))*sign(collision_point(object.x, object.y, Obstacle, 1, 1)), 5, Node, 0, 1)
    if node >= 0{    
        if !ds_list_empty(directionList){
            if ds_list_find_index(directionList, node) >= 0{            
                command = ds_list_find_value(node.commands, ds_list_find_index(node.connections, ds_list_find_value(directionList, ds_list_find_index(directionList, node)+1)))
                
                dir = sign(command)
            }
        }
    }
}


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

bot_avoid_obstacle()


if global.path==-2{
    //show_message("a")
//    global.path=plan_path(global.mesh,object.x,object.y,nearestEnemy.x,nearestEnemy.y)
    //show_message("b")
}

//if update_position(global.mesh,global.path,object.x,object.y,(bbox_right-bbox_left)/2)==-2{
//    show_message("c")
//    global.path=plan_path(global.mesh,object.x,object.y,nearestEnemy.x,nearestEnemy.y)
//    show_message("d")
//}
//dir=get_input(global.path,object.x,object.y,object.hspeed,object.vspeed)
//show_message("e")


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
