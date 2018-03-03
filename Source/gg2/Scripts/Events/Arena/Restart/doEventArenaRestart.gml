with(ArenaHUD) {
    roundStart = 300;
    endCount = 0;
    cpUnlock = 45*30;
    winners = TEAM_SPECTATOR;
    overtime=0
    timeLimit=2*30*60//global.timeLimitMins*30*60;
    timer=timeLimit;
    GameServer.syncTimer = 1;
}

ArenaControlPoint.team = -1;
ArenaControlPoint.locked = 1;
with Player humiliated = 0;
with Sentry instance_destroy();
with SentryGibs instance_destroy();
    
if((global.music == MUSIC_BOTH or global.music == MUSIC_INGAME_ONLY)
    and (AudioControl.currentSong != global.IngameMusic)) {
    AudioControlPlaySong(global.IngameMusic, true);
}
