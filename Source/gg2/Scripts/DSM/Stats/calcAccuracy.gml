if (global.statsShotsHit!=0) and (global.statsShotsMissed!=0){
    global.accuracy=(global.statsShotsHit/(global.statsShotsHit+global.statsShotsMissed))*100
    global.accuracy=round(global.accuracy)+(round(frac(global.accuracy)*100)/100)
}
