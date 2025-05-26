// Calculate 
return 0;
/*
//afterburn stuff
burnIntensity = 0; // "heat"
legIntensity = 7; // afterburn intensity after which additional intsity additions are halved.
                  // it's called a "leg" becauase of a similar concept in dynamic range compression.
maxIntensity = 13; //maximum afterburn intensity in DPS
burnDuration = 0; // "fuel"
maxDuration = 210; //maximum afterburn length in duration ticks (see durationDecay)
decayDelay = 90; //time between last ignition and intensity lowering
decayDuration = 90; //time between intensity lowering and zeroing out
durationDecay = 1; //amount that duration lowers per step
intensityDecay = burnIntensity / decayDuration;

if (global.run_virtual_ticks)
{
    if (burnDuration > 0)
    {
        if(hp > 0)
        {  
            dealDamage(lastDamageDealer, id, burnIntensity / 30);
        }
        burnDuration -= durationDecay * global.delta_factor;
    }
    if (alarm[0] == -1 && burnIntensity > 0) burnIntensity -= intensityDecay;
    if (burnDuration <= 0 || burnIntensity <= 0)
    {
        burnDuration = 0;
        burnIntensity = 0;
        burnedBy = -1;
        afterburnSource = -1;
    }
}

//alarm 0
intensityDecay = burnIntensity / decayDuration;

// afterburn stuff - flame hitting player
{
    other.burnDuration += durationIncrease; 
    
    var falloffAmount;
    falloffAmount = min(1, // factor can't exceed 1
        (flameLife - alarm[0]*global.delta_factor) // value higher when life is fresh (alarm 0 is high)
        /flameLife); // normalize to 1
    if(afterburnFalloff)
        falloffFactor = falloffAmount*0.65+0.35; // Reduce heat additions of "old"/distant flames -- 0.35 to 1.0 "curve"
    else
        falloffFactor = 1;
    
    if(other.burnIntensity > other.legIntensity and afterburnFalloff) // reduce heat additions above the "leg" heat
        falloffFactor /= 2;
    
    other.burnIntensity += burnIncrease * falloffFactor;
        
    other.burnDuration = min(other.burnDuration, other.maxDuration);
    other.burnIntensity = min(other.burnIntensity, other.maxIntensity);
    
    other.burnedBy = ownerPlayer;
    other.afterburnSource = weapon;
    other.alarm[0] = other.decayDelay / global.delta_factor;
}
