#Flight of the Bumble Bee (part 1) coded by Robin Newman Jan 2015
use_sample_pack '/Users/arkham/Desktop/BumbleBee' #RPi adjust if necessary
set_sched_ahead_time! 2
rt=2**(1.0/12) #semitone rate multiplier
irt=1.0/rt #inverse of above to go down semitone
sh=-7 #transpose shift
s = 1.0 / 20 #speed scale factor
loadflag=0 #used to allow sample load time
dtime=5 #for RPi. Change to 5 for Mac or PC
ps="xylophone_"
define :sname do |sn,n| #generates sample name as a symbol
  return (sn+n).intern
end
#built sample note array for xylophone
sam = [[:g2,sname(ps,"g2"),1],[:gs2,sname(ps,"g2"),rt]]
sam.concat [[:a2,sname(ps,"as2"),irt],[:as2,sname(ps,"as2"),1],[:b2,sname(ps,"as2"),rt]]
sam.concat [[:c3,sname(ps,"cs3"),irt],[:cs3,sname(ps,"cs3"),1],[:d3,sname(ps,"cs3"),rt]]
sam.concat [[:ds3,sname(ps,"e3"),irt],[:e3,sname(ps,"e3"),1],[:f3,sname(ps,"e3"),rt]]
sam.concat [[:fs3,sname(ps,"g3"),irt],[:g3,sname(ps,"g3"),1],[:gs3,sname(ps,"g3"),rt]]
sam.concat [[:a3,sname(ps,"as3"),irt],[:as3,sname(ps,"as3"),1],[:b3,sname(ps,"as3"),rt]]
sam.concat [[:c4,sname(ps,"cs4"),irt],[:cs4,sname(ps,"cs4"),1],[:d4,sname(ps,"cs4"),rt]]
sam.concat [[:ds4,sname(ps,"e4"),irt],[:e4,sname(ps,"e4"),1],[:f4,sname(ps,"e4"),rt]]
sam.concat [[:fs4,sname(ps,"g4"),irt],[:g4,sname(ps,"g4"),1],[:gs4,sname(ps,"g4"),rt]]
sam.concat [[:a4,sname(ps,"as4"),irt],[:as4,sname(ps,"as4"),1],[:b4,sname(ps,"as4"),rt]]
sam.concat [[:c5,sname(ps,"cs5"),irt],[:cs5,sname(ps,"cs5"),1],[:d5,sname(ps,"cs5"),rt]]
sam.concat [[:ds5,sname(ps,"e5"),irt],[:e5,sname(ps,"e5"),1],[:f5,sname(ps,"e5"),rt]]
sam.concat [[:fs5,sname(ps,"g5"),irt],[:g5,sname(ps,"g5"),1],[:gs5,sname(ps,"g5"),rt]]
sam.concat [[:a5,sname(ps,"as5"),irt],[:as5,sname(ps,"as5"),1],[:b5,sname(ps,"as5"),rt]]
sam.concat [[:c6,sname(ps,"cs5"),irt*2],[:cs6,sname(ps,"cs5"),2],[:d6,sname(ps,"cs5"),rt*2]]
sam.concat [[:ds6,sname(ps,"e5"),irt*2],[:e6,sname(ps,"e5"),2],[:f6,sname(ps,"e5"),rt*2]]
sam.concat [[:fs6,sname(ps,"g5"),irt*2],[:g6,sname(ps,"g5"),2],[:gs6,sname(ps,"g5"),rt*2]]
sam.concat [[:a6,sname(ps,"as5"),irt*2],[:as6,sname(ps,"as5"),2],[:b6,sname(ps,"as5"),rt*2]]
sam.each do |s| #load the samples
  load_sample s[1]
end
#add aliases for flats and es,bs
flat=[:ab2,:bb2,:cb2,:db3,:eb3,:fb3,:gb3,:ab3,:bb3,:cb3,:db4,:eb4,:fb4,:gb4,:ab4,:bb4,:cb4,:db5,:eb5,:fb5,:gb5,:ab5,:bb5,:cb5,:db6,:eb6,:fb6,:gb6,:ab6,:bb6,:cb6,]
sharp=[:gs2,:as2,:b2,:cs3,:ds3,:e3,:fs3,:gs3,:as3,:b3,:cs4,:ds4,:e4,:fs4,:gs4,:as4,:b4,:cs5,:ds5,:e5,:fs5,:gs5,:as5,:b5,:cs6,:ds6,:e6,:fs6,:gs6,:as6,:b6]
#add es and bs with aliases
flat.concat [:es3,:es4,:es5,:es6,:bs2,:bs3,:bs4,:bs5]
sharp.concat [:f3,:f4,:f5,:f6,:c3,:c4,:c5,:c6]
extra=[]
flat.zip(sharp).each do |f,s|
  extra.concat [[f,(sam.assoc(s)[1]),(sam.assoc(s)[2])]]
