// If burnDuration or burnIntensity equal or less than 0, no afterburn
// Every tick (30FPS), take damage equal to (burnIntensity / 30)
// Then reduce burnDuration by (durationDecay * global.delta_factor)
// And if player hasn't been hit by flames for (decayDelay / global.delta_factor) frames (alarm[0] == -1):
// Reduce burnIntensity by intensityDecay every frame
// Intensity decay is set to (burnIntensity / decayDuration) when decayDelay (alarm[0]) triggers

if (burnDuration <= 0 or burnIntensity <= 0)
    return 0;


// Calculate damage before decay
var durationBeforeDecay, damageBeforeDecay;
durationBeforeDecay = max(0, min(alarm[0] * global.delta_factor, burnDuration));
damageBeforeDecay = durationBeforeDecay * (burnIntensity / 30);


// Calculate damage after decay, linear decay
var durationAfterDecay, damageAfterDecay;
durationAfterDecay = min(decayDuration, burnDuration - durationBeforeDecay);
damageAfterDecay = ((burnIntensity / 30) * durationAfterDecay) / 2;


return damageBeforeDecay + damageAfterDecay;

/*
var durationBeforeDecay, durationAfterDecay, afterburnBeforeDecay, afterburnAfterDecay;
if (alarm[0] != -1)
{
    durationBeforeDecay = burnDuration - alarm[0];
    durationAfterDecay = burnDuration - durationBeforeDecay;
}
else
{
    durationBeforeDecay = 0;
    durationAfterDecay = burnDuration;
}

afterburnBeforeDecay = (burnIntensity * durationBeforeDecay) / 30;

//var burnIntensityAfterDecay;
//burnIntensityAfterDecay
afterburnAfterDecay = ((burnIntensity * durationAfterDecay) / 30) / 2;


return afterburnBeforeDecay + afterburnAfterDecay;

//afterburn stuff
/*burnIntensity = 0; // "heat"
burnDuration = 0; // "fuel"
decayDelay = 90; //time between last ignition and intensity lowering
decayDuration = 90; //time between intensity lowering and zeroing out
durationDecay = 1; //amount that duration lowers per step
intensityDecay = burnIntensity / decayDuration;
