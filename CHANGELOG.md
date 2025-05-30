## V3 (2025/05/30)
### Console
- Added `fastend` command
	- Instantly ends the current round, skipping the map change delay

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
- Host options menus are now availabe to the host while in-game
	- Any changes made will be reflected live in-game
- Combined main and advanced host options into a single menu
- Combined controls menus into a single menu
- Adjusted positioning of menus
- Added lobby to in-game menu
	> Currently cannot connect to other games while in-game
- Moved manual join button to lobby menu
- Adjusted lobby ping color ranges and added more colors
- Added menu option type for setting numbers to non-integer values

### Freeze Time
- Added freeze time feature
	- Spawn doors will be locked until round is live
	- Countdown timer can be adjusted and notification messages disabled
	- Health, ammo, and uber charge are reset when round goes live

### UI
- Next map name is now shown on the map change screen
- Prevented custom notices messages from containing multiple lines of text

### Quality of Life
- Added option to disable automatically moving to spectator when AFK
- Added option to disable resizing the game window
- Added key bind for Superburst bubble (default: `R`)
- Added key bind for Infiltrator bubble (default: `G`)

### Miscellaneous
- Added option for taunt heal
	- Heal amount can be customized (default: `5`)

### Bug Fixes
- Fixed bug that consistently caused crashes when leaving and joining another server without leaving the lobby
	- TODO: Find the root cause and restore intended lobby behaviour
- Fixed afterburn duration being doubled on 60 FPS (`121b33c`)
- Fixed notice message sound being panned in non-4:3 resolutions
- Fixed sniper charge HUD being drawn under weapons
- Fixed changing respawn time in-game not updating the respawn time
- Fixed respawn timer being hidden while tracking a player
	- Dying causes you to track yourself, so the respawn timer was hidden until the camera was moved

## V2 (2025/05/23)
### Menus
- Added DSM options menus
- A randomly chosen built-in map is now featured as the menu background
- Menu tabs are now placed vertically down the side of options menus
- Back button will appear under tabs in options menus
- Menus now use the in-game resolution
- Menus will now scroll only if they are too big to fit on the screen, regardless of resolution

### Audio
- Added master volume option

### UI
- Re-worked kick and error message window
	- No longer freezes the game unless necessary
	- Fatal errors and multi-choice messages will still use the old window
	- Removed warning messages in the options menu for UPNP and server-sent plugins

### Performance
- Added `-high` launch option
	- Sets the process priority to high
- Added `-headless` launch option / `Re-DSM.ini` option
	- Disables all rendering
	- Frees backgrounds and sounds from memory
	- Enables dedicated mode

### Bug Fixes
- Fixed RCON access potentially being given to all players
- Fixed non-DSM clients crashing from receiving RCON data
- Fixed console font being replaced by server-sent chat's font
- Fixed console always printing your own server's name instead of the current server's name

## V1 (2025/05/16)
- Initial release