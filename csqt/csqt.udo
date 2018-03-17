/****************************************************************************
*****************************************************************************
UDO DEFINITIONS IN csqt:
*****************************************************************************
CsQtMeter  : CsQtMeter S_chan_sig, S_chan_over, aSig, kTrig
*****************************************************************************
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


