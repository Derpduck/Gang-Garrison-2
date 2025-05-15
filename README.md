# Re-DSM Readme

## Current Version: v1

### Console
> Implemented an improved version of the console from E-Sports Mod
- New commands and improvements to old ones
- Cleaner visual style that with improved display features
	- Fullscreen button to adjust the size of the console window (or press F4)
	- Input box expands to fit text longer than 1 line
	- Multiple colors per line are now supported
- Press Tab to auto-complete typed commands
- New input shortcuts
	- Shift + Enter to type a new line
	- CTRL + Backspace or CTRL + Delete to delete all typed text
	- PGUP and PGDN to scroll through output history
- RCON (Remote CONsole), allows clients to use admin protected commands
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
- Fixed many bugs and QOL issues found in previous implementations of the Console in DSM and E-Sports Mod

#### Console Commands
- kick `player`
- ban `player`
- tempban `player`
- unban `player IP`
- bans
- kill `player`
- gib `player`
- hurt `player` `damage`
- teleport `player`
- message `message text`
- password `new password`
- end `optional: winning team`
- map `map name
- maps
- rotation
- shuffle
- slots
- time
- restart
- classlimit
- team
- help
- execute
- rcon
- quit
- reboot
- disconnect
- clear
- players
- log



### Bug Fixes
- Fixed spectator checkpoints only being usable when a menu is open
- ~~Fixed multi-client limit disconnect message never being received by clients~~