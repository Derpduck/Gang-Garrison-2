## V5 (WIP)
### Gamemodes
#### DKoTH
- Added options to help prevent excessively long DKoTH games (disabled by default)
	- Option to reduce both teams clocks during a stalemate
		- Choose a stalemate modes to change how the clocks behave during a stalemate
			- Losing Team's Favor - The losing team's clock counts down faster than the winning team's
			- Winning Team's Favor - The winning team's clock counts down faster than the losing team's
			- Equal Count Down - Both team's clocks count down at the same rate
		- Stalemate timer determines how long both points need to go uncaptured for before the clocks start counting down (default: `3 minutes`)
			- Contesting the point will pause the timer
		- Stalemate countdown speed determines how fast the clocks count down as a percentage of their normal speed (default `50%`)
		- The game will go into overtime instead of ending if one team's timer reaches zero
	- Option to lock both control points for a set duration after a team captures both points (default: `10 seconds`)
		- Set to `0` to disable this feature
		- Contensting the point while it is locked will still trigger overtime
		> This guarentees additional time off the clock each time both points are captured
	- Options to modify the capture speed depending on which team is capturing each point (for reference, the default capture time is `10 seconds`)
		- Home Point: How fast a team captures their own point (default: `100%`)
		- Enemy Point: How fast a team captures the enemy's point (default: `100%`)
		- Set to `100%` to disable this feature
> In addition to the above, the option to change the overall DKoTH time limit for both teams is available in the Time Limits host options menu

### HUD
- HP and ammo text under cursor position option now only applies to yourself
- Changed HP and ammo text option to show above name to show above info bars
- Added option to show Sentry HP text
- Changed damage indicator scale to be represented as a percent
	> Be sure to adjust your settings accordingly

### Menus
- Lobby menus can now be used to connect to other servers while in-game
	- This was disabled due to the crash bug fixed in this update
- Options that represent a percentage value will now be shown with a % sign

### Quality of Life
- Added key bind to show map collisions (default key: `F7`)

### Miscellaneous
- Added a prompt for when a default value for an option has changed to set that option to the new default
	- These prompts will only show one time

### Bug Fixes
- Fixed wrong number of players crash when downloading a new map
- Fixed freeze time countdown messages not being sent to clients
- Fixed `message` command not sending messages to clients
- Fixed DKoTH control points unlocking never being sycned with clients

## V4 (2025/06/02)
### Gamemodes
- Added options to set time limits on a per-gamemode basis

### HUD
- Changed ammo text display default to show for self only

### Menus
- Added server sent plugin list and server sent plugin required to the host options menu

### UI
- Map download progress is displayed in KB on the download screen
- "Wrong number of players while deserializing state" error will now show the received and expected values

### Miscellaneous
- Added option to skip the FAUCeT logo
- Increased default bandwidth limit for map downloads 

### Bug Fixes
- Fixed host warnings controller incorrectly stating that the rotation will be shuffled when switching to the classlimits menu
- Fixed error when changing damage indicator show healing target's damage setting
- Fixed health and ammo number displays overlapping if both are set to the same position
- Fixed air blast team error

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