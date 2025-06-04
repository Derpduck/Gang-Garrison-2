var stalemateState, stalemateTimer;
stalemateTimer = argument0;

// Determine if game is in a stalemate
if (!KothRedControlPoint.locked and !KothBlueControlPoint.locked and KothRedControlPoint.team == TEAM_RED and KothBlueControlPoint.team == TEAM_BLUE)
    stalemateState = true;
else
    stalemateState = false;

// Not in a stalemate, reset the timer and exit
if (!stalemateState)
    return global.dkothStalemateTimer * 60 * 30;

// If in a stalemate, and neither team is contesting a point, start counting down the stalemate timer
if (stalemateTimer > 0 and KothBlueControlPoint.capping == 0 and KothRedControlPoint.bluePresence == 0 and KothRedControlPoint.capping == 0 and KothBlueControlPoint.redPresence == 0)
    stalemateTimer -= 1;

// Stalemate timer reached 0, activate stalemate
if (stalemateTimer == 0)
{
    dkoth_stalemate_message();
    stalemateTimer = -1;
}

// Stalemate activated, count down both team's timers
if (stalemateTimer == -1)
{
    var winningTeam;
    // Determine winning team
    if (redTimer < blueTimer)
        winningTeam = TEAM_RED;
    else if (redTimer > blueTimer)
        winningTeam = TEAM_BLUE;
    else
        winningTeam = -1;
    
    switch(global.dkothStalemateMode)
    {
    case 1: // Loser's Favor
        if (redTimer > 0)
        {
            if (winningTeam == TEAM_RED)
                redTimer -= global.dkothStalemateSpeed / 200;
            else
                redTimer -= global.dkothStalemateSpeed / 100;
        }
        if (blueTimer > 0)
        {
            if (winningTeam == TEAM_BLUE)
                blueTimer -= global.dkothStalemateSpeed / 200;
            else
                blueTimer -= global.dkothStalemateSpeed / 100;
        }
        break;
    case 2: // Winner's Favor
        if (redTimer > 0)
        {
            if (winningTeam == TEAM_RED)
                redTimer -= global.dkothStalemateSpeed / 100;
            else
                redTimer -= global.dkothStalemateSpeed / 200;
        }
        if (blueTimer > 0)
        {
            if (winningTeam == TEAM_BLUE)
                blueTimer -= global.dkothStalemateSpeed / 100;
            else
                blueTimer -= global.dkothStalemateSpeed / 200;
        }
        break;
    case 3: // Equal
        if (redTimer > 0)
            redTimer -= global.dkothStalemateSpeed / 100;
        if (blueTimer > 0)
            blueTimer -= global.dkothStalemateSpeed / 100;
        break;
    }
    GameServer.syncTimer = 1;
}

return stalemateTimer;
