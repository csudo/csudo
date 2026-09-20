<CsoundSynthesizer>
<CsOptions>
-ndm0 
</CsOptions>
<CsInstruments>
ksmps = 32

/****************************************************************************
iArr[], iLen ArrStr2Num S_in, S_sep
Transforms the numbers of the input string S_in to a numerical array. The sections in S_in are seperated by the seperator S_in. 
written by joachim heintz

S_in - Input string.
S_sep - Seperator string.
iArr - Output array.
iLen - Its length.
****************************************************************************/

opcode ArrStr2Num, i[]i, SS

 S_in, S_sep xin 

 ;count the number of substrings
 iLenSep strlen S_sep
 iPos = 0
 iPosShift = 0
 iCnt = 0

 while iPos != -1 do
 
  iCnt += 1
  S_sub strsub S_in, iPosShift
  iPos strindex S_sub, S_sep
  iPosShift += iPos+iLenSep
  
 od
 
 ;create a string array and put the substrings in it
 iArr[] init iCnt
 iPos = 0
 iPosShift = 0
 iArrIndx = -1
 while iPos != -1 do
 
  iArrIndx += 1
  S_sub strsub S_in, iPosShift
  iPos strindex S_sub, S_sep
  iEnd = (iPos == -1 ? -1 : iPosShift+iPos)
  S_ToArr strsub S_in, iPosShift, iEnd
  iPosShift += iPos+iLenSep
  iArr[iArrIndx] = strtod(S_ToArr)  
 
 od
 
 xout iArr, iCnt

endop


  

instr One

 S_InStr = "1 0.75 0.125 0.125 0.5 1"
 S_sepa = " "
 iArr[], iLen ArrStr2Num S_InStr, S_sepa
 printarray(iArr)
  
endin



</CsInstruments>
<CsScore>
i "One" 0 1
</CsScore>
</CsoundSynthesizer>

returns:

 1.0000 0.7500 0.1250 0.1250 0.5000 1.0000 


