/****************************************************************************
*****************************************************************************
UDO DEFINITIONS IN csqt:
*****************************************************************************
CsQtArwKeys: kOut CsQtArwKeys kKey
CsQtMeter  : CsQtMeter S_chan_sig, S_chan_over, aSig, kTrig
*****************************************************************************
****************************************************************************/

/****************************************************************************
kOut CsQtArwKeys kKey
Returns -65 for up, -66 for down, -67 for right, -68 for left arrow key (linux)

Makes it possible to use the arrow keys, although they come into CsoundQt as sequence of three numbers.
It should be easy to modify the code for OSX and Windows. Requires CsoundQt 0.9.6
written by joachim heintz

kKey - ASCII keyboard number as output from sensekey opcode 
kOut - output (see above)
****************************************************************************/
/****************************************************************************
CsQtMeter S_chan_sig, S_chan_over, aSig, kTrig
Shows an audio signal in a CsoundQt controller widget

Shows an audio signal in a CsoundQt controller widget. For efficiency, chnset is used instead outvalue.
Because of this, the software channel names must be declared outside this UDO via chn_k to work properly.
written by joachim heintz

S_chan_sig - channel name for the controller widget showing the signal
S_chan_over - channel name for the controller widget showing the out of range signal
aSig - audio signal to show
kTrig - trigger signal for refreshing the display
****************************************************************************/

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

opcode CsQtMeter, 0, SSak
 S_chan_sig, S_chan_over, aSig, kTrig	xin
 iDbRange = 60 ;shows 60 dB
 iHoldTim = 1 ;seconds to "hold the red light"
 kOn init 0
 kTim init 0
 kStart init 0
 kEnd init 0
 kMax max_k aSig, kTrig, 1
 if kTrig == 1 then
  chnset (iDbRange + dbfsamp(kMax)) / iDbRange, S_chan_sig
  if kOn == 0 && kMax > 1 then
   kTim = 0
   kEnd = iHoldTim
   chnset k(1), S_chan_over
   kOn = 1
  endif
  if kOn == 1 && kTim > kEnd then
   chnset k(0), S_chan_over
   kOn =	0
  endif
 endif
 kTim += ksmps/sr
endop


