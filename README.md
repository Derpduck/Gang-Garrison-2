# Re-DSM Readme

## Current Version: v6

### Console
> Implemented an improved version of the console from E-Sports Mod  
> Press `F3` to open the console
- New console commands, improvements and bug fixes for old commands
- New visual style, features and improved UI:
	- Fullscreen button to adjust the size of the console window (or press `F4`)
	- Input box expands to fit multiple lines of text
	- Multiple colors per line are now supported
- Press `Tab` to auto-complete typed commands
- Input shortcuts:
	- `Up Arrow` and `Down Arrow` to scroll through input history
	- `PGUP` and `PGDN` to scroll through output history
	- `Shift + Enter` to type a new line
		- New lines are treated as new arguments
	- `CTRL + Backspace` or `CTRL + Delete` to delete all typed text
- Fixed many bugs and QOL issues found in previous implementations of the Console in DSM and E-Sports Mod

#### Console Commands
**Command** | **Arguments** | **Description** | **Access Level**
----------- | ------------- | --------------- | -----------
kick | `player` | Kicks the given player from the server | Host + RCON
ban | `player` | Bans the given player from the server permanently | Host Only
tempban | `player` | Bans the given player from the server for the current session | Host + RCOn
unban | `player IP` | Unbans the given player from the server | Host Only
bans || Prints a list of all banned players | Host Only
kill | `player` | Kills the given player | Host + RCON
gib | `player` | Kills the given player with a gib explosion | Host + RCON
hurt | `player`, `damage` | Deals damage to the given player | Host + RCON
teleport | `player` | Teleports the given player to the current cursor position | Host Only
message | `message text` | Sends a custom message to all players | Host + RCON
password | `new password` | Changes the server password to the given text. Leave `new password` blank to remove the current password | Host + RCON
end | `optional: winning team` | Ends the current round. Specify `team` to select RED or BLUE as the winning team | Host + RCON
fastend | `optional: winning team` | Ends the current round, instantly changes map. Specify `team` to select RED or BLUE as the winning team | Host + RCON
map | `map name` | Sets the next map to the given map | Host + RCON
maps || Prints the current map rotation order | Host Only
rotation | `new rotation` | Changes the current map rotation to the given rotation file. Specify true for `shuffle` to shuffle the rotation | Host Only
shuffle || Shuffles the current map rotation | Host + RCON
slots | `number of slots`| Sets the number of player slots allowed the server | Host + RCON
time | `time (in minutes)` | Sets the current round timer to the given number of minutes. Decimal values are accepted, e.g. 0.5 = 30 seconds | Host + RCON
restart || Restarts the current map | Host + RCON
classlimit | `class`, `new limit` | Changes the classlimit for the given class. 'All' changes all classlimits at once | Host + RCON
team | `player`, `new team`| Changes the given player's team to the given team, ignoring team balance | Host + RCON
scramble || Randomly shuffles the teams of all active players | Host + RCON
lobby || Toggles visibility of the server in the lobby | Host Only
help | `optional: command name`| Prints documentation for the given command. If no command is specified, prints a list of all available commands | Client
execute | `code text` | Runs the given text as GML code, use with caution | Client
rcon | `command`, `argument` | See RCON section |
quit || Immediately quits the game to desktop | Client
reboot || Immediately re-launches the game | Client
disconnect || Immediately leaves the server | Client
clear || Removes all console output history | Client
players || Prints a list of all players on the server and their ID numbers | Client
log || Saves the current console log to `/../DSM/Logs/` | Client
bind | `key`, `command` | Binds the given console command to the given key | Client
unbind | `key` | Removes the bind assigned to the given key | Client
binds || Prints all saved binds | Client

> The access level of commands can be changed in the `Server Management > Commands` menu

#### RCON (**R**emote **CON**sole)
> Allows clients to use host only commands
- Host can either set a password for players to login with, or manually add RCON users themselves
- Multi-clienting hosts are automatically given RCON access

**Command** | **Arguments** | **Description** | **Access Level**
----------- | ------------- | --------------- | -----------
`rcon login` | `password` | Asks for RCON access using the given password | Client
`rcon add` | `player` | Grants RCON access to the given player | Host Only
`rcon remove` | `player` | Removes RCON access from the given player | Host Only
`rcon password` | `new password` | Sets the RCON login password to the given text | Host Only
`rcon toggle` || Toggles RCON access on / off | Host Only
`rcon save` || Toggles saving of new RCON users on / off | Host Only
`rcon users` || Prints a list of all active RCON users | Host Only

### Gamemodes
#### All Gamemodes
- Added options to set time limits on a per-gamemode basis
#### DKoTH
> Added options to help prevent excessively long DKoTH games (disabled by default)

- **Stalemate Clock Countdown** - If neither team has captured a point for some time, start running down the clocks
	- **Stalemate Mode** determines how the clocks behave during a stalemate
		- **No Team Bias** - Both team's clocks run down at the same rate
		- **Losing Team's Favor** - The losing team's clock runs down faster than the winning team's
		- **Winning Team's Favor** - The winning team's clock runs down faster than the losing team's
	- **Stalemate Timer** determines how long it takes for a stalemate to trigger (default: `3 minutes`)
		- Contesting the point pauses the timer
	- **Stalemate Countdown Speed**  determines how quickly the clocks run down during a stalemate compared to normal (default `50%`)
