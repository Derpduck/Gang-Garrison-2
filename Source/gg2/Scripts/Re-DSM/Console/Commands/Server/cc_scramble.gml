console_add_command('scramble', '
// Get all non-spectator players
var scramblePlayers;
scramblePlayers = ds_list_create();

for (i=0; i<ds_list_size(global.players); i+=1)
{
    var player;
    player = ds_list_find_value(global.players, i);
    
    if (player.team != TEAM_SPECTATOR)
        ds_list_add(scramblePlayers, player);
};

ds_list_shuffle(scramblePlayers);

// Assign to new teams
var newTeam;
newTeam = choose(TEAM_RED, TEAM_BLUE);
for (i=0; i<ds_list_size(scramblePlayers); i+=1)
{
    var player;
    player = ds_list_find_value(scramblePlayers, i);
    // Kill the player
    if (player.object != -1)
    {
        sendEventPlayerDeath(player, noone, noone, DAMAGE_SOURCE_FINISHED_OFF);
        doEventPlayerDeath(player, noone, noone, DAMAGE_SOURCE_FINISHED_OFF);
        player.alarm[5] = 1;
    }
    else if(player.alarm[5]<=0)
    {
        player.alarm[5] = 1;
    }
    
    // Move to new team
    change_player_team(player, newTeam, true);
    
    // Change the next team
    if newTeam == TEAM_RED
        newTeam = TEAM_BLUE;
    else
        newTeam = TEAM_RED;
};

ds_list_destroy(scramblePlayers);
console_print(COL_ORANGE + "Teams have been scrambled");
', '
console_print(COL_ORANGE + "Syntax: scramble");
console_print(COL_ORANGE + "Randomly shuffles the teams of all active players");
', CC_HOST_RCON);
