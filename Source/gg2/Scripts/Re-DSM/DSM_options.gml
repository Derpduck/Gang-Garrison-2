ini_open("Re-DSM.ini");
// One time option changes notifications
DSM_add_ini_notification("Damage Indicator", "Scale", 100, "Damage Indicator Scale now uses a percentage value.");
DSM_add_ini_notification("HUD", "Show Ammo Text", 2, "Show Ammo Text default has been changed to only show your own ammo.");

// General
global.skipFaucetLogo = DSM_add_option("General", "Skip FAUCeT Logo", 1);
global.noAFKAutoSpectate = DSM_add_option("General", "Disable AFK Auto-Spectate", 1);
global.disableWindowResizing = DSM_add_option("General", "Disable Window Resizing", 0);
window_set_sizeable(!global.disableWindowResizing);

// HP Text
global.healthText = DSM_add_option("HUD", "Show HP Text", 1);
global.healthTextSentry = DSM_add_option("HUD", "Show Sentry HP Text", 1);
global.healthTextPosition = DSM_add_option("HUD", "HP Text Position", 1);
global.healthTextColor = DSM_add_option("HUD", "HP Text Color", 0);
global.healthTextLowColor = DSM_add_option("HUD", "HP Text Low Color", 2);
global.healthTextShadow = DSM_add_option("HUD", "HP Text Shadow", 1);

// Ammo Text
global.ammoText = DSM_add_option("HUD", "Show Ammo Text", 2);
global.ammoTextPosition = DSM_add_option("HUD", "Ammo Text Position", 5);
global.ammoTextColor = DSM_add_option("HUD", "Ammo Text Color", 0);
global.ammoTextLowColor = DSM_add_option("HUD", "Ammo Text Low Color", 2);
global.ammoTextShadow = DSM_add_option("HUD", "Ammo Text Shadow", 1);

// Bars
global.ammoBar = DSM_add_option("HUD", "Show Ammo Bar", 1);
global.uberBar = DSM_add_option("HUD", "Show Superburst Bar", 1);
global.nutsBar = DSM_add_option("HUD", "Show Nuts N Bolts Bar", 1);
global.sandwichBar = DSM_add_option("HUD", "Show Sandwich Bar", 1);
global.afterburnBar = DSM_add_option("HUD", "Show Afterburn Bar", 1);

// Character HUD
global.sniperCharge = DSM_add_option("HUD", "Upgraded Sniper Charge HUD", 3);

// Misc HUD
global.scoreboardStats = DSM_add_option("HUD", "Detailed Scoreboard Stats", 1);
global.deathInfo = DSM_add_option("HUD", "Show Death Info Panel", 1);

// Team Colors
global.teamColors_Bullets = DSM_add_option("Team Colors", "Bullets", 1);
global.teamColors_Rockets = DSM_add_option("Team Colors", "Rockets", 1);
global.teamColors_Flames = DSM_add_option("Team Colors", "Flames", 1);
global.teamColors_Flares = DSM_add_option("Team Colors", "Flares", 1);
global.teamColors_AirBlasts = DSM_add_option("Team Colors", "Air Blasts", 0);
global.teamColors_Needles = DSM_add_option("Team Colors", "Needles", 1);
global.teamColors_MineTrails = DSM_add_option("Team Colors", "Mine Trails", 1);
global.teamColors_Blades = DSM_add_option("Team Colors", "Blades", 1);
global.teamColors_Bubbles = DSM_add_option("Team Colors", "Bubbles", 1);
global.teamColors_Explosions = DSM_add_option("Team Colors", "Explosions", 1);

