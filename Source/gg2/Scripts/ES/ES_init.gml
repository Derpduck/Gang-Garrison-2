ini_open("ES.ini")
    global.RCONAllowed=ini_read_real("s","RCONAllowed",0)
    ini_write_real("s","RCONAllowed",global.RCONAllowed)
    
    global.RCONPassword=ini_read_string("s","RCONPassword","")
    ini_write_string("s","RCONPassword",global.RCONPassword)
    
    global.writeConsoleLog=ini_read_real("s","WriteConsoleLog",0)
    ini_write_real("s","WriteConsoleLog",global.writeConsoleLog)
    
    global.writeChatLog=ini_read_real("s","WriteChatLog",0)
    ini_write_real("s","WriteChatLog",global.writeChatLog)
    
    global.showPing=ini_read_real("s","ShowPing",1)
    ini_write_real("s","ShowPing",global.showPing)
    
    global.showFPS=ini_read_real("s","ShowFPS",1)
    ini_write_real("s","ShowFPS",global.showFPS)
    
    global.borderless=ini_read_real("s","Borderless",0)
    if global.borderless==1{
        window_set_showborder(0)
        window_set_showicons(0)
    }else if global.borderless==0{
        window_set_showborder(1)
        window_set_showicons(1)
    }
    ini_write_real("s","Borderless",global.borderless)
    
    global.killLogItems=ini_read_real("s","KillLogItems",5)
    ini_write_real("s","KillLogItems",global.killLogItems)
    
    global.killLogTime=ini_read_real("s","KillLogTime",5)
    ini_write_real("s","KillLogTime",global.killLogTime)
    
    global.volume=ini_read_real("s","Volume",80)
    sound_global_volume(global.volume/100)
    ini_write_real("s","Volume",global.volume)
    
    global.fastBodyFade=ini_read_real("s","FastBodyFade",0)
    ini_write_real("s","FastBodyFade",global.fastBodyFade)
    
    global.healTargetArrow=ini_read_real("s","HealTargetArrow",1)
    ini_write_real("s","HealTargetArrow",global.healTargetArrow)
    
    global.hpTextPos=ini_read_real("s","HPTextPos",1)
    ini_write_real("s","HPTextPos",global.hpTextPos)
    
    global.autoStart=ini_read_real("s","AutoStart",0)
    ini_write_real("s","AutoStart",global.autoStart)
    
    global.drawHPHUD=ini_read_real("s","DrawHPHUD",1)
    ini_write_real("s","DrawHPHUD",global.drawHPHUD)
    
    global.drawAmmoHUD=ini_read_real("s","DrawAmmoHUD",1)
    ini_write_real("s","DrawAmmoHUD",global.drawAmmoHUD)
    
    global.adcpStopwatch=ini_read_real("s","ADCPStopwatch",1)
    ini_write_real("s","ADCPStopwatch",global.adcpStopwatch)
    
    global.arenaRoundsToWin=max(1, min(255,ini_read_real("s","ArenaRoundsToWin",5)))
    ini_write_real("s","ArenaRoundsToWin",global.arenaRoundsToWin)
    
    global.noShells=ini_read_real("s","NoShells",0)
    ini_write_real("s","NoShells",global.noShells)
    
    global.damageIndicator=ini_read_real("s","DamageIndicator",1)
    ini_write_real("s","DamageIndicator",global.damageIndicator)
    
    global.autoCast=ini_read_real("s","AutoCast",0)
    if global.autoCast==1{
        global.isCasting=1
    }else{
        global.isCasting=0
    }
    ini_write_real("s","AutoCast",global.autoCast)
    
    global.smallTimer=ini_read_real("s","SmallTimer",0)
    ini_write_real("s","SmallTimer",global.smallTimer)
    
    global.smallSelectMenu=ini_read_real("s","SmallSelectMenu",0)
    ini_write_real("s","SmallSelectMenu",global.smallSelectMenu)
    
    global.pingGraph=ini_read_real("s","PingGraph",0)
    ini_write_real("s","PingGraph",global.pingGraph)
    
    global.yellowMineTrails=ini_read_real("s","YellowMineTrails",0)
    ini_write_real("s","YellowMineTrails",global.yellowMineTrails)
    
    global.chatDisplayLines=ini_read_real("s","ChatDisplayLines",3)
    ini_write_real("s","ChatDisplayLines",global.chatDisplayLines)
    
    global.chatBoxAlpha=ini_read_real("s","ChatBoxAlpha",80)
    ini_write_real("s","ChatBoxAlpha",global.chatBoxAlpha)
    
    global.chatTextAlpha=ini_read_real("s","ChatTextAlpha",100)
    ini_write_real("s","ChatTextAlpha",global.chatTextAlpha)
    
    global.weaponDraw=ini_read_real("s","WeaponDraw",0)
    ini_write_real("s","WeaponDraw",global.weaponDraw)
    
    global.noSoundsDuringRUP=ini_read_real("s","NoSoundsDuringRUP",0)
    ini_write_real("s","NoSoundsDuringRUP",global.noSoundsDuringRUP)
    
    global.boxHUD=ini_read_real("s","BoxHUD",1)
    ini_write_real("s","BoxHUD",global.boxHUD)
    
    global.boxBgAlpha=ini_read_real("s","BoxBgAlpha",50)
    ini_write_real("s","BoxBgAlpha",global.boxBgAlpha)
    
    global.boxElementAlpha=ini_read_real("s","BoxElementAlpha",100)
    ini_write_real("s","BoxElementAlpha",global.boxElementAlpha)
    
    global.textSelectCol=ini_read_real("s","TextSelectCol",0)
    ini_write_real("s","TextSelectCol",global.textSelectCol)
    
    global.killLogBGAlpha=ini_read_real("s","KillLogBGAlpha",100)
    ini_write_real("s","KillLogBGAlpha",global.killLogBGAlpha)
    
    global.killLogTextAlpha=ini_read_real("s","KillLogTextAlpha",100)
    ini_write_real("s","KillLogTextAlpha",global.killLogTextAlpha)
    
    global.boxScoreboardBGAlpha=ini_read_real("s","BoxScoreboardBGAlpha",50)
    ini_write_real("s","BoxScoreboardBGAlpha",global.boxScoreboardBGAlpha)
    
    global.boxStatsScorePos=ini_read_real("s","BoxStatsScorePos",1)
    ini_write_real("s","BoxStatsScorePos",global.boxStatsScorePos)
    
    global.chatExpiryTime=ini_read_real("s","ChatExpiryTime",3)
    ini_write_real("s","ChatExpiryTime",global.chatExpiryTime)
    
    global.chatColorCodes=ini_read_real("s","ChatColorCodes",1)
    ini_write_real("s","ChatColorCodes",global.chatColorCodes)
    
    global.voteTimer=ini_read_real("s","VoteTimer",30)
    ini_write_real("s","VoteTimer",global.voteTimer)
    
    global.configVoteAllowed=ini_read_real("s","ConfigVoteAllowed",1)
    ini_write_real("s","ConfigVoteAllowed",global.configVoteAllowed)
    
    global.damageColourRGB=ini_read_string("s","DamageColourRGB","244,244,11")
    ini_read_string("s","DamageColourRGB",global.damageColourRGB)
    
    global.defaultConfig=ini_read_string("s","DefaultConfig","")
    ini_write_string("s","DefaultConfig",global.defaultConfig)
    
    global.respawnTimerPos=ini_read_real("s","RespawnTimerPos",1)
    ini_write_real("s","RespawnTimerPos",global.respawnTimerPos)
    
    global.respawnTimerAlpha=ini_read_real("s","RespawnTimerAlpha",50)
    ini_write_real("s","RespawnTimerAlpha",global.respawnTimerAlpha)
    
    global.specReadChat=ini_read_real("s","SpecReadChat",0)
    ini_write_real("s","SpecReadChat",global.specReadChat)
    
    global.bigHpNumbers=ini_read_real("s","BigHpNumbers",0)
    ini_write_real("s","BigHpNumbers",global.bigHpNumbers)
    
    global.hpColourRGB=ini_read_string("s","HpColourRGB","244,244,11")
    ini_read_string("s","HpColourRGB",global.hpColourRGB)
    
    global.serverAfkTimeout=ini_read_real("s","ServerAfkTimeout",120)
    ini_write_real("s","ServerAfkTimeout",global.serverAfkTimeout)
    
    global.medicTargeting=ini_read_real("s","MedicTargeting",0)
    ini_write_real("s","MedicTargeting",global.medicTargeting)
    
    global.jumpMapMode=ini_read_real("s","JumpMapMode",0)
    ini_write_real("s","JumpMapMode",global.jumpMapMode)
    
    global.jumpPlayerAttack=ini_read_real("s","JumpPlayerAttack",0)
    ini_write_real("s","JumpPlayerAttack",global.jumpPlayerAttack)
    
    global.mgeScoreLimit=max(1, min(255,ini_read_real("s","MGEScoreLimit",20)))
    ini_write_real("s","MGEScoreLimit",global.mgeScoreLimit)
    
    global.dumbledankSprites=ini_read_real("s","DumbledankSprites",0)
    ini_write_real("s","DumbledankSprites",global.dumbledankSprites)
    
    global.killstreakPrints=ini_read_real("s","KillstreakPrints",1)
    ini_write_real("s","KillstreakPrints",global.killstreakPrints)
    
    global.vipPassword=ini_read_string("s","VIPPassword","")
    ini_write_string("s","VIPPassword",global.vipPassword)
    
    global.vipThreshold=ini_read_real("s","VIPThreshold","")
    ini_write_real("s","VIPThreshold",global.vipThreshold)
    
    global.bigAmmoNumbers=ini_read_real("s","BigAmmoNumbers",0)
    ini_write_real("s","BigAmmoNumbers",global.bigAmmoNumbers)
    
    global.ammoColourRGB=ini_read_string("s","AmmoColourRGB","11,244,244")
    ini_write_string("s","AmmoColourRGB",global.ammoColourRGB)
    
    global.damageIndicatorScale=ini_read_real("s","DamageIndicatorScale",100)
    ini_write_real("s","DamageIndicatorScale",global.damageIndicatorScale)
    
    global.damageIndicatorCombine=ini_read_real("s","DamageIndicatorCombine",1)
    ini_write_real("s","DamageIndicatorCombine",global.damageIndicatorCombine)
    
    global.autoRCON=ini_read_real("s","AutoRCON",1)
    ini_write_real("s","AutoRCON",global.autoRCON)
    
    global.chatFontType=ini_read_real("s","ChatFontType",0)
    ini_write_real("s","ChatFontType",global.chatFontType)
    
    global.caveStoryDeath=ini_read_real("s","CaveStoryDeath",1)
    ini_write_real("s","CaveStoryDeath",global.caveStoryDeath)
    
    global.pugVoteAllowed=ini_read_real("s","PugVoteAllowed",1)
    ini_write_real("s","PugVoteAllowed",global.pugVoteAllowed)
    
    global.teleportAllowed=ini_read_real("s","TeleportAllowed",0)
    ini_write_real("s","TeleportAllowed",global.teleportAllowed)
    
    global.teamProjectiles=ini_read_real("s","TeamProjectiles",1)
    ini_write_real("s","TeamProjectiles",global.teamProjectiles)
    
    global.printJoins=ini_read_real("s","PrintJoins",1)
    ini_write_real("s","PrintJoins",global.printJoins)
    
    global.printLeaves=ini_read_real("s","PrintLeaves",1)
    ini_write_real("s","PrintLeaves",global.printLeaves)
    
    global.printNames=ini_read_real("s","PrintNames",1)
    ini_write_real("s","PrintNames",global.printNames)
    
    global.printRUP=ini_read_real("s","PrintRUP",1)
    ini_write_real("s","PrintRUP",global.printRUP)
    
    global.printKBM=ini_read_real("s","PrintKBM",1)
    ini_write_real("s","PrintKBM",global.printKBM)
    
    global.printAdminCC=ini_read_real("s","PrintAdminCC",1)
    ini_write_real("s","PrintAdminCC",global.printAdminCC)
    
    global.printRCONStatus=ini_read_real("s","PrintRCONStatus",1)
    ini_write_real("s","PrintRCONStatus",global.printRCONStatus)
    
    global.printMap=ini_read_real("s","PrintMap",1)
    ini_write_real("s","PrintMap",global.printMap)
    
    global.printAirshot=ini_read_real("s","PrintAirshot",1)
    ini_write_real("s","PrintAirshot",global.printAirshot)
    
    global.printPassword=ini_read_real("s","PrintPassword",0)
    ini_write_real("s","PrintPassword",global.printPassword)
    
    global.printClasslimits=ini_read_real("s","PrintClasslimits",1)
    ini_write_real("s","PrintClasslimits",global.printClasslimits)
    
    //Bots    
    global.botMode=ini_read_real("bots","BotSpawnMode",0)
    ini_write_real("bots","BotSpawnMode",global.botMode)
    
    //0 Fixed - Mixed
    //1 Fixed - PvE
    //2 Dynamic - Mixed
    //3 Dynamic - PvE
    //4 Fill - Mixed
    //5 Fill - PvE
    
    //Fixed (maximum) number of bots
    //Dynamic (reduce number of bots as number of players increases and vice versa), set the rates of when bots will change
    //Fill server to player limit
    //-Setting for each to them to decide of bots will be on mixed teams or 1 team
    
    
    
    global.botNumber=ini_read_real("bots","BotNumber",0)
    ini_write_real("bots","BotNumber",global.botNumber)
    
    //make bots ignore normal classlimits
    
    
    //change this so the value represents the max number of each class that can exist, and will fill randomly up to the max li
    global.botClasses[CLASS_SCOUT]=ini_read_real("bots","BotScouts",1)
    ini_write_real("bots", "BotScouts", global.botClasses[CLASS_SCOUT])
    
    global.botClasses[CLASS_PYRO]=ini_read_real("bots","BotPyros",0)
    ini_write_real("bots","BotPyros",global.botClasses[CLASS_PYRO])
    
    global.botClasses[CLASS_SOLDIER]=ini_read_real("bots","BotSoldiers",0)
    ini_write_real("bots","BotSoldiers",global.botClasses[CLASS_SOLDIER])
    
    global.botClasses[CLASS_HEAVY]=ini_read_real("bots","BotHeavies",0)
    ini_write_real("bots","BotHeavies",global.botClasses[CLASS_HEAVY])
    
    global.botClasses[CLASS_DEMOMAN]=ini_read_real("bots","BotDemomen",0)
    ini_write_real("bots","BotDemomen",global.botClasses[CLASS_DEMOMAN])
    
    global.botClasses[CLASS_MEDIC]=ini_read_real("bots","BotMedics",0)
    ini_write_real("bots","BotMedics",global.botClasses[CLASS_MEDIC])
    
    global.botClasses[CLASS_ENGINEER]=ini_read_real("bots","BotEngineers",0)
    ini_write_real("bots","BotEngineers",global.botClasses[CLASS_ENGINEER])
    
    global.botClasses[CLASS_SPY]=ini_read_real("bots","BotSpies",0)
    ini_write_real("bots","BotSpies",global.botClasses[CLASS_SPY])
    
    global.botClasses[CLASS_SNIPER]=ini_read_real("bots","BotSnipers",0)
    ini_write_real("bots","BotSnipers",global.botClasses[CLASS_SNIPER])
     
    global.botClasses[CLASS_QUOTE]=ini_read_real("bots","BotQuotes",0)
    ini_write_real("bots","BotQuotes",global.botClasses[CLASS_QUOTE])
    
    global.botDebugMode=ini_read_real("bots","BotDebug",0)
    ini_write_real("bots","BotDebug",global.botDebugMode)
