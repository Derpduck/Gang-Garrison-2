// Returns a player instance from a given player ID or name
// Player ID always checked first
// argument0 = Player Name or ID
// argument1 = If host is allowed to be returned, default = false
// -1 = No valid player found

// Don't initalize input and player otherwise they are out of scope for with(Player)
var hostAllowed, playerID;
input = argument0;
hostAllowed = real(argument1);

player = -1;

if (input == "")
{
    return -1;
}

if (string_is_real(input))
{
    playerID = real(input);
    
    // Check for player ID, if it's a valid ID
    if (playerID >= 0 and real_is_int(playerID))
    {
        show_message("INT")
        // Check if player is host and is allowed
        if (playerID == 0 and !hostAllowed)
            return -1;
        
        // Otherwise, get player instance from ID
        if (playerID < ds_list_size(global.players))
            return ds_list_find_value(global.players, playerID);
    }
}

// Check for player name
with (Player)
{
    // Get the ID of a player with the give name
    if (name == other.input)
        // Check for exact name case first
       other.player = id;
    else if (string_lower(name) == string_lower(other.input))
        // Otherwise, ignore case
        other.player = id;
}

// Couldn't find a player with that name
if (player == -1)
{
    return -1;
}
else
{
    // Check if player is host and is allowed
    if (player == global.myself and !hostAllowed)
        return -1;
    
    // Otherwise, return the player we found
    return player;
}

// Couldn't find any player
return -1;
