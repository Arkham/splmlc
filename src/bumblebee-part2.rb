# Welcome to Sonic Pi v2.7

#Flight of The Bumble Bee (part 2) coded by Robin Newman Jan 2015
#needs part one in a separate workspace. Start THIS part running THEN switch ws and start part 1
#They sync together
sync :b2
use_sample_pack '/Users/arkham/Desktop/BumbleBee' #Mac
rt=2**(1.0/12)
irt=1.0/rt
sh=-7
s = 1.0 / 20
dsq = 1 * s
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
#start defining note and duration arrays
#xylophone part
nt = [:e6,:ds6,:d6,:cs6,:d6,:cs6,:c6,:b5,:c6,:b5,:bb5,:a5,:gs5,:g5,:fs5,:f5,:e5,:ds5,:d5,:cs5,:d5,:cs5,:c5,:b4]
#b4
nt.concat [:c5,:b4,:bb4,:a4,:gs4,:g4,:fs4,:f4,:e4,:ds4,:d4,:cs4,:d4,:cs4,:c4,:b3,:e4,:ds4,:d4,:cs4,:d4,:cs4,:c4,:b3]
nt.concat [:e4,:ds4,:d4,:cs4,:c4,:f4,:e4,:ds4,:e4,:ds4,:d4,:cs4,:c4,:cs4,:d4,:ds4,:e4,:ds4,:d4,:cs4,:c4,:f4,:e4,:ds4]
#b10
nt.concat [:e4,:ds4,:d4,:cs4,:c4,:cs4,:d4,:ds4,:e4,:ds4,:d4,:cs4,:d4,:cs4,:c4,:b3,:c4,:cs4,:d4,:ds4,:e4,:f4,:e4,:ds4]
nt.concat [:e4,:ds4,:d4,:cs4,:d4,:cs4,:c4,:b3,:c4,:cs4,:d4,:ds4,:e4,:fs4,:g4,:gs4,:a4,:gs4,:g4,:fs4,:f4,:bb4,:a4,:gs4]
#b16
nt.concat [:a4,:gs4,:g4,:fs4,:f4,:fs4,:g4,:gs4,:a4,:gs4,:g4,:fs4,:f4,:bb4,:a4,:gs4,:a4,:gs4,:g4,:fs4,:f4,:fs4,:g4,:gs4]
nt.concat [:a4,:gs4,:g4,:fs4,:g4,:fs4,:f4,:e4,:f4,:fs4,:g4,:gs4,:a4,:bb4,:a4,:gs4,:a4,:gs4,:g4,:fs4,:g4,:fs4,:f4,:e4,:f4,:fs4,:g4,:gs4,:a4,:bb4,:a4,:g4]
#b23
du = [sq]*8*22
nt.concat [:a4,:a4,:bb4,:bb4,:a4,:a4,:bb4,:r,:a4,:bb4,:a4,:a4,:a4,:a4,:a4,:r,:d5,:d5,:cs5,:cs5]
du.concat [cd,q,cd,q,c,c,cd,q,c,c,c,c,c,c,cd,q,cd,q,cd,q]
#b33
nt.concat [:d5,:d5,:cs5,:d5,:cs5,:d5,:d5,:d5,:d5,:d5,:r]
du.concat [c,c,m,c,c,cd,q,c,c,cd,q]
#nt2 starts after a gap
nt2=[:r,:f4,:a3,:a3,:a3,:a3,:a3,:a3,:a3,:bb3,:gs3,:bb3,:gs3,:bb3,:gs3,:bb3,:gs3,:a3,:a3,:a3,:a3,:a3,:a3,:a3,:a3]
nt2.concat [:bb3,:gs3,:bb3,:gs3,:bb3,:gs3,:bb3,:gs3,:a3,:bb3,:a3,:gs3,:a3,:bb3,:a3,:gs3,:a3,:bb3,:a3,:gs3,:a3,:bb3,:a3,:gs3]
#b29
nt2.concat [:a3,:bb3,:b3,:c4,:cs4,:c4,:b3,:bb3,:a3,:bb3,:b3,:c4,:cs4,:c4,:b3,:bb3,:d4,:d4,:d4,:d4,:d4,:d4,:d4,:d4,:eb4,:c4,:eb4,:c4,:eb4,:c4,:eb4,:c4]
du2 = [m*22]+[sq]*8*10
#b33
nt2.concat [:d4,:d4,:d4,:d4,:d4,:d4,:d4,:d4,:eb4,:c4,:eb4,:c4,:eb4,:c4,:eb4,:c4,:d4,:eb4,:d4,:cs4,:d4,:eb4,:d4,:cs4,:d4,:eb4,:d4,:cs4,:d4,:eb4,:d4,:cs4]
nt2.concat [:d4,:eb4,:e4,:f4,:fs4,:f4,:e4,:eb4,:d4,:eb4,:e4,:f4,:fs4,:f4,:e4,:eb4]
du2.concat [sq]*8*6 #end b38 then to 93
nt2.concat [:r]+[:a3,:gs3,:g3,:f3,:e3,:r,:e4,:d4,:c4,:b3,:a3,:r,:a3,:r,:a4,:r,:a3,:r]
du2.concat [m*55]+[q]*6+[c]+[q]*6+[c+m,q,q+c,q,q+c+m,c,c+m]
#b39
nt.concat [:d5,:cs5,:c5,:b4,:bb4,:eb5,:d5,:cs5,:d5,:cs5,:c5,:b4,:bb4,:c5,:cs5,:d5,:d5,:cs5,:c5,:b4,:c5,:b4,:bb4,:a4]
#b42
nt.concat [:bb4,:b4,:c5,:cs5,:c5,:cs5,:d5,:ds5,:e5,:ds5,:d5,:cs5,:d5,:cs5,:c5,:b4,:c5,:b4,:bb4,:a4,:gs4,:g4,:fs4,:f4]
#b45
nt.concat [:e4,:f4,:e4,:ds4,:e4,:f4,:e4,:ds4,:e4,:f4,:e4,:ds4,:e4,:f4,:e4,:ds4,:e4,:f4,:e4,:ds4,:e4,:f4,:e4,:ds4,:e4,:f4,:e4,:ds4,:e4,:f4,:e4,:ds4]
#b49
nt.concat [:e4,:ds4,:d4,:cs4,:d4,:cs4,:c4,:b3,:c4,:b3,:bb3,:a3,:r]
du.concat [sq]*8*11+[sq]*4 + [c]
#nt3 starts with large rest
nt3=[:r,:r,:gs3,:g3,:fs3,:f3,:e3,:f3,:e3,:ds3,:e3,:f3,:e3,:d3,:e3,:f3,:e3,:ds3,:e3,:f3,:e3,:ds3,:e3,:f3,:e3,:d3,:e3,:f3,:e3,:ds3,:e3,:f3,:e3,:ds3,:e3,:f3,:e3,:d3,:e3,:f3,:e3,:ds3,:e3,:f3,:e3,:ds3]
#b56
nt3.concat [:e3,:f3,:fs3,:g3,:gs3,:a3,:bb3,:b3,:c4,:cs4,:d4,:ds4,:e4,:f4,:fs4,:g4,:gs4,:a4,:bb4,:b4,:c5,:cs5,:d5,:ds5,:e5,:f5,:e5,:ds5,:e5,:f5,:e5,:d5] #end b59
du3=[m*49,c,sq,sq,sq,sq]+[sq]*8*9
#b60 to 94
nt3.concat [:r]+[:a3,:b3,:cs4,:d4,:e4,:r,:ds4,:e4,:ds4,:f5,:e5,:e5,:e5,:d5,:c5,:r,:c5,:r,:a5,:r,:e6,:r,:a5,:r,:a3,:r]
du3.concat [m*34]+[q]*6+[sq]*4+[q]*5+[q+c+m,q,q+c,q,q+c,q,q+c,c,c,q,q+c]
#b51
nt.concat [:r,:e6,:c6,:a5,:f5,:a5,:c6,:e6,:r,:e6,:c6,:a5,:f5,:a5,:c6,:e6,:r,:e5,:e5,:e5,:r]
du.concat [m+c,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,cd,c,c,m,m]
#b60
nt.concat [:e5,:ds5,:d5,:cs5,:c5,:f5,:e5,:ds5,:e5,:ds5,:d5,:cs5,:c5,:cs5,:d5,:ds5,:e5,:ds5,:d5,:cs5,:c5,:f5,:e5,:ds5]
#b63
nt.concat [:e5,:ds5,:d5,:cs5,:c5,:cs5,:d5,:ds5,:e5,:ds5,:d5,:cs5,:d5,:cs5,:c5,:b4,:c5,:cs5,:d5,:ds5,:e5,:f5,:e5,:ds5]
#b66
nt.concat [:e5,:ds5,:d5,:cs5,:d5,:cs5,:c5,:b4,:c5,:cs5,:d5,:ds5,:e5,:f5,:g5,:gs5,:a5,:gs5,:g5,:fs5,:f5,:bb5,:a5,:gs5]
#b69
nt.concat [:a5,:gs5,:g5,:fs5,:f5,:fs5,:g5,:gs5,:a5,:gs5,:g5,:fs5,:f5,:bb5,:a5,:gs5,:a5,:gs5,:g5,:fs5,:f5,:fs5,:g5,:gs5]
#b72
nt.concat [:a5,:gs5,:g5,:fs5,:g5,:fs5,:f5,:e5,:f5,:fs5,:g5,:gs5,:a5,:bb5,:a5,:g5,:a5,:gs5,:g5,:fs5,:f5,:fs5,:g5,:gs5]
#b75
nt.concat [:a5,:b5,:c6,:d6,:e6,:f6,:e6,:ds6,:e6,:ds6,:d6,:cs6,:c6,:f6,:e6,:ds6,:e6,:ds6,:d6,:cs6,:c6,:cs6,:d6,:ds6]
#b78
nt.concat [:e6,:ds6,:d6,:cs6,:c6,:f6,:e6,:ds6,:e6,:ds6,:d6,:cs6,:c6,:cs6,:d6,:ds6,:e6,:gs4,:a4,:bb4,:b4,:c5,:cs5]
du.concat [sq]*8*20 + [q,sq,sq,sq,sq,sq,sq]
#b81
nt.concat [:d5,:cs5,:c5,:b4,:c5,:b4,:bb4,:a4,:gs4,:a4,:as4,:b4,:c5,:cs5,:d5,:ds5,:e5,:f5,:e5,:ds5,:e5,:f5,:e5,:ds5]
#b84
nt.concat [:e5,:gs4,:a4,:bb4,:b4,:c5,:cs5,:d5,:cs5,:c5,:b4,:c5,:b4,:bb4,:a4,:gs4,:a4,:as4,:b4,:c5,:cs5,:d5,:ds5]
#b87
nt.concat [:e5,:fs5,:gs5,:a5,:b5,:c6,:d6,:ds6,:e6,:f6,:e6,:ds6,:e6,:fs6,:g6,:gs6,:a6,:gs6,:g6,:fs6,:g6,:fs6,:f6,:e6]
#b90
nt.concat [:f6,:e6,:ds6,:d6,:cs6,:c6,:b5,:bb5,:a5,:gs5,:g5,:fs5,:g5,:fs5,:f5,:e5,:f5,:e5,:ds5,:d5,:cs5,:c5,:b4,:bb4]
#b93
nt.concat [:a4,:bb4,:a4,:gs4,:a4,:bb4,:a4,:gs4,:a4,:bb4,:a4,:gs4,:a4,:b4,:c5,:d5,:e5,:f5,:e5,:ds5,:e5,:f5,:e5,:ds5]
#b96
nt.concat [:e5,:f5,:e5,:ds5,:e5,:fs5,:g5,:gs5,:a5,:r,:e4,:f4,:fs4,:g4,:gs4,:a4,:b4,:bs4,:c5,:cs5,:d5,:ds5]
#b99
nt.concat [:e5,:f5,:fs5,:g5,:gs5,:a5,:bb5,:b5,:c6,:cs6,:d6,:ds6,:e6,:fs6,:g6,:gs6,:a6,:r,:a5,:r,:a4,:r]
du.concat [sq]*8*3+[q,sq,sq,sq,sq,sq,sq]+[sq]*8*12+[q,q,sq,sq,sq,sq]+[sq]*8*3+[sq,sq+q+c,c,c,c,c]

