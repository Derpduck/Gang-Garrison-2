//arena mode - prevent change of team or class
//before the round starts
//otherwise the player can't respawn until next round
if instance_exists(ArenaHUD) and global.isLive==1{
    if ArenaHUD.roundStart == 0 && ArenaHUD.endCount == 0 && global.myself.object != -1{
        exit;
    }
}

if global.smallSelectMenu==0{
    if (!global.mapchanging){
        TeamSelectController.done = true;
        if !instance_exists(ClassSelectController){
            instance_create(0,0,ClassSelectController);
        }else{
            ClassSelectController.done = true;
        }
    }else{
        ClassSelectController.done = true;
    }
}else{
    if (!global.mapchanging){
        SmallTeamSelect.done = true;
        if !instance_exists(SmallClassSelect){
            instance_create(0,0,SmallClassSelect);
        }else{
            SmallClassSelect.done = true;
        }
    }else{
        SmallClassSelect.done = true;
    }
}