ini_close()

ini_open("controls.gg2")
    global.bubbleUber=ini_read_real("Controls","BubbleUber",ord("R"))
    global.bubbleSpy=ini_read_real("Controls","BubbleSpy",ord("G"))
    global.chatHideCtrl=ini_read_real("Controls","ChatHideCtrl",ord("I"))
    global.chatToggleCtrl=ini_read_real("Controls","ChatToggleCtrl",ord("T"))
    global.chatGlobalCtrl=ini_read_real("Controls","ChatGlobalCtrl",ord("Y"))
    global.chatTeamCtrl=ini_read_real("Controls","ChatTeamCtrl",ord("U"))
    global.consoleKey=ini_read_real("Controls","ConsoleKey",vk_f3)
    global.castStats=ini_read_real("Controls","CastStats",ord("Z"))
ini_close()

global.myPing=0
global.madeRupList=0
//global.isCasting=0
global.playerListExists=0
global.rupTimeMin=0
global.rupTimeSec=0
global.permIDCounter=0
global.healCabs=1
global.spawnDoors=1
global.configSuperString=""
global.jumpMode=0
global.pugMode=0
global.pugVotePicks=0
global.pugVoteMaps=0
global.useCustomHaxxyColor=0 //Legacy haxxy colour changing variables
global.haxxyColorSelection=0
global.myHaxxyColorR=255
global.myHaxxyColorG=255
global.myHaxxyColorB=255

