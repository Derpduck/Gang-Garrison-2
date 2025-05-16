// Get the next map the server will change to, accounting for the next map being set manually with the console
if(global.winners == TEAM_RED and global.currentMapArea < global.totalMapAreas)
    return global.currentMap;

var nextMap;
if variable_global_exists("nextMap")
{
    if (global.consoleMapChangeQueued)
        return global.nextMap;
    
    if (global.nextMap == global.currentMap)
    {
        nextMap = nextMapInRotation();
        GameServer.currentMapIndex -= 1;
        return nextMap;
    }
    else
    {
        return global.nextMap;
    }
}
else
{
    nextMap = nextMapInRotation();
    GameServer.currentMapIndex -= 1;
    return nextMap;
}
