/// Select and return an acceptable new class for a player, based on the classlimits.

var player, newTeam, desiredClass;
player       = argument0;
newTeam      = argument1;
desiredClass = argument2;

// Enough free slots for the desired class?
if (countClassmembersExcept(player, newTeam, desiredClass) < global.classlimits[desiredClass]){
    return desiredClass;
}else{
    return player.class
}
