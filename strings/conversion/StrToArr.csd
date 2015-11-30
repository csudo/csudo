<CsoundSynthesizer>
<CsOptions>
-ndm0 
</CsOptions>
<CsInstruments>
ksmps = 32

/****************************************************************************
S_Arr[], iLen StrToArr S_in, S_sep
Transforms the sections of the input string S_in to elements of a string array. The sections in S_in are seperated by the seperator S_in. 

S_in - Input string.
S_sep - Seperator string.
S_Arr - Output string array.
iLen - Its length.
****************************************************************************/

opcode StrToArr, S[]i, SS

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
 S_Arr[] init iCnt
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
  S_Arr[iArrIndx] = S_ToArr  
 
 od
 
 xout S_Arr, iCnt

endop
  

instr One

 S_InStr = "/my/file/one.wav|/my/file/two.wav|/my/file/three.wav|/my/file/four.wav"
 S_sepa = "|"
 S_arr[], iLen StrToArr S_InStr, S_sepa
 printf_i "One:\n  Input string = '%s'\n  Seperator = '%s'\n", 1, S_InStr, S_sepa
 
 indx = 0
 while indx < iLen do
  printf_i "  S_arr[%d] = '%s'\n", 1, indx, S_arr[indx]
  indx += 1
 od
 
endin

instr Two

 S_InStr = "/my/file/one.wav /my/file/two.wav /my/file/three.wav /my/file/four.wav"
 S_sepa = " "
 S_arr[], iLen StrToArr S_InStr, S_sepa
 printf_i "Two:\n  Input string = '%s'\n  Seperator = '%s'\n", 1, S_InStr, S_sepa
 
 indx = 0
 while indx < iLen do
  printf_i "  S_arr[%d] = '%s'\n", indx+1, indx, S_arr[indx]
  indx += 1
 od

endin

instr Three

 S_InStr = "/my/file/one.wav /my/file/two.wav /my/file/three.wav /my/file/four.wav"
 S_sepa = "/"
 S_arr[], iLen StrToArr S_InStr, S_sepa
 printf_i "Three:\n  Input string = '%s'\n  Seperator = '%s'\n", 1, S_InStr, S_sepa
 
 indx = 0
 while indx < iLen do
  ;printf_i "  S_arr[%d] = '%s'\n", indx+1, indx, S_arr[indx]
  indx += 1
 od

endin

</CsInstruments>
<CsScore>
i "One" 0 0
i "Two" .1 0
i "Three" .2 0
</CsScore>
</CsoundSynthesizer>
Returns:
One:
  Input string = '/my/file/one.wav|/my/file/two.wav|/my/file/three.wav|/my/file/four.wav'
  Seperator = '|'
  S_arr[0] = '/my/file/one.wav'
  S_arr[1] = '/my/file/two.wav'
  S_arr[2] = '/my/file/three.wav'
  S_arr[3] = '/my/file/four.wav'
Two:
  Input string = '/my/file/one.wav /my/file/two.wav /my/file/three.wav /my/file/four.wav'
  Seperator = ' '
  S_arr[0] = '/my/file/one.wav'
  S_arr[1] = '/my/file/two.wav'
  S_arr[2] = '/my/file/three.wav'
  S_arr[3] = '/my/file/four.wav'
Three:
  Input string = '/my/file/one.wav /my/file/two.wav /my/file/three.wav /my/file/four.wav'
  Seperator = '/'
  S_arr[0] = ''
  S_arr[1] = 'my'
  S_arr[2] = 'file'
  S_arr[3] = 'one.wav '
  S_arr[4] = 'my'
  S_arr[5] = 'file'
  S_arr[6] = 'two.wav '
  S_arr[7] = 'my'
  S_arr[8] = 'file'
  S_arr[9] = 'three.wav '
  S_arr[10] = 'my'
  S_arr[11] = 'file'
  S_arr[12] = 'four.wav'

