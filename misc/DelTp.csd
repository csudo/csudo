/****************************************************************************
aPitchShift DelTp aSnd, kPitch, kDelTim, iMaxDel
Delay line based pitch shift; optimized for very small latencies.

This is a version of the well-known strategy to use a variable delay line for
pitch shifting. It is based on the version by Victor Lazzarini in the Csound
Book (Springer 2017) in Listing 13.12 (online also here: 
https://github.com/csound/book/blob/master/part4/chapter13/13.12.orc).
The differences here are:
1. Use hamming window rather than triangle as cross envelopes.
2. Use only one phasor and get the second one from it.
The use of Hamming window seems to minimize the AM artifacts.
You may want to compare a sine as input (see below) with the 'transpose' object in Max.
Note that the kDelTim can be moved but needs to be fixed for a precise transposition interval.
written by joachim heintz

aSnd - audio input signal
kPitch - transposition as ratio (.5 = octave lower, 1.5 fifth higher etc)
kDelTim - delay time in seconds (very small values like 1/100 should be possible in many cases)
iMaxDel - maximum possible delay time (sec) (default = 1)
aPitchShift - transposed (pitch shifted) sound
****************************************************************************/

<CsoundSynthesizer>
<CsOptions>
-m128 --env:SSDIR+=../_sourcefiles //to find "fox.wav"
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1
seed 0

opcode DelTp,a,akkp
 aSnd, kPitch, kDelTim, iMaxDel xin
 iEnvTable = ftgen(0,0,4096,20,1,1)
 kPhasorFreq = -(kPitch-1) / kDelTim
 aPhasor_1 = phasor:a(kPhasorFreq)
 aPhasor_2 = (aPhasor_1+0.5) % 1
 aDelay_1 = vdelayx(aSnd,aPhasor_1*kDelTim,iMaxDel,4)
 aDelay_2 = vdelayx(aSnd,aPhasor_2*kDelTim,iMaxDel,4)
 aDelay_1 *= tablei:a(aPhasor_1,iEnvTable,1)
 aDelay_2 *= tablei:a(aPhasor_2,iEnvTable,1)
 xout aDelay_1+aDelay_2
endop

instr ProofOfConcept //smooth reproduction of input and short latency
  aSine = poscil:a(.2,400)
  aPitchShift = DelTp(aSine,linseg:k(1,1,1,4,1.5,1,1.5,4,1),0.01)
  out(aSine,aPitchShift)
endin

instr RealSound
 //sound file to mimic live input 
 aSnd diskin "fox.wav",1,0,1
 //randomly moving pitch shift
 kPitchShift1 = randomi:k(cent(-200),cent(200),1,3)
 kPitchShift2 = kPitchShift1 * 5/4
 //apply transposition (pitch shift)
 aPitchShift1 = DelTp(aSnd,kPitchShift1,.01)
 aPitchShift2 = DelTp(aSnd,kPitchShift2,.01)
 //output both to control sound and latency
 out(aPitchShift1,aPitchShift2)
endin

</CsInstruments>
<CsScore>
i "ProofOfConcept" 0 12
i "RealSound" 13 10
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
 <bgcolor mode="background">
  <r>240</r>
  <g>240</g>
  <b>240</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