> The game will go into overtime instead of ending if one team's timer reaches zero from a stalemate
	
- Added option to lock both control points for a set duration after a team captures both points (default: `10 seconds`)
	- Set to `0` to disable this feature
	- Contensting the point while it is locked will still trigger overtime
	> This guarentees additional time off the clock each time both points are captured

- Added option to set the overall match time limit
- Added option for overall time limit to not reset when a point is captured (default: `off`)
> By default DKoTH has a time limit that counts down while the points are neutral and uncontested, but any point being captured resets the time limit
> Turning this setting on will stop the time limit from being reset when a point is captured
	
- Added options to modify the capture speed depending on which team is capturing each point (for reference, the default capture time is `10 seconds`)
	- Home Point: How fast a team captures their own point (default: `100%`)
	- Enemy Point: How fast a team captures the enemy's point (default: `100%`)
	- Set to `100%` to disable this feature
> This is more of an experimental setting, and doesn't sync with clients very well

### HUD
- Made health bar and teammate stats enabled visible by default
- Added HP text display
	- Position and color can be customized
- Added ammo text display
	- Position and color can be customized
- Added ammo count bar
- Added Superburst bar
- Added Nuts 'N' Bolts bar
- Added Sandwich bar
- Added afterburn bar
- Added option for small sniper charge HUD sprite and charge damage numbers
- Added detailed scoreboard stats panel
- Added opacity options for the following HUD elements:
	- Info Bars
	- HP & Ammo Text
	- HP HUD
	- Ammo HUD
	- Class-specifc HUDs
	- Healing HUD
	- Healer Radar
	- Scoreboard
	- Kill Log
	- Timer
	- Gamemodes
- Added option to show the intel carrier's class

### Damage Indicator
- Added damage indicator
	- Accurate tracking of damage numbers for each target hit
	- Option to show healing given, self damage, and healing target's damage
	- Customizable visuals and audio
		- Custom hitsounds should be stored in `../DSM/Sounds/`

### Menus
- A randomly chosen built-in map is now featured as the menu background
- Menu tabs are now placed vertically down the side of options menus
- Back button will appear under tabs in options menus
- Menus now use the in-game resolution
- Menus will now scroll only if they are too big to fit on the screen, regardless of resolution
- Host options menus are now availabe to the host while in-game
	- Any changes made will be reflected live in-game
- Combined main and advanced host options into a single menu
- Combined controls menus into a single menu
- Added lobby to in-game menu
- Moved manual join button to lobby menu
- Adjusted lobby ping color ranges and added more colors
- Added menu option type for setting numbers to non-integer values
- Added server sent plugin list and server sent plugin required to the host options menu
- Number of characters remaining is now shown when editing your player name and server name

### Audio
- Added master volume option

### Freeze Time
- Added freeze time feature
	- Spawn doors will be locked until round is live
	- Countdown timer can be adjusted and notification messages disabled
	- Health, ammo, and uber charge are reset when round goes live

### UI
- Re-worked kick and error message window
	- No longer freezes the game unless necessary
	- Fatal errors and multi-choice messages will still use the old window
	- Removed warning messages in the options menu for UPNP and server-sent plugins
- Next map name is now shown on the map change screen
- Map download progress is displayed in KB on the download screen
- Prevented custom notices messages from containing multiple lines of text
- "Wrong number of players while deserializing state" error will now show the received and expected values

### Quality of Life
- Added option to disable automatically moving to spectator when AFK
- Added option to disable resizing the game window
- Added key bind for Superburst bubble (default key: `R`)
- Added key bind for Infiltrator bubble (default key: `G`)
- Added key bind to show map collisions (default key: `F7`)

### Miscellaneous
- Added option for taunt heal
	- Heal amount can be customized (default: `5`)
- Added option to skip the FAUCeT logo
- Increased default bandwidth limit for map downloads 
- Added FPS & ping displays
- Added window scale option
- Added borderless window option
- Added option to cycle through player's haxxy badges instead of showing all of them at once
- Added `-30fps` launch option to launch the game in 30 FPS, regardless of settings
- Added `-60fps` launch option to launch the game in 60 FPS, regardless of settings

### Performance
- Added `-high` launch option
	- Sets the process priority to high
- Added `-headless` launch option / `Re-DSM.ini` option
	- Disables all rendering
	- Frees backgrounds and sounds from memory
	- Enables dedicated mode

### Bug Fixes
- Fixed spectator checkpoints only being usable when a menu is open
- Fixed afterburn duration being doubled on 60 FPS (`121b33c`)
- Fixed notice message sound being panned in non-4:3 resolutions
- Fixed sniper charge HUD being drawn under weapons
- Fixed respawn timer being hidden while tracking a player
	- Dying causes you to track yourself, so the respawn timer was hidden until the camera was moved
- Fixed DKoTH control points unlocking never being sycned with clients
- Fixed DKoTH overall time limit not counting down if a player is standing on their own team's point
- Fixed KoTH overall time limit only counting down if the point has been captured
	- This prevented KoTH maps from ever ending on empty servers
- Fixed being instantly moved back to spectator when joining a team after being AFK
- Fixed window position going to the top left corner when exiting fullscreen
- Fixed superburst HUD bar appearing full when superburst is close to being fully charged