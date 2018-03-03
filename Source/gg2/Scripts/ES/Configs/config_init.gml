globalvar cfg_name,cfg_rup,cfg_timeLimit,cfg_respawnTime,cfg_capLimit,cfg_arenaWinLimit,cfg_adcp,cfg_minPlayers,cfg_maxPlayers,cfg_medCabs,cfg_spawnDoors,cfg_classlimits;
cfg_name=""
cfg_rup=1
cfg_timeLimit=10
cfg_respawnTime=5
cfg_capLimit=4
cfg_arenaWinLimit=5
cfg_deathmatchKillLimit=30
cfg_adcp=0
cfg_minPlayers=-1
cfg_maxPlayers=-1
cfg_medCabs=1
cfg_spawnDoors=1
cfg_classlimits=1
//classlimits
cl_scout=1
cl_pyro=1
cl_soldier=1
cl_heavy=1
cl_demoman=1
cl_medic=1
cl_engineer=1
cl_spy=1
cl_sniper=1
cl_quote=1

global.currentConfig=""
global.cfgrup=1
global.minPlayers=-1
global.maxPlayers=-1
global.cfgclasslimits=1

global.isVoting=0
global.yesVotes=0
global.noVotes=0

if(!directory_exists(working_directory + "\Configs")) directory_create(working_directory + "\Configs")
