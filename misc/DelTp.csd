/****************************************************************************
aPitchShift DelTp aSnd, kPitch, kDelTim, iMaxDel
Delay line based pitch shift; optimized for very small latencies.

This is a version of the well-known strategy to use a variable delay line for
pitch shifting. It is based on the version by Victor Lazzarini in the Csound
Book (Springer 2017) in Listing 13.12 (online also here: 
https://github.com/csound/book/blob/master/part4/chapter13/13.12.orc).
The differences here are:
1. Use half sine rather than triangle as cross envelopes.
2. Use only one phasor and get the second one from it.
3. Use a small and always changing delay line which aims to allow very small
   latencies (< 1/100 sec) by avoiding amplitude modulating artefacts as much
   as possible.
written by joachim heintz

aSnd - audio input signal
kPitch - transposition as ratio (.5 = octave lower, 1.5 fifth higher etc)
kDelTim - the moving delay time signal (see below for an example)
iMaxDel - maximum possible delay time (sec)
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
 iEnvTable = ftgen(0,0,4096,9,.5,1,0)
 kPhasorFreq = -(kPitch-1) / kDelTim
 aPhasor_1 = phasor:a(kPhasorFreq)
 aPhasor_2 = (aPhasor_1+0.5) % 1
 aDelay_1 = vdelayx(aSnd,aPhasor_1*kDelTim,iMaxDel,4)
 aDelay_2 = vdelayx(aSnd,aPhasor_2*kDelTim,iMaxDel,4)
 aDelay_1 *= tablei:a(aPhasor_1,iEnvTable,1)
 aDelay_2 *= tablei:a(aPhasor_2,iEnvTable,1)
 xout aDelay_1+aDelay_2
endop


instr PitchShift
 //sound file to mimic live input 
 aSnd diskin "fox.wav",1,0,1
 //uncomment the following line for sine test tone instead
 ;aSnd = poscil:a(.2,400)
 //randomly moving pitch shift
 kPitchShift = randomi:k(.5,1.5,1,3)
 //very short and always moving delay line
 kDelTim = randomi:k(.003,.01,10,3)
 //apply transposition (pitch shift)
 aPitchShift = DelTp(aSnd,kPitchShift,kDelTim)
 //output both to control sound and latency
 out(aSnd/3,aPitchShift)
endin

</CsInstruments>
<CsScore>
i "PitchShift" 0 5.5
</CsScore>
</CsoundSynthesizer>
