var time;
time=floor((global.statsTime+global.inGameTime)/1800) //Minutes

if time=0 time=string("00")
global.displayTime=string(string(time))
