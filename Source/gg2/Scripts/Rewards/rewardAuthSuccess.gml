var player, rewardString, rewardArray, i, rewardValue;
player = argument0;
rewardString = argument1;
        
sendEventUpdateRewards(player, rewardString);
doEventUpdateRewards(player, rewardString);

player.hrID=string(real(player.hrID)*-1)
if player.hrID=="19"{
    player.isDerpduck=1
}
