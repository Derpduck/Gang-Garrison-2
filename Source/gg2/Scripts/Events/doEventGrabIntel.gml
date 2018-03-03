/*
 * Grab the intel.
 * Argument 0 is the player who is grabbing it.
 */

//recordEventInLog(6,argument0.team,argument0.name);
//argument0.caps += 0.5;
sound_play(IntelGetSnd);
var isMe;
isMe = (global.myself == argument0);
recordEventInLog(6, argument0.team, argument0.name, isMe);
if (global.myself == argument0){
    if !instance_exists(NoticeO){
        instance_create(0,0,NoticeO);
    }
    with (NoticeO){
        notice = NOTICE_HAVEINTEL;
    }
}

if(argument0.object != -1){
    if(argument0.team == TEAM_RED){
        argument0.object.intelRecharge = max(75, IntelligenceBlue.resetTimer);
        //Bots
        with Player{
            if isBot{
                if target.object_index == IntelligenceBlue{
                    target = -1
                    ds_list_clear(directionList)
                }
            }
        }
        with(IntelligenceBlue){
            instance_destroy();
        }
    }else if(argument0.team == TEAM_BLUE){
        argument0.object.intelRecharge = max(75, IntelligenceRed.resetTimer);
        //Bots
        with Player{
            if isBot{
                if target.object_index == IntelligenceRed{
                    target = -1
                    ds_list_clear(directionList)
                }
            }
        }
        with(IntelligenceRed){
            instance_destroy();
        }
    }else{
        exit;
    }
    
    argument0.object.intel = true;
    argument0.object.animationOffset = CHARACTER_ANIMATION_INTEL;
}
