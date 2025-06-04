# Re-DSM Readme

## Current Version: v4

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
**Command** | **Arguments** | **Description** | **Usage**
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

#### RCON (**R**emote **CON**sole)
> Allows clients to use host only commands
- Host can either set a password for players to login with, or manually add RCON users themselves
- Multi-clienting hosts are automatically given RCON access

**Command** | **Arguments** | **Description** | **Usage**
----------- | ------------- | --------------- | -----------
`rcon login` | `password` | Asks for RCON access using the given password | Client
`rcon add` | `player` | Grants RCON access to the given player | Host Only
`rcon remove` | `player` | Removes RCON access from the given player | Host Only
`rcon password` | `new password` | Sets the RCON login password to the given text | Host Only
`rcon toggle` || Toggles RCON access on / off | Host Only
`rcon save` || Toggles saving of new RCON users on / off | Host Only
`rcon users` || Prints a list of all active RCON users | Host Only

### Gamemodes
- Added options to set time limits on a per-gamemode basis

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
- Added option for improved sniper charge HUD sprite and damage numbers
- Added detailed scoreboard stats panel

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
	> Currently cannot connect to other games while in-game
- Moved manual join button to lobby menu
- Adjusted lobby ping color ranges and added more colors
- Added menu option type for setting numbers to non-integer values
- Added server sent plugin list and server sent plugin required to the host options menu

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

### Miscellaneous
- Added option for taunt heal
	- Heal amount can be customized (default: `5`)
- Added option to skip the FAUCeT logo
- Increased default bandwidth limit for map downloads 

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