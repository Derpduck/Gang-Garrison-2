with(Obstacle){
    solid = true;
}
with(IntelGate){
    if global.isLive==1 and global.spawnDoors==1{
        solid =  (team != other.team and other.intel and !global.mapchanging);
    }
}
with(TeamGate){
    if global.isLive==1 and global.spawnDoors==1{
        solid = ((team != other.team or other.intel) and !global.mapchanging);
    }
}
with(ControlPointSetupGate){
    solid = (global.setupTimer > 0);
    if(instance_exists(FauxCPHUD))
        solid = (FauxCPHUD.cpUnlock > 0);
}
with(PlayerWall){
    solid = true;
}
