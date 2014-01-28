ini_open("DSM.ini")
global.drawIntelArrows=ini_read_real("Settings","DrawIntelArrows",1)
global.hpBarText=ini_read_real("Settings","HPBarText",1)
global.ammoBar=ini_read_real("Settings","AmmoBar",1)
//global.generatorStab=ini_read_real("Settings","GeneratorStab",1)
global.recoilAnimations=ini_read_real("Settings","RecoilAnimations",1)
global.showKillLog=ini_read_real("Settings","ShowKillLog",1)
global.recordingEnabled=ini_read_real("Settings","RecordingEnabled",0)
global.healingArrow=ini_read_real("Settings","HealingArrow",1)
global.recordStats=ini_read_real("Settings","RecordStats",1)
global.chuWarSpecHud=ini_read_real("Settings","ChuWarSpecHud",0)
global.respawnTimer=ini_read_real("Settings","RespawnTimer",1)
global.recordingType=ini_read_real("Settings","RecordingType",0)
global.soundPanning=ini_read_real("Settings","SoundPanning",1)
global.pluginCleanup=ini_read_real("Settings","PluginCleanup",1)
global.oldAutobalance=ini_read_real("Settings","OldAutobalance",0)
global.replayNamePropmt=ini_read_real("Settings","ReplayNamePrompt",1)
global.deadScoreboard=ini_read_real("Settings","DeadScoreboard",0)

global.displayingFPS=0
global.displayingPing=0
global.myCurrentPlugins=''
global.chatCheck=false

ini_write_real("Settings","DrawIntelArrows",global.drawIntelArrows)
ini_write_real("Settings","HPBarText",global.hpBarText)
ini_write_real("Settings","AmmoBar",global.ammoBar)
//ini_write_real("Settings","GeneratorStab",global.generatorStab)
ini_write_real("Settings","RecoilAnimations",global.recoilAnimations)
ini_write_real("Settings","ShowKillLog",global.showKillLog)
ini_write_real("Settings","RecordingEnabled",global.recordingEnabled)
ini_write_real("Settings","HealingArrow",global.healingArrow)
ini_write_real("Settings","RecordStats",global.recordStats)
ini_write_real("Settings","ChuWarSpecHud",global.chuWarSpecHud)
ini_write_real("Settings","RespawnTimer",global.respawnTimer)
ini_write_real("Settings","RecordingType",global.recordingType)
ini_write_real("Settings","SoundPanning",global.soundPanning)
ini_write_real("Settings","PluginCleanup",global.pluginCleanup)
ini_write_real("Settings","OldAutobalance",global.oldAutobalance)
ini_write_real("Settings","ReplayNamePrompt",global.replayNamePropmt)
ini_write_real("Settings","DeadScoreboard",global.deadScoreboard)
ini_close()

statsTracker()
custom_init()

if(!directory_exists(working_directory + "\Replays")) directory_create(working_directory + "\Replays")
global.replayBuffer = buffer_create() //Used by the server to save the replay and by the client to load it.
global.isPlayingReplay=0
global.replaySpeed=1
global.justEnabledRecording=0 //Used to know if the recording just began, to save the first bytes.
