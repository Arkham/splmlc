#Pachebel Canon for Sonic Pi, played by Flute, Clarinet and Trombone sample based voices
#coded by Robin Newman, March 2015 MAC VERSION PART 1. RUN PART 2 THEN RUN THIS PART 1
#requires Pitch_Ration function (included) which will be in SP 2.5. From this version it can be commented out
#score from www.freegigmusic.com (version for flute oboe and clarinet)
#Download samples from http://r.newman.ch/rpi/Pachabel.zip
use_debug false
use_sample_pack_as '/Users/Arkham/Desktop/Pachabel',:pachabel #adjust location as necessary
#first deal with selecting and setting up the samples

inst0=:pachabel__flute_ds5
samplepitch0=:ds5ac
inst1=:pachabel__clarinet_gs4
samplepitch1=:gs4
inst2=:pachabel__tenor_trombone_cs4
samplepitch2=:cs4

#preload all the samples
load_flag=0
if sample_loaded? inst0 then #check if sample already loaded
  flag=1
end
load_samples [inst0,inst1,inst2]
if load_flag==0 then #samples not loaded so allow time
  sleep 3
end

define :ntosym do |n| #this returns the equivalent note symbol to an input integer e.g. 59 => :b4
  #nb no error checking on integer range included
  #only returns notes as n or n sharps.But will sound ok for flats
  note=n % 12
  octave = n / 12 - 1
  #puts octave #for debugging
  #puts note
  lookup_notes = {0 =>:c, 1 =>:cs,2 =>:d,3 =>:ds,4 =>:e,5 =>:f,6 =>:fs,7 =>:g,8 =>:gs,9 =>:a,10 =>:as,11 =>:b}
  return (lookup_notes[note].to_s + octave.to_s).to_sym #return the required note symbol
end

#prior to the release of version 2.5 you need the next function
#if you get an error message saying it exists then delete it or comment it out

#this function plays the sample at the relevant pitch for the note desired
#the note duration is used to set up the envelope parameters
define :pl do |inst,samplepitch,nv,dv,vol=1,damp=1|
  shift=note(nv)-note(samplepitch)
  if damp==1 then
    sample inst,rate: (pitch_to_ratio shift),sustain: 0.8*dv,release: 0.2*dv,amp: vol
  else
    sample inst,rate: (pitch_to_ratio shift),sustain: 0.8*dv,release: dv,amp: vol #no damping
  end
end

#this function plays an array of notes and associated array of durations
#also uses sample name (inst), sample normal pitch, and shift (transpose) parameters
define :plarray do |inst,samplepitch,narray,darray,vol=1,shift=0|
  narray.zip(darray) do |nv,dv|
    if nv != :r
      pl(inst,samplepitch,note(nv)+shift,dv,vol)
    end
    sleep dv
  end
end



define :trn do |n,num,offset=2| #works out notes for a trill
  @n = note_info(n).midi_note
  return [ntosym(@n+offset),n]*(num / 2)
end

define :trd do |d,num| #works out durations for a trill
  return [d/num]*num
end

cue :two