// Damage Indicator
global.damageIndicator = DSM_add_option("Damage Indicator", "Show Damage Indicator", 1);
global.damageIndicatorSelf = DSM_add_option("Damage Indicator", "Show Self Damage", 0);
global.damageIndicatorHealing = DSM_add_option("Damage Indicator", "Show Healing Given", 1);
global.damageIndicatorHealingTarget = DSM_add_option("Damage Indicator", "Show Healing Target Damage", 1);
global.damageIndicatorColor = DSM_add_option("Damage Indicator", "Damage Indicator Color", 1);
global.damageIndicatorColorSelf = DSM_add_option("Damage Indicator", "Self Damage Color", 2);
global.damageIndicatorColorHealing = DSM_add_option("Damage Indicator", "Healing Color", 4);
global.damageIndicatorVolume = DSM_add_option("Damage Indicator", "Volume", 100, true, 0, true, 100);
global.damageIndicatorCustomSound = DSM_add_option_string("Damage Indicator", "Custom Sound File", "");
global.damageIndicatorScale = DSM_add_option("Damage Indicator", "Scale", 100);
global.damageIndicatorHoldDuration = DSM_add_option("Damage Indicator", "Hold Duration", 0.5);
global.damageIndicatorFadeDuration = DSM_add_option("Damage Indicator", "Fade Duration", 1.5);
global.damageIndicatorShrink = DSM_add_option("Damage Indicator", "Shrink on Fade", 1);
global.damageIndicatorShadow = DSM_add_option("Damage Indicator", "Drop Shadow", 1);

// Hosting
global.headlessMode = DSM_add_option("Hosting", "Headless Mode (Launch Option Only)", 0);
global.tauntHeal = DSM_add_option("Hosting", "Taunt Heal", 0);
global.tauntHealAmount = DSM_add_option("Hosting", "Taunt Heal Amount", 5);

// Time Limits
global.timeLimit_CTF = DSM_add_option("Time Limits", "CTF Time Limit Override", 0);
global.timeLimit_Invasion = DSM_add_option("Time Limits", "Invasion Time Limit Override", 0);
global.timeLimit_ADCP = DSM_add_option("Time Limits", "AD CP Time Limit Override", 0);
global.timeLimit_ADCP_Cap = DSM_add_option("Time Limits", "AD CP Time Limit Cap Override", 0);
global.timeLimit_1CP = DSM_add_option("Time Limits", "1CP Time Limit Override", 0);
global.timeLimit_2CP = DSM_add_option("Time Limits", "2CP Time Limit Override", 0);
global.timeLimit_3CP = DSM_add_option("Time Limits", "3CP Time Limit Override", 0);
global.timeLimit_4CP = DSM_add_option("Time Limits", "4CP Time Limit Override", 0);
global.timeLimit_5CP = DSM_add_option("Time Limits", "5CP Time Limit Override", 0);
global.timeLimit_Arena = DSM_add_option("Time Limits", "Arena Time Limit Override", 0);
global.timeLimit_Generator = DSM_add_option("Time Limits", "Generator Time Limit Override", 0);
global.timeLimit_KOTH = DSM_add_option("Time Limits", "KoTH Time Limit Override", 0);
global.timeLimit_DKOTH = DSM_add_option("Time Limits", "DKoTH Time Limit Override", 0);
global.timeLimit_TDM = DSM_add_option("Time Limits", "TDM Time Limit Override", 0);

// Freeze Time
global.freezeTime = DSM_add_option("Freeze Time", "Freeze Time Enabled", 1);
global.freezeTimeCountdownDuration = DSM_add_option("Freeze Time", "Countdown Duration", 10);
global.freezeTimeShowCountdown = DSM_add_option("Freeze Time", "Show Countdown", 1);

// DKOTH Anti-Stall
global.dkothAntiStall = DSM_add_option("DKOTH Anti-Stall", "Anti-Stall Measures Enabled", 0);
global.dkothStalemateCountdown = DSM_add_option("DKOTH Anti-Stall", "Stalemate Countdown Mode", 0);
global.dkothCaptureLockTime = DSM_add_option("DKOTH Anti-Stall", "Enemy CP Capture Lock Duration", 10);
global.dkothHomeCapturePower = DSM_add_option("DKOTH Anti-Stall", "Home Point Capture Speed", 100, true, 0);
global.dkothEnemyCapturePower = DSM_add_option("DKOTH Anti-Stall", "Enemy Point Capture Speed", 100, true, 0);

// Audio
global.masterVolume = DSM_add_option("Audio", "Master Volume", 100, true, 0, true, 100);
ini_close();

ini_open("controls.gg2");
global.uberBubbleKey = ini_read_real("DSM", "UberBubble", ord("R"));
global.spyBubbleKey = ini_read_real("DSM", "SpyBubble", ord("G"));
global.showMapCollisionKey = ini_read_real("DSM", "ShowMapCollision", vk_f7);
ini_close();

