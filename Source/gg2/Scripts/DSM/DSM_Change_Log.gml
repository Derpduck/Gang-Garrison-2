/*
All options are in DSMOptionsController.
Chat will not be added because of the chat serverside plugin.
This list may become outdated because new updates add these features in.

-Rockets are more brightly coloured to their team.
    Changed: RocketS, RedRocketS, BlueRocketS.

-Bullets are team coloured.
    Changed: ShotS, Shot (Draw).

-Bubbles are team coloured.
    Changed: BubbleS, PopS, Bubble (Draw).

-Flames (And flares) are team coloured.
    Changed: Flame (Draw), Flare (Draw).
    Added: FlameBlueS, FlareBlueS.

-Needles are team coloured.
    Changed: NeedleS, Needle (Draw).

-Blades are team coloured.
    Changed: BladeB (Draw).
    Added: BladeProjectileRedS, BladeProjectileBlueS.

-Stats are tracked, and visible to user on the scoreboard.
    Changed: ScoreTableController (Create).
    Added: StatsBoardS, StatsBoard.

-MedAlert bubbles don't have white background.
    Changed: MedAlert.

-Sniper charge bar made into one bar.
    Changed: ChargeS.

-Timer sprite changed; amber "warning level" added.
    -Changed: TimerS.

-Main menu says "DSM"
    Changed: MenuBackgroundVersionS.

-Default welcome message for DSM added.
    Changed: game_init.

-Addded version checking for new versions of DSM.
    Changed: Constants, autoupdater objects

-Added new init for DSM options.
    Added: DSM_init

-Added randomise rotation option
    Changed: DSM_init, GameServerCreate.
    Added: randomiseRotation.

-Changed lobby information.
    Changed: sendLobbyRegistration.

-Added ini writer script for DSM.ini.
    Added: DSM_write_ini.

-Update amount shown in percentage.
    Changed: Updater (Create).

-Scoreboard opens/fades quicker.
    Changed: ScoreTableController (Create, Step).

-Added option to disable intel arrows.
    Changed: DSM_init, ScorePanel (Draw).

-Added capping percentage on CP based gamemodes.
    Changed: ControlPointHUD (Draw), ArenaHUD (Draw), KothHUD (Draw), DKothHUD (Draw).

-Generator health and shield values shown on HUD.
    Changed: GeneratorHUD (Draw).

-Heavy ammo count shown on HUD.
    Changed: AmmoCounter (Draw).

-Heavy ammo count does not go over 200.
    Changed: Minigun (Begin Step).

-Airblast does not disappear when it collides with an obstacle.
    Changed: AirBlastO (Collision with Obstacle).

-Aqua coloured ping is shown in lobby for pings less then 75.
    Changed: LobbyController (Draw).

-Added text to show current health number on health bar.
    Changed: Character (Draw).

-Added ammo "HP" bar.
    Changed: Character (Draw).

-Added ability to use Uber bubble (and option to remap).
    Changed: game_init, PlayerControl (Begin Step).

-Added DSM options menu.
    Changed: OptionsController (Create).
    Added: DSMOptionsController.

-Made generator be unable to be stabbed by Spies (toggle). -REMOVED-
    Changed: StabMask (Collision with generator), ClientCreate, LobbyController, GameServerCreate, serviceJoiningPlayer.

-Added Stats Tracker.
    Changed: WinBanner (Create), InGameMenuController (Create), Various projectile collision events.
    Added: statsTracker, addStats, writeStats, StatsDisplayController, menu_addtext, StatsDisplayValue, StatsDisplayMore, StatsDisplayKillsController, StatsDisplayKillsValue, calcAccuracy.

-Ubercharage % shown next to name and on superburst HUD.
    Changed: Character (Draw), UberHud (Draw).

-Added option to change text highlight colour.
    Changed: MenuController (Draw).

-Added auto-updating.
    Changed: DevMessageChecker (Create, Step), Updater (Create).

-Recoil animations are toggleable.
    Changed: Weapon (End Step), Medigun (Draw), Rifle (End Step), Minigun (Draw), Flamethrower (Create, End Step, Draw).

-Kill-log is toggleable.
    Changed: KillLog (Draw).

-Added recording.
    Changed: ClientBeginStep GameServerBeginStep GameServerCreate ClientCreate MainMenucontroller (Create),HostOptionsController (Create), GameServer (Destroy),
    -ServerJoinUpdate,
    deserializeState, Character (Draw), PlayerControl (Create), TeamSelectController (Create), and some other things.
    Added: beginRecording, endRecording, loadReplay, ReplayButtonS, ReplayGUI.

-Arrow drawn above healing target.
    Changed: Medigun (Draw).

-Full time until unlock shown on arena and KoTH.
    Changed: ArenaHUD (Draw), KothHUD (Draw).

-Added mappable screenshot key, F6 and F9 can still be used.
    Changed: SSControl, game_init.

-Laser fade occurs regardless of particle settings, because I want my fancy lasers :P
    Changed: Rifle (Draw).
    
-Added console.
    Too lazy to list things.

-Option to use Chu's war specting HUD.
    Changed: Spectator (Create).
    Added: AdvSpecS, AdvSpecHUD.
    
-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
Since most of the features are covered in here, I'll stop updating this.
Most of the new things that will be added will be pretty minor or extras for already existing things.
*/
