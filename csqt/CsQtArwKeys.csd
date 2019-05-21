/****************************************************************************
kOut CsQtArwKeys kKey
Returns -65 for up, -66 for down, -67 for right, -68 for left arrow key (linux)

Makes it possible to use the arrow keys, although they come into CsoundQt as sequence of three numbers.
It should be easy to modify the code for OSX and Windows. Requires CsoundQt 0.9.6
written by joachim heintz

kKey - ASCII keyboard number as output from sensekey opcode 
kOut - output (see above)
****************************************************************************/

<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 1

opcode CsQtArwKeys, k, k
 //
 kKey xin ;from sensekey opcode WITHOUT using kkeydown
 kKeys[] init 3
 kIndex init 0
 if changed:k(kKey)==1 && kKey!=-1 then  
  if kKey == 27 then
   kIndex = 0
  else 
   kIndex += 1
   kIndex = kIndex%3
  endif    	
  kKeys[kIndex] = kKey      	
  if kIndex == 2 && kKeys[0] == 27 && kKeys[1] == 91 then
   kOut = -kKey
  endif
 endif
 xout kOut
endop

instr 1
 kKey sensekey
 printk2 kKey, 10
 kArrow CsQtArwKeys kKey
 printk2 kArrow 
endin
schedule(1,0,100)


</CsInstruments>
<CsScore>
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>0</x>
 <y>0</y>
 <width>0</width>
 <height>0</height>
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
