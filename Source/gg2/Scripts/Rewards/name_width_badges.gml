// real name_width_badges(real player)
// Returns the width that a player's name with badges would take up

var player, badges;
player = argument0;

if (global.cycleBadges)
    badges = min(1, ds_list_size(player.badges));
else
    badges = ds_list_size(player.badges);

return string_width(sanitiseNewlines(player.name)) + (sprite_get_width(HaxxyBadgeS) * badges);
