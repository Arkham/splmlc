sync :two
#Pachebel Canon for Sonic Pi, played by Flute, Clarinet and Trombone sample based voices
#coded by Robin Newman, March 2015 MAC VERSION PART 2. RUN THIS THEN RUN PART 2
use_sample_pack_as '/Users/arkham/Desktop/Pachabel',:pachabel #adjust location as necessary
#first deal with selecting and setting up the samples

inst0=:pachabel__flute_ds5
samplepitch0=:ds5
inst1=:pachabel__clarinet_gs4
samplepitch1=:gs4
inst2=:pachabel__tenor_trombone_cs4
samplepitch2=:cs4

#define variables that need to be used globally
s=dsq=sq=sqd=q=qt=qd=qdd=c=cd=cdd=m=md=mdd=b=bd=0 #note duration variables
nf=[];df=[];nob=[];dob=[];ncl=[];dcl=[];nf2=[];df2=[];nob2=[];dob2=[];ncl2=[];dcl2=[];nf3=[];df3=[];nob3=[];dob3=[];ncl3=[];dcl3=[]

#put the sample names and pitches into an array i
i=[[inst0,samplepitch0],[inst1,samplepitch1],[inst2,samplepitch2]]
#set_bpm sets bpm required adjusting note duration variables accordingly
define :set_bpm do |n|
  s=1.0/8*60/n.to_f
  dsq = 1 * s #demisemiquaver
  sq = 2 * s #semiquaver
  sqd = 3 * s #semi quaver dotted
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
end
#this section sets the bpm then defines the note and duration arrays
define :setupparts do |bpmvalue|
  set_bpm(bpmvalue) #define notes and durations in terms of currrent bpm value
  nf=       [:r,:a4,:c5,:f5,:r,:g4,:c5,:e5,:r,:f4,:a4,:d5,:r,:e4,:a4,:c5,   :r,:d4,:f4,:bb4,:r,:f4,:a4,:c5,:r,:f4,:bb4,:d5,:r,:g4,:c5,:e5]
  nf.concat [:r,:a4,:c5,:f5,:r,:g4,:c5,:e5,:r,:f4,:a4,:d5,:r,:e4,:a4,:c5,   :r,:d4,:f4,:bb4,:r,:f4,:a4,:c5,:r,:f4,:bb4,:d5,:r,:g4,:c5,:e5]
  nf.concat [:r,:a4,:c5,:f5,:r,:g4,:c5,:e5,:r,:f4,:a4,:d5,:r,:e4,:a4,:c5,   :r,:d4,:f4,:bb4,:r,:f4,:a4,:c5,:r,:f4,:bb4,:d5,:r,:g4,:c5,:e5]
  nf.concat [:r,:a4,:c5,:f5,:r,:g4,:c5,:e5,:r,:f4,:a4,:d5,:r,:e4,:a4,:c5,   :r,:d4,:f4,:bb4,:r,:f4,:a4,:c5,:r,:f4,:bb4,:d5,:r,:g4,:c5,:e5]
  nf.concat [:r,:a4,:c5,:f5,:r,:g4,:c5,:e5,:r,:f4,:e4,:d5,:r,:e4,:a4,:c5,   :r,:d4,:f4,:bb4,:r,:f4,:a4,:c5,:r,:f4,:bb4,:d5,:c5,:g4,:e4,:r]
  df=[sq,sq,sq,sq]*4*10

  nob=[:r,:a5,:g5,:f5,:e5,:d5,:c5,:d5,:e5,:f5,:e5,:d5,:c5,:bb4,:a4,:bb4,:g4]
  nob.concat [:f4,:a4,:c5,:bb4,:a4,:f4,:a4,:g4,:f4,:d4,:f4,:c5,:bb4,:d5,:c5,:bb4,:a4,:f4,:g4,:e5,:f5,:a5,:c6,:c5,:d5,:bb4,:c5,:a4,:f4,:f5]+trn(:f5,6)+[:e5]
  dob=[b*2,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,c,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q]+trd(qd,6)+[sq]

  ncl=[:f4,:c4,:d4,:a3,:bb3,:f3,:bb3,:c4]*5
  dcl=[c,c,c,c]*10
  #second section
  nf2=[:f4,:a4,:c5,:bb4,:a4,:f4,:a4,:g4,:f4,:d4,:f4,:c5,:bb4,:d5,:c5,:bb4,:a4,:f4,:g4,:e5,:f5,:a5,:c6,:c5]
  nf2.concat [:d5,:bb4,:c5,:a4,:f4,:f5]+trn(:f5,6)+[:e5,:f5,:e5,:f5,:f4,:e4,:c5,:g4,:a4,:f4,:f5,:e5,:d5,:e5,:a5,:c6,:d6]
  df2=[q]*30+trd(qd,6)+[sq]*17
  #b16
  nf2.concat [:bb5,:a5,:g5,:bb5,:a5,:g5,:f5,:e5,:d5,:c5,:bb4,:a4,:g4,:bb4,:a4,:g4,:f4,:g4,:a4,:bb4,:c5,:g4,:c5,:bb4,:a4,:d5,:c5,:bb4,:c5,:bb4,:a4,:g4]
  #b18
  nf2.concat [:f4,:d4,:d5,:e5,:f5,:e5,:d5,:c5,:bb4,:a4,:g4,:d5,:c5,:d5,:c5,:c5,:c6,:a5,:bb5,:c6,:a5,:bb5,:c6,:c5,:d5,:e5,:f5,:g5,:a5,:bb5,:a5,:f5,:g5,:a5,:a4,:bb4,:c5,:d5,:c5,:bb4,:c5,:a4,:bb4,:c5]
  df2.concat [sq]*16*3+[sq,dsq,dsq,sq]+[dsq]*10+[sq,dsq,dsq,sq]+[dsq]*10
  #b20
  nf2.concat [:bb4,:d5,:c5,:bb4,:a4,:g4,:a4,:g4,:f4,:g4,:a4,:bb4,:c5,:d5,:bb4,:d5,:c5,:d5,:e5,:f5,:c5,:d5,:e5,:f5,:g5,:a5,:bb5,:c6]
  nf2.concat [:c6,:a5,:bb5,:c6,:a5,:bb5,:c6,:c5,:d5,:e5,:f5,:g5,:a5,:bb5,:a5,:f5,:g5,:a5,:a4,:b4,:c5,:d5,:c5,:bb4,:c5,:a4,:bb4,:c5]
  nf2.concat [:bb4,:d5,:c5,:bb4,:a4,:g4,:a4,:g4,:f4,:g4,:a4,:bb4,:c5,:d5,:bb4,:d5,:c5,:d5,:e5,:f5,:c5,:d5,:e5,:f5,:g5,:a5,:bb5,:c6]
  df2.concat ([sq,dsq,dsq,sq]+[dsq]*10)*6
  #b23
  nf2.concat [:a5,:f5,:g5,:a5,:g5,:f5,:g5,:e5,:f5,:g5,:a5,:g5,:f5,:e5,:f5,:d5,:e5,:f5,:f4,:g4,:a4,:bb4,:a4,:g4,:a4,:f5,:e5,:f5]
  nf2.concat [:d5,:f5,:e5,:d5,:c5,:bb4,:c5,:bb4,:a4,:bb4,:c5,:d5,:e5,:f5,:d5,:f5,:e5,:f5,:e5,:d5,:e5,:f5,:g5,:f5,:e5,:f5,:d5,:e5]
  nf2.concat [:f5,:f4,:g4,:a4,:f4,:e4,:e5,:f5,:g5,:e5,:d5,:d4,:e4,:f4,:d4,:e4,:c5,:bb4,:a4,:g4]
  nf2.concat [:f4,:bb4,:a4,:g4,:bb4,:a4,:f4,:g4,:a4,:c5,:bb4,:d5,:c5,:bb4,:a4,:g4,:c5,:bb4,:a4,:g4]
  nf2.concat [:a4,:f5,:e5,:f5,:a4,:c5,:c5,:d5,:e5,:c5,:a4,:f5,:g5,:a5,:f5,:a5,:a5,:g5,:f5,:e5]
  nf2.concat [:d5,:d5,:c5,:d5,:e5,:f5,:a5,:g5,:f5,:a5,:bb5,:f5,:e5,:d5,:d5,:c5,:g4,:c5,:c5]
  df2.concat ([sq,dsq,dsq,sq]+[dsq]*10)*4 +[sq,dsq,dsq,sq,sq]*15+[sq]*4
  #end b28

  #b11
  nob2=[:f5,:e5,:f5,:f4,:e4,:c5,:g4,:a4,:f4,:f5,:e5,:d5,:e5,:a5,:c6,:d6,:bb5,:a5,:g5,:bb5,:a5,:g5,:f5,:e5,:d5,:c5,:bb4,:a4,:g4,:bb4,:a4,:g4]
  nob2.concat [:f4,:g4,:a4,:bb4,:c5,:g4,:c5,:bb4,:a4,:d5,:c5,:bb4,:c5,:bb4,:a4,:g4,:f4,:d4,:d5,:e5,:f5,:e5,:d5,:c5,:bb4,:a4,:g4,:d5,:c5,:d5,:c5,:c5]
  #b15
  nob2.concat [:f4,:a4,:c5,:bb4,:a4,:f4,:a4,:g4,:f4,:d4,:f4,:c5,:bb4,:d5,:c5,:bb4,:a4,:f4,:g4,:e5,:f5,:a5,:c6,:c5,:d5,:bb4,:c5,:a4,:f4,:f5]+trn(:f5,6)+[:e5]
  dob2.concat [sq]*16*4+[q]*4*7+[q,q]+trd(qd,6)+[sq]
  #19
  nob2.concat [:f5,:e5,:f5,:f4,:e4,:c5,:g4,:a4,:f4,:f5,:e5,:d5,:e5,:a5,:c6,:d6,:bb5,:a5,:g5,:bb5,:a5,:g5,:f5,:e5,:d5,:c5,:bb4,:a4,:g4,:bb4,:a4,:g4]
  nob2.concat [:f4,:g4,:a4,:bb4,:c5,:g4,:c5,:bb4,:a4,:d5,:c5,:bb4,:c5,:bb4,:a4,:g4,:f4,:d4,:d5,:e5,:f5,:e5,:d5,:c5,:bb4,:a4,:g4,:d5,:c5,:d5,:c5,:c5]
  nob2.concat [:f4,:g4,:a4,:bb4,:c5,:g4,:c5,:bb4,:a4,:d5,:c5,:bb4,:c5,:bb4,:a4,:g4,:f4,:d4,:d5,:e5,:f5,:e5,:d5,:c5,:bb4,:a4,:g4,:d5,:c5,:d5,:c5,:c5]
  dob2.concat [sq]*16*6
  #b25
  nob2.concat [:f4,:a4,:c5,:bb4,:a4,:f4,:a4,:g4,:f4,:d4,:f4,:c5,:bb4,:d5,:c5,:bb4]
  nob2.concat [:a4,:f4,:g4,:a4,:f4,:e4,:e5,:f5,:g5,:e5,:d5,:d4,:e4,:f4,:d4,:e4,:c5,:bb4,:a4,:g4,:f4,:bb4,:a4,:g4,:bb4,:a4,:f4,:g4,:a4,:c5,:bb4,:d5,:c5,:bb4,:a4,:g4,:c5,:bb4,:a4,:g4]
  dob2.concat [q]*16+[sq,dsq,dsq,sq,sq]*8

  #b11
  ncl2=[:f4,:c4,:d4,:a3,:bb3,:f3,:bb3,:c4]*9
  dcl2=[c,c,c,c]*18

  #third section
  #b29
  nf3=[:f5,:e5,:d5,:c5,:bb4,:a4,:bb4,:g4,:r,:a4,:c5,:f5,:r,:g4,:c5,:e5,:r,:f4,:a4,:d5,:r,:e4,:a4,:c5,:r,:d4,:f4,:bb4,:r,:f4,:a4,:c5,:r,:f4,:bb4,:d5,:c5,:g4,:e4,:c4]
  df3=[c,c,c,c,c,c,c,c]+[sq]*7*4+[sq,1.1*sq,1.2*sq,1.3*sq,1.4*sq]#rit
  #b29
  nob3=[:r,:a4,:c5,:f5,:r,:g4,:c5,:e5,:r,:f4,:a4,:d5,:r,:e4,:a4,:c5,:r,:d4,:f4,:bb4,:r,:f4,:a4,:c5,:r,:f4,:bb4,:d5,:r,:g4,:c5,:e5]
  nob3.concat [:f5,:e5,:d5,:c5,:bb4,:a4,:bb4,:g4,]
  dob3=[sq]*4*8+[c,c,c,c,c,c,c,c+sq]#rit
  #b29
  ncl3=[:f4,:c4,:d4,:a3,:bb3,:f3,:bb3,:c4]*2
  dcl3=[c,c,c,c]*3+[c,c,c,c+sq] #rit
