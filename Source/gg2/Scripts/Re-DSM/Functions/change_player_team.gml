// Taken from processClientCommands, PLAYER_CHANGETEAM
var player, newTeam, ignoreBalance, balance, redSuperiority;
player = argument0;
newTeam = argument1;
ignoreBalance = argument2;

// Invalid team was requested, treat it as a random team
if(newTeam != TEAM_RED and newTeam != TEAM_BLUE and newTeam != TEAM_SPECTATOR)
    newTeam = TEAM_ANY;

redSuperiority = 0   //calculate which team is bigger
with(Player)
{
    if(id != player)
    {
        if(team == TEAM_RED)
            redSuperiority += 1;
        else if(team == TEAM_BLUE)
            redSuperiority -= 1;
    }
}
if(redSuperiority > 0)
    balance = TEAM_RED;
else if(redSuperiority < 0)
    balance = TEAM_BLUE;
else
    balance = -1;

if(newTeam == TEAM_ANY)
{
    if(balance == TEAM_RED)
        newTeam = TEAM_BLUE;
    else if(balance == TEAM_BLUE)
        newTeam = TEAM_RED;
    else
        newTeam = choose(TEAM_RED, TEAM_BLUE);
}
    
if((ignoreBalance or balance != newTeam) and newTeam != player.team)
{
    if(getCharacterObject(player.class) != -1 or newTeam==TEAM_SPECTATOR)
    {  
        if(player.object != -1)
        {
            with(player.object)
            {
                if (!instance_exists(lastDamageDealer) || lastDamageDealer == player)
                {
                    sendEventPlayerDeath(player, player, noone, DAMAGE_SOURCE_BID_FAREWELL);
                    doEventPlayerDeath(player, player, noone, DAMAGE_SOURCE_BID_FAREWELL);
                }
                else
                {
                    var assistant;
                    assistant = secondToLastDamageDealer;
                    if (lastDamageDealer.object)
                        if (lastDamageDealer.object.healer)
                            assistant = lastDamageDealer.object.healer;
                    sendEventPlayerDeath(player, lastDamageDealer, assistant, DAMAGE_SOURCE_FINISHED_OFF);
                    doEventPlayerDeath(player, lastDamageDealer, assistant, DAMAGE_SOURCE_FINISHED_OFF);
                }
            }
            player.alarm[5] = global.Server_Respawntime / global.delta_factor;
        }
        else if(player.alarm[5]<=0)
            player.alarm[5] = 1; // Will spawn in the same step (between Begin Step and Step)
        var newClass;
        newClass = checkClasslimits(player, newTeam, player.class);
        if newClass != player.class
        {
            player.class = newClass;
            ServerPlayerChangeclass(ds_list_find_index(global.players, player), player.class, global.sendBuffer);
        }
        player.team = newTeam;
        ServerPlayerChangeteam(ds_list_find_index(global.players, player), player.team, global.sendBuffer);
        clearPlayerDominations(player);
        if (!ignoreBalance)
            ServerBalanceTeams();
        
        return true;
    }
    
    return false;
}
else
{
    return false;
}