#piano part chord array lists
#first section of chords
chlist=[[:e3,:gs5,:b5],[:e2,:d4,:b],[:a2,:e3,:c4],[:a2,:e3,:c4],[:d3,:fs3,:a3],[:a2,:e3,:c4]]
chlist.concat [[:a2,:e3,:c4],[:d3,:fs3,:a3],[:a2,:e3,:c4],[:f3,:a3,:d4],[:e3,:a3,:c4],[:d3,:gs3,:b3]]
chlist.concat [[:c3,:e3,:a3],[:f3,:a3,:d4],[:e3,:a3,:c4],[:d3,:gs3,:b3],[:cs3,:g3,:a3],[:d3,:f3,:a3]]
chlist.concat [[:f3,:a3,:d4],[:d3,:g3,:b3],[:d3,:a3,:d4],[:f3,:a3,:d3],[:d3,:g3,:b3]]
chlist.concat [[:f3,:a3,:d4],[:g3,:bb3,:d4],[:f3,:a3,:d3],[:e3,:g3,:cs4],[:d3,:f3,:d4],[:d3,:g3,:bb3]]
chlist.concat [[:d3,:f3,:a3],[:cs3,:e3,:g3]]
chdur=[q+c+m,q+c+3*m,q+c,q,q,q+c]+[q]*14+[q+c]+[q]*10
#bass note part
bn=[:d3,:r,:d3,:r,:f3,:fs3,:r,:bb3]
bd=[q,q+c+m,c,c+3*m,2*m,q,q+c+5*m,2*m]
#second section of chords
ch2list=[[:g3,:bb3,:d4],[:bb2,:d4,:g4],[:c3,:eb4,:g4],[:bb2,:d4,:g4],[:fs2,:c4,:eb4],[:g2,:bb3,:d4],[:f2,:a3,:d4],[:e2,:gs3,:d4]]
ch2dur=[q+c,q,q,q,q,q,q,q]
#second bass note part
bn2=[:e4,:e4,:e4,:r,:e4,:c4,:a3,:f3,:a3,:c4,:e4,:r,:e4,:c4,:a3,:f3,:a3,:c4,:e4,:r,:e5,:c5,:a4,:f4,:a4,:c5,:e5,:r]
bn2.concat [:e5,:c5,:a4,:f4,:a4,:c5,:e5,:r,:e4,:e4] #end b59
bd2=[c,m]+[q]*17+[q+c+2*m+c]+[q]*14+[m,m*2,c,c]
#third chord section lists
ch3list=[[:a3,:c4,:a4],[:a3,:c4,:a4],[:fs2,:d4,:a4],[:a3,:c4,:a4],[:a3,:c4,:a4],[:fs2,:d4,:a4],[:a3,:c4,:a4]]
#b64b
ch3list.concat [[:f3,:d4,:a4],[:e3,:c4,:a4],[:d3,:b3,:gs4],[:c3,:e4,:a4],[:f3,:d4,:a4],[:e3,:c4,:a4],[:d3,:b3,:fs4]]
#b68
ch3list.concat [[:cs3,:e4,:a4],[:d3,:f4,:a4],[:d3,:f4,:a4],[:b3,:d4,:g4],[:d3,:f4,:a4],[:d3,:f4,:a4],[:b3,:d4,:g4]]
ch3list.concat [[:d4,:f4,:a4],[:bb2,:d4,:g4],[:a3,:d4,:f4],[:g2,:cs4,:e4],[:f2,:d4,:a4],[:d3,:c4,:a4],[:c3,:e4,:a4],[:b2,:d4,:gs4]]
#b76
ch3list.concat [[:a2,:e4,:c5],[:c3,:e4,:c5],[:a2,:e4,:c5],[:fs2,:d4,:a4],[:a2,:e4,:c5],[:c3,:e4,:c5],[:a2,:e4,:c5],[:fs2,:d4,:a4]]#end b79
ch3list.concat [[:a2,:e4,:a4],[:f3,:a3,:d3],[:e3,:c4,:e4],[:e2,:gs3,:d4],[:a2,:e4,:a4],[:f3,:a3,:d4],[:e3,:c4,:a4],[:e3,:d4,:gs4],[:e3,:b3,:d3]]#end b88
ch3list.concat [[:a2,:c4,:e4],[:a2,:cs4,:g4],[:a2,:d4,:f4],[:a2,:e3,:c4],[:a2,:e3,:cs4],[:a2,:f3,:d4],[:a2,:e3,:c4]]#end b 93
ch3dur=[q+c,q,q,q+c]+[q]*14+[q+c]+[q]*10+[0,c,q,q,0,c,q,q] #end b79
ch3dur.concat [q+c]*9 #end 88
ch3dur.concat [q,q,q+c,q,q,q+c,q+c] #end b93
#from start then b80
nt4=[:r]+[:c5,:r,:a4,:f4,:d4,:b3,:d4,:f4,:a4,:r,:e4,:r,:c5,:r,:a4,:f4,:d4,:b3,:d4,:f4,:a4,:r] #then b 94 start
du4=[m*79]+[q]*8+[c,c,q,q+c]+[q]*8+[c,c+7*m] #next b94
nt4.concat [:r,:a4,:r,:e4,:r,:f4,:e4,:f4,:f5,:e5,:fs5,:gs5,:gs5,:a5,:r]#next b98
du4.concat [c]+[q]*4+[sq]*4+[q]*5+[q+c]
############ start playing here ##################
uncomment do #change to comment  to remove piano chords and base notes part
  in_thread do #piano part with chords and base note parts
    chp(chlist,chdur)
    plarrayp(bn,bd,sh,0.3)
    chp(ch2list,ch2dur)
    plarrayp(bn2,bd2,sh,0.3)
    chp(ch3list,ch3dur)
  end
end
uncomment do #change to comment to remove xylophone and piano 2-4
  in_thread do #xylophone part
    plarray(nt,du,sh,0.3)
  end
  in_thread do #piano second section
    plarrayp(nt2,du2,sh,0.3)
  end
  in_thread do #piano third section
    plarrayp(nt3,du3,sh,0.8)
  end
  plarrayp(nt4,du4,sh,0.3) #piano 4th section
end
