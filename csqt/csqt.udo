/****************************************************************************
*****************************************************************************
UDO DEFINITIONS IN csqt:
*****************************************************************************
CsQtArwKeys: kOut CsQtArwKeys kKey
CsQtMbrowse2Array: Sout[] CsQtMbrowse2Array Str
CsQtMeter  : CsQtMeter S_chan_sig, S_chan_over, aSig, kTrig
*****************************************************************************
****************************************************************************/

/****************************************************************************
kOut CsQtArwKeys kKey
Returns -65 for up, -66 for down, -67 for right, -68 for left arrow key (linux); otherwise 0.

Makes it possible to use the arrow keys, although they come into CsoundQt as sequence of three numbers.
It should be easy to modify the code for OSX and Windows. Requires CsoundQt 0.9.6
written by joachim heintz

kKey - ASCII keyboard number as output from sensekey opcode 
kOut - output (see above)
****************************************************************************/
/****************************************************************************
Sout[] CsQtMbrowse2Array Str
Converts a _MBrowse string of CsoundQt to an array of strings.

Converts a string in which file names are separated by '|' to 
an array of strings.
written by joachim heintz

Str - Input string as output of the _MBrowse channel in CsoundQt
Sout[] - Array with the file names
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
 kKey xin 
 kKeys[] init 3
 kIndex init 0
 kOut init 0
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
  else
   kOut = 0
  endif
 endif
 xout kOut
endop

  opcode StrMems, i, SS
Str, Sel   xin
iSumEls    =          0
iLen       strlen     Str
iIndx      =          0
Sub        strcpy     Str
  until iIndx == iLen do
iPos       strindex   Sub, Sel
   if iPos > -1 then
iSumEls    =          iSumEls+1
Sub        strsub     Sub, iPos+1
iIndx      =          iPos+1
   else
iIndx      =          iLen
   endif
  od
           xout       iSumEls
  endop

opcode CsQtMbrowse2Array,S[],S
  String xin
  // how many occurrences of | in String
  iNum = StrMems(String,"|")
  // create array for substrings
  Sout[] init iNum+1
  // go through
  istart = 0
  ipos = 0
  indx = 0
  while (ipos >= 0) do
    Substring = strsub(String,istart)
    ipos = strindex(Substring,"|")
    Sname = strsub(Substring,0,ipos)
    Sout[indx] = Sname
    istart += ipos+1
    indx += 1
  od
  xout Sout
endop

opcode CsQtMeter, 0, SSak
  S_chan_sig, S_chan_clip, aSig, kTrig	xin
  iDbRange = 60 ;shows 60 dB
  iHoldTim = 1 ;seconds to "hold the red light"
  kOn,kTim,kStart,kEnd init 0
  kMax = max_k(aSig,kTrig,1)
  if kTrig == 1 then
    chnset((iDbRange+dbfsamp(kMax)) / iDbRange, S_chan_sig)
    if (kOn == 0 && kMax > 1) then
      kTim = 0
      kEnd = iHoldTim
      kOn = 1
      chnset(kOn, S_chan_clip)
    endif
    if (kOn == 1 && kTim > kEnd) then
      kOn =	0
      chnset(kOn, S_chan_clip)
    endif
  endif
  kTim += ksmps/sr
endop


