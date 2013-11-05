<CsoundSynthesizer>
<CsOptions>
-ndm0
</CsOptions>
<CsInstruments>

  opcode Angrmk, S, SOV
Sin, kTrig, kLen  xin
if kTrig == 1 then
 if kLen == .5 then
kLen       strlenk    Sin
 endif
Sout       strcpyk    ""
Sincp      strcpyk    Sin
kCnt       =          0
kRange     =          kLen
loop:
kRnd       rnd31      kRange-.0001, 0
kRnd       =          int(abs(kRnd))
Sel        strsubk    Sincp, kRnd, kRnd+1
Sout       strcatk    Sout, Sel
Ssub1      strsubk    Sincp, 0, kRnd
Ssub2      strsubk    Sincp, kRnd+1, -1
Sincp      strcatk    Ssub1, Ssub2
kRange     =          kRange-1
;printf "kRnd = %d, %s\n", kCnt+1, Sout
           loop_lt    kCnt, 1, kLen, loop
endif
kPrint random 1, 10000
printf "%s\n", kPrint, Sout
           xout       Sout
  endop
  
  opcode test, S, S
Sin xin
kPrint init 1
kRnd random 40, 50
Snew sprintfk "%c", int(kRnd)
Sout strcatk Sin, Snew
printf "Inside UDO:%s\n", kPrint, Sout
kPrint = kPrint+1
xout Sout
  endop

  instr 1
;print a new version in the first 10 k-cycles
kCycles    timek
Sana       Angrmk     "abcdefghi", 1, 9
           ;puts       Sana, kCycles+1
           printf     "%s\n", kCycles+1, Sana
           printk2 kCycles
 if kCycles == 1 then
           turnoff
 endif
  endin
  
  instr 2
Sout test "a"
kCycles    timek
printf "  Outside UDO:%s\n", kCycles, Sout
 if kCycles == 5 then
           turnoff
 endif
  endin
</CsInstruments>
<CsScore>
i 2 0 1
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>100</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