end
setupparts(68)#create note arrays with correct tempo settings
#now play the piece
with_fx :reverb,room: 0.6,mix: 0.3 do
  #first section
  in_thread {plarray(i[2][0],i[2][1],ncl,dcl,0.3)}
  in_thread {plarray(i[1][0],i[1][1],nob,dob,0.5)}
  plarray(i[0][0],i[0][1],nf,df)
  #repeated second section
  2.times do
    in_thread {plarray(i[2][0],i[2][1],ncl2,dcl2,0.3)}
    in_thread {plarray(i[1][0],i[1][1],nob2,dob2,0.5)}
    plarray(i[0][0],i[0][1],nf2,df2)
  end
  #third section
  in_thread {plarray(i[2][0],i[2][1],ncl3,dcl3,0.3)}
  in_thread {plarray(i[1][0],i[1][1],nob3,dob3,0.5)}
  plarray(i[0][0],i[0][1],nf3,df3)
  #final note no dampening
  #|inst,samplepitch,nv,dv,vol=1,damp=1|
  pl(i[0][0],i[0][1],:f4,c*1.5,1,0)
  pl(i[1][0],i[1][1],:f4,c*1.5,0.5,0)
  pl(i[2][0],i[2][1],:f4,c*1.5,0.3,0)
  sleep md*1.2
end
