// real name_width_badges(real player)
// Returns the width that a player's name with badges would take up

var player, badges;
player = argument0;

if (global.cycleBadges)
    return string_width(sanitiseNewlines(player.name)) + (sprite_get_width(HaxxyBadgeS) * min(1, ds_list_size(player.badges)));
else
    return string_width(sanitiseNewlines(player.name)) + (sprite_get_width(HaxxyBadgeS) * ds_list_size(player.badges));
