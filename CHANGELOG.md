## V5 (WIP)
### Console
- Added options to change the access level of console commands
> This can be found in the Server Management menu
> Changing access levels for some commands may cause unintended behaviour or errors currently, especially for clients as the access levels are set locally

### Gamemodes
#### KoTH
- Added option to change overall time limit
> This time limit only counts down while the point is uncaptured and uncontested

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
- HP and ammo text under cursor position option now only applies to yourself
- Changed HP and ammo text option to show above name to show above info bars
- Added option to show Sentry HP text
- Changed damage indicator scale to be represented as a percent
	> Be sure to adjust your settings accordingly
- Split sniper charge HUD options into two separate options

### Menus
- Lobby menus can now be used to connect to other servers while in-game
	- This was disabled due to the crash bug fixed in this update
- Options that represent a percentage value will now be shown with a % sign
- DSM Hosting options menu now only visible from the main menu or when hosting
- Number of characters remaining is now shown when editing your player name and server name
- Split HUD options into multiple separate menus
- Added scrolling for menu tabs

### Quality of Life
- Added key bind to show map collisions (default key: `F7`)

### Miscellaneous
- Added a prompt for when the default value for an option has changed and may need resetting
	- These prompts will only show one time
- Added FPS & ping displays
- Added window scale option
- Added borderless window option
- Added option to cycle through player's haxxy badges instead of showing all of them at once

### Bug Fixes
- Fixed wrong number of players crash when downloading a new map
- Fixed freeze time countdown messages not being sent to clients
- Fixed `message` command not sending messages to clients
- Fixed DKoTH control points unlocking never being sycned with clients
- Fixed DKoTH overall time limit not counting down if a player is standing on their own team's point
- Fixed KoTH overall time limit only counting down if the point has been captured
	- This prevented KoTH maps from ever ending on empty servers
- Fixed being instantly moved back to spectator when joining a team after being AFK
- Fixed window position going to the top left corner when exiting fullscreen

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