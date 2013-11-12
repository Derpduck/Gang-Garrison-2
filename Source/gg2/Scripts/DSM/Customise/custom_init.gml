ini_open("DSM.ini")
global.textHighlightColour=ini_read_real("Custom","TextHighlightColour",0)
global.dsmBackground=ini_read_real("Custom","DSMBG",1)

ini_write_real("Custom","TextHighlightColour",global.textHighlightColour)
ini_write_real("Custom","DSMBG",global.dsmBackground)
ini_close()

spriteLoader()
soundLoader()
