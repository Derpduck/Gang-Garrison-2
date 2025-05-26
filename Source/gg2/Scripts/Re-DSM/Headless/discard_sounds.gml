// Removes all sounds from memory
sound_stop_all();

for (i=0; i<100; i+=1)
{
    sound_discard(i);
};