end
sam = sam + extra
# now repeat to build piano sample note array
ps="piano_f_"
samp = [[:c1,sname(ps,"c1"),1],[:cs1,sname(ps,"c1"),rt]]
samp.concat [[:d1,sname(ps,"ds1"),irt],[:ds1,sname(ps,"ds1"),1],[:e1,sname(ps,"ds1"),rt]]
samp.concat [[:f1,sname(ps,"fs1"),irt],[:fs1,sname(ps,"fs1"),1],[:g1,sname(ps,"fs1"),rt]]
samp.concat [[:gs1,sname(ps,"a1"),irt],[:a1,sname(ps,"a1"),1],[:as1,sname(ps,"a1"),rt]]
samp.concat [[:b1,sname(ps,"c2"),irt],[:c2,sname(ps,"c2"),1],[:cs2,sname(ps,"c2"),rt]]
samp.concat [[:d2,sname(ps,"ds2"),irt],[:ds2,sname(ps,"ds2"),1],[:e2,sname(ps,"ds2"),rt]]
samp.concat [[:f2,sname(ps,"fs2"),irt],[:fs2,sname(ps,"fs2"),1],[:g2,sname(ps,"fs2"),rt]]
samp.concat [[:gs2,sname(ps,"a2"),irt],[:a2,sname(ps,"a2"),1],[:as2,sname(ps,"a2"),rt]]
samp.concat [[:b2,sname(ps,"c3"),irt],[:c3,sname(ps,"c3"),1],[:cs3,sname(ps,"c3"),rt]]
samp.concat [[:d3,sname(ps,"ds3"),irt],[:ds3,sname(ps,"ds3"),1],[:e3,sname(ps,"ds3"),rt]]
samp.concat [[:f3,sname(ps,"fs3"),irt],[:fs3,sname(ps,"fs3"),1],[:g3,sname(ps,"fs3"),rt]]
samp.concat [[:gs3,sname(ps,"a3"),irt],[:a3,sname(ps,"a3"),1],[:as3,sname(ps,"a3"),rt]]
samp.concat [[:b3,sname(ps,"c4"),irt],[:c4,sname(ps,"c4"),1],[:cs4,sname(ps,"c4"),rt]]
samp.concat [[:d4,sname(ps,"ds4"),irt],[:ds4,sname(ps,"ds4"),1],[:e4,sname(ps,"ds4"),rt]]
samp.concat [[:f4,sname(ps,"fs4"),irt],[:fs4,sname(ps,"fs4"),1],[:g4,sname(ps,"fs4"),rt]]
samp.concat [[:gs4,sname(ps,"a4"),irt],[:a4,sname(ps,"a4"),1],[:as4,sname(ps,"a4"),rt]]
samp.concat [[:b4,sname(ps,"c5"),irt],[:c5,sname(ps,"c5"),1],[:cs5,sname(ps,"c5"),rt]]
samp.concat [[:d5,sname(ps,"ds5"),irt],[:ds5,sname(ps,"ds5"),1],[:e5,sname(ps,"ds5"),rt]]
samp.concat [[:f5,sname(ps,"fs5"),irt],[:fs5,sname(ps,"fs5"),1],[:g5,sname(ps,"fs5"),rt]]
samp.concat [[:gs5,sname(ps,"a5"),irt],[:a5,sname(ps,"a5"),1],[:as5,sname(ps,"a5"),rt]]
samp.concat [[:b5,sname(ps,"c6"),irt],[:c6,sname(ps,"c6"),1],[:cs6,sname(ps,"c6"),rt]]
samp.concat [[:d6,sname(ps,"ds6"),irt],[:ds6,sname(ps,"ds6"),1],[:e6,sname(ps,"ds6"),rt]]
samp.concat [[:f6,sname(ps,"fs6"),irt],[:fs6,sname(ps,"fs6"),1],[:g6,sname(ps,"fs6"),rt]]
samp.concat [[:gs6,sname(ps,"a6"),irt],[:a6,sname(ps,"a6"),1],[:as6,sname(ps,"a6"),rt]]
samp.concat [[:b6,sname(ps,"c7"),irt],[:c7,sname(ps,"c7"),1],[:cs7,sname(ps,"c7"),rt]]
samp.concat [[:d7,sname(ps,"ds7"),irt],[:ds7,sname(ps,"ds7"),1],[:e7,sname(ps,"ds7"),rt]]
samp.concat [[:f7,sname(ps,"fs7"),irt],[:fs7,sname(ps,"fs7"),1],[:g7,sname(ps,"fs7"),rt]]
samp.concat [[:gs7,sname(ps,"a7"),irt],[:a7,sname(ps,"a7"),1],[:as7,sname(ps,"a7"),rt]]
samp.concat [[:b7,sname(ps,"c8"),irt],[:c8,sname(ps,"c8"),1]]
if sample_loaded? :piano_f_c8 then #comment out this and next 2 lines in Windows ver 2.1.1
  loadflag=1 #comment out for Windows 2.1.1
