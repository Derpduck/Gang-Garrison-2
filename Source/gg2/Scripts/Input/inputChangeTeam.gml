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
        ClassSelectController.done = true;
        if !instance_exists(TeamSelectController){
            instance_create(0,0,TeamSelectController);
        }else{
            TeamSelectController.done = true;
        }
    }else{
        TeamSelectController.done = true;
    }
}else{
    if (!global.mapchanging){
        SmallClassSelect.done = true;
        if !instance_exists(SmallTeamSelect){
            instance_create(0,0,SmallTeamSelect);
        }else{
            SmallTeamSelect.done = true;
        }
    }else{
        SmallTeamSelect.done = true;
    }
}
