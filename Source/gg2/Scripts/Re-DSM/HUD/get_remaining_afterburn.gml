// If burnDuration or burnIntensity equal or less than 0, no afterburn
// Every tick (30FPS), take damage equal to (burnIntensity / 30)
// Then reduce burnDuration by durationDecay
// And if player hasn't been hit by flames for decayDelay frames, start reducing burn intensity:
// Reduce burnIntensity linearly for decayDuration frames at which point afterburn damage reaches 0

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