end #comment out for windows 2.1.1
samp.each do |s| #load the samples
  load_sample s[1]
end
#puts "flag "+ loadflag.to_s #uncomment for test purposes
if loadflag==0 then #allow samples to load completely
  sleep dtime
end
#add aliases for flats and es,bs
flatp=[:db1,:eb1,:fb1,:gb1,:ab1,:bb1,:cb2,:db2,:eb2,:fb2,:gb2,:ab2,:bb2,:cb3,:db3,:eb3,:fb3,:gb3,:ab3,:bb3,:cb3,:db4,:eb4,:fb4,:gb4,:ab4,:bb4,:cb4,:db5,:eb5,:fb5,:gb5,:ab5,:bb5,:cb5,:db6,:eb6,:fb6,:gb6,:ab6,:bb6,:cb7,:db7,:eb7,:fb7,:gb7,:ab7,:bb7,:cb8]
sharpp=[:cs1,:ds1,:e1,:fs1,:gs1,:as1,:b1,:cs2,:ds2,:e2,:fs2,:gs2,:as2,:b2,:cs3,:ds3,:e3,:fs3,:gs3,:as3,:b3,:cs4,:ds4,:e4,:fs4,:gs4,:as4,:b4,:cs5,:ds5,:e5,:fs5,:gs5,:as5,:b5,:cs6,:ds6,:e6,:fs6,:gs6,:as6,:b6,:cs7,:ds7,:e7,:fs7,:gs7,:as7,:b7]
#add es and bs with aliases
flatp.concat [:es1,:es2,:es3,:es4,:es5,:es6,:es7,:bs1,:bs2,:bs3,:bs4,:bs5,:bs6,:bs7]
sharpp.concat [:f1,:f2,:f3,:f4,:f5,:f6,:f7,:c2,:c3,:c4,:c5,:c6,:c7,:c8]
extrap=[]
flatp.zip(sharpp).each do |f,s|
  extrap.concat [[f,(samp.assoc(s)[1]),(samp.assoc(s)[2])]]
end
samp = samp + extrap #add in flat definitions
#define functions to play piano and xylophone notes
define :plp do |n,d=0.2,pan=0,v=0.8| #piano
  sample (samp.assoc(n)[1]),rate: (samp.assoc(n)[2]),attack: 0,sustain: d*0.95,release: d,amp: v,pan: pan
end
define :pl do |n,d=0.2,pan=0,v=0.8|#xylophone
  sample (sam.assoc(n)[1]),rate: (sam.assoc(n)[2]),attack: 0,sustain: d*0.95,release: d*0.05,amp: v,pan: pan
end
define :ntosym do |n| #converts note number to sympbol
  @note=n % 12
  @octave = n / 12 - 1
  lookup_notes = {
    0  => :c,
    1  => :cs,
    2  => :d,
    3  => :ds,
    4  => :e,
    5  => :f,
    6  => :fs,
    7  => :g,
    8  => :gs,
    9  => :a,
    10 => :as,
  11 => :b}
  return (lookup_notes[@note].to_s + @octave.to_s).to_sym
end
define :tr do |nv,sh| #transposes note by sh
  return ntosym(note(nv)+sh)
end
dsq = 1 * s #define note duration values scaled by s
sq = 2 * s
sqd = 3 * s
q = 4 * s
qt = 2.0/3*q
qd = 6 * s
qdd = 7 * s
c = 8 * s
cd = 12 * s
cdd = 14 * s
m = 16 * s
md = 24 * s
mdd = 28 * s
b = 32 * s
bd = 48 * s
define :plarray do |nt,dur,sh=0,vol=0.6,pan=0| #play note/duration array for xylophone
  nt.zip(dur).each do |n,d|
    if n != :r then
      pl(tr(n,sh),d,pan,vol)
    end
    sleep d
  end
end
define :plarrayp do |nt,dur,sh=0,vol=0.6,pan=0| #play note/duration array for piano
  nt.zip(dur).each do |n,d|
    if n != :r then
      plp(tr(n,sh),d,pan,vol)
    end
    sleep d
  end
end
define :ch do |n1,n2,n3| #play a piano chord (all quaver length)
  plp(tr(n1,sh),q,0,0.3)
  plp(tr(n2,sh),q,0,0.3)
  plp(tr(n3,sh),q,0,0.3)
  sleep q
end
define :chp do |ca,da| #play array of piano chords ca (each 3 notes) with corresponding "gaps" array da
  ca.zip(da).each do |cl,dv|
    ch(cl[0],cl[1],cl[2])
    sleep dv
  end
end
cue :b2 #cue second half of program