//ADCP stopwatch mode
global.adcpRound1Score=-1
global.adcpRound2Score=-1
global.adcpRound1Caps=-1
global.adcpRound2Caps=-1
global.currentStopwatchRound=0
global.adcpWinner=""
global.adcpRound1CapTimestamp=-1
global.adcpRound2CapTimestamp=-1
global.myAdcpTeam=""

//Replays
global.replayBuffer = buffer_create();
global.isPlayingReplay = false;
global.replayTime = 0;
global.recordingReplay = false;
global.isPlayingReplay = false;
global.replayMapSplit=0

//Bots
global.changedNodeMap = 0// Indicates whether an improvement to the nodemap was done, so that if yes it can save the new one.
//global.botClassCounter = 0// These two are for wished class compositions:
//global.botClassList = ds_list_create()
global.userCreatedBot[0] = 0// This is for people wishing for a specific bot
global.botNameSocketMap = ds_map_create();
global.totalBots=0
global.mesh=-1

color_index()
console_init()
RUP()
chat_init()
config_init()

if(!directory_exists(working_directory+"\Logs")) directory_create(working_directory+"\Logs")

global.consoleFont=font_add_sprite(ConsoleFontS,ord("!"),false,0);
global.chatFont=font_add_sprite(ChatFontS,ord("!"),false,0);
global.chatFontBold=font_add_sprite(ChatFontBoldS,ord("!"),false,0);

//dmg indicator
if file_exists("Sound/DingSnd.wav"){
    global.DingSound=sound_add("Sound/DingSnd.wav",0,true)
}else{
    global.DingSound=CountDown1Snd
}
