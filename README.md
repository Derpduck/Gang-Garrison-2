# Re-DSM Readme

## Current Version: v1

### Console
> Implemented an improved version of the console from E-Sports Mod. Press `F3` to open the console
- New console commands, improvements and bug fixes for old commands
- New visual style, features and improved UI:
	- Fullscreen button to adjust the size of the console window (or press F4)
	- Input box expands to fit text longer than 1 line
	- Multiple colors per line are now supported
- Press Tab to auto-complete typed commands
- New input shortcuts:
	- Shift + Enter to type a new line
		- New lines are treated as new arguments
	- CTRL + Backspace or CTRL + Delete to delete all typed text
	- PGUP and PGDN to scroll through output history
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
message | `message text` | Sents a custom pop-up message to all players | Host + RCON
password | `new password` | Changes the server password to the given text. Leave `new password` blank to remove the current password | Host + RCON
end | `optional: winning team` | Ends the current round. Specify `team` to select RED or BLUE as the winning team | Host + RCON
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
help | `optional: command name`| Prints documentation for the given command | Client
execute | `code text` | Runs the given text as GML code, use with caution | Client
rcon | `command`, `argument` | See RCON section |
quit || Immediately quits the game to desktop | Client
reboot || Immediately re-launches the game | Client
disconnect || Immediately leaves the server | Client
clear || Removes all console output history | Client
players || Prints a list of all players on the server and their ID numbers | Client
log || Saves the current console log to `/../DSM/Logs/` | Client
bind | `key`, `command` | Binds the given console command to the key | Client
unbind | `key` | Removes the bind assigned to the given key | Client
binds || Prints all saved binds | Client

#### RCON (Remote CONsole)
> Allows clients to use host only commands
- Host can either set a password which players login with or manually add RCON users
- Commands:
	- `rcon login <password>` - Client provides the correct password to gain RCON access
	- `rcon add <player>` - Host grants RCON access to given player
	- `rcon remove <player>` - Host removes RCON access to given player
	- `rcon password <new password>` - Host sets a new RCON password
	- `rcon toggle` - Host enables or disables RCON access
	- `rcon save` - Host toggles saving RCON logins
	- `rcon users` - Prints a list of all users with RCON access
- Multi-clienting hosts are automatically given RCON access


### Bug Fixes
- Fixed spectator checkpoints only being usable when a menu is open
- ~~Fixed multi-client limit disconnect message never being received by clients~~