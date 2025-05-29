with(Obstacle)
    solid = true;
    
if(!global.mapchanging)
{
    with(IntelGate)
    {
        if (HUD.freezeTimeTimer < 0)
            solid = (team != other.team and other.intel);
        else
            solid = true;
    }

    with(TeamGate)
    {
        if (HUD.freezeTimeTimer < 0)
            solid = (team != other.team or other.intel);
        else
            solid = true;
    }
}

if(areSetupGatesClosed())
{
    with(ControlPointSetupGate)
        solid = true;
}

with(PlayerWall)
    solid = true;

