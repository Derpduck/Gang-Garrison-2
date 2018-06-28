//Behaviour of each task

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
            //dir = -1
        }else if ds_list_empty(directionList) and !wasFighting{
            //dir = 1
        }
    }
}

if task == 'hunt' and nearestEnemy != -1 and target != nearestEnemy{
    target = nearestEnemy
    ds_list_clear(directionList)
}
