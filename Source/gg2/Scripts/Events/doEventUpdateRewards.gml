/**
 * argument0: The player whose rewards were updated
 * argument1: The new rewards value
 */

var player, rewardString;
player = argument0;
rewardString = argument1;

parseRewards(rewardString, player.rewards);
parseBadges(player.rewards, player.badges);

if (!ds_list_empty(player.badges))
{
    player.activeBadge = 0;
    player.alarm[11] = 45 / global.delta_factor;
}
