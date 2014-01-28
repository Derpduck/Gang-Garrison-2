//For viewing stats in the ingame menu.
var hit, miss;
hit=(global.statsShotsHit+global.myself.stats[HIT])
miss=(global.statsShotsMissed+global.myself.stats[MISSED])

if (hit!=0) and (miss!=0){
    global.accuracy=(hit/(hit+miss))*100
    global.accuracy=round(global.accuracy)+(round(frac(global.accuracy)*100)/100)
}
