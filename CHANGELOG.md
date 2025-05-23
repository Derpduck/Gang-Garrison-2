## V2 (WIP)
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