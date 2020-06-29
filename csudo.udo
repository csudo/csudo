/****************************************************************************
*****************************************************************************
UDO DEFINITIONS IN csudo:
*****************************************************************************
ArrAddEl   : iOutArr[] ArrAddEl iInArr[], iEl [,iPos]
ArrAvrg    : iAvrg ArrAvrg iArr[] [,iStart [,iEnd]]
ArrCat     : iOutArr[] ArrCat iArr1[], iArr2[]
ArrElCnt   : iFound ArrElCnt iNeedle, iInArr[]
ArrElIn    : iRes ArrElIn iEl, iArr[]
ArrPermRnd : iOutArr[] ArrPermRnd iInArr[] [, iN]
ArrPermRnd2: iOutArr[] ArrPermRnd2 iInArr[] [, iStart [, iEnd]]
ArrPermRndIndx: iOutArr[] ArrPermRndIndx iInArr[] [, iN]
ArrPldrm   : iOutArr[] ArrPldrm iInArr[] [,iOpt]
ArrRmDup   : iOutArr[] ArrRmDup iInArr[]
ArrRmEl    : iOutArr[] ArrRmEl iInArr[], iEl
ArrRmIndx  : iOutArr[] ArrRmIndx iInArr[], iIndx
ArrRndEl   : iEl ArrRndEl iInArr[] [, iStart [, iEnd]]
ArrRtt     : iOutArr[] ArrRtt iInArr[] [,iRot]
ArrRvrs    : iOutArr[] ArrRvrs iInArr[]
ArrSrt     : kOutArr[] ArrSrt kInArr[] [,iOutN [,kOutType ,[kStart [,kEnd [,kHop]]]]]
BufCt1     : ift BufCt1 ilen [, inum]
BufCt2     : iftL, iftR BufCt2 ilen [, inumL [, inumR]]
BufFiCt1   : ift BufFiCt1 Sfilenam [, iftnum [, inorm]]
BufFiCt2   : iftL, iftR BufFiCt2 Sfilenam [, ifnL [, ifnR [, inorm]]]
BufFiCt4   : ift1, ift2, ift3, ift4 BufFiCt4 Sfilenam [, ifn1 [, ifn2 [, ifn3 [, ifn4 [, inorm]]]]]
BufFiCt8   : ift1, ift2, ift3, ift4, ift5, ift6, ift7, ift8 BufFiCt8 Sfilenam [, ifn1 [, ifn2 [, ifn3 [, ifn4 [, ifn5 [, ifn6 [, ifn7 [, ifn8 [, inorm]]]]]]]]]
BufFiCtNd1 : ift, ilen BufFiCtNd1 Sfilenam [, ichn [, iftnum [, inorm]]]
BufFiCtNd2 : iftL, iftR, ilen BufFiCtNd2 Sfilenam [, ichnL [, ichnR [, iftnumL [, iftnumR [, inorm]]]]]
BufFiPl1   : aout, kfin BufFiPl1 ifn, kplay, kspeed, kvol [, iskip [, iwrap]]
BufFiPl2   : aL, aR BufFiPl2 ifnL, ifnR, kplay, kspeed, kvol [, iskip [, iwrap]]
BufFiPl4   : a1, a2, a3, a4 BufFiPl4 ifn1, ifn2, ifn3, ifn4, kplay, kspeed, kvol [, iskip [, iwrap]]
BufFiPl8   : a1, a2, a3, a4, a5, a6, a7, a8 BufFiPl8 ifn1, ifn2, ifn3, ifn4, ifn5, ifn6, ifn7, ifn8, kplay, kspeed, kvol [, iskip [, iwrap]]
BufPlay1   : aout, kfin BufPlay1 ift, kplay, kspeed, kvol, kstart, kend, kwrap
BufPlay2   : aL, aR, kfin BufPlay2 iftL, iftR, kplay, kspeed, kvol, kstart, kend, kwrap
BufRec1    : kfin BufRec1 ain, ift, krec, kstart, kend, kwrap
BufRec2    : kfin BufRec2 ainL, ainR, iftL, iftR, krec, kstart, kend, kwrap
CsQtArwKeys: kOut CsQtArwKeys kKey
CsQtMeter  : CsQtMeter S_chan_sig, S_chan_over, aSig, kTrig
EvtLvLp    : EvtLvLp SPatternName, Schedule, SParameters, iTrackStates[][] [iMeter, iBPM]
EvtPtrnz   : kTrig, kOffTrig, kIndx EvtPtrnz kTime, kBPM, SPat
EvtS2P     : SAlways, State EvtS2P SPatName, SPar, SPattern, iTimeSignature, iBPM
ExtrOrc    : Sorc ExtrOrc Sfil
F2M        : iNotNum F2M iFreq [,iRound]
GrPtkSmpA  : aout GrPtkSmpA ifiltab, iskip, kspeed, kgrainamp, kgrainrate, kgrainsize, kcent, kposrand, kcentrand, icosintab, idisttab, iwin
GrPtkSmpB  : apartikkel GrPtkSmpB ifiltab, apnter, kgrainamp, kgrainrate, kgrainsize, kcent, kposrand, kcentrand, icosintab, idisttab, iwin
GrPtkWrp   : aWrp GrPtkWrp aPos, iFilTab [,kAmp [,kCent [,kPosRnd [,kGrainRate [,kGrainSize [,kDistribution]]]]]]
Linek      : kval, kfin Linek kthis, knext, ktim, ktrig
NmCntr     : kcount NmCntr kup, kdown [, kstep [, istart]]
NmFrcLen   : iFracs NmFrcLen iNum
NmRndInt   : iRnd NmRndInt iMin, iMax
NmScl      : iValOut NmScl iVal, iInMin, iInMax, iOutMin, iOutMax
NmStpInc   : iOut NmStpInc iValStart, iValEnd, iNumSteps, iThisStep
OnDtct     : kOnset, kDb OnDtct aIn [,kDbDiff [,kMinTim [,kMinDb [,iRmsFreq [,iDelComp]]]]]
PhsTmPnt   : atimpt PhsTmPnt kloopstart, kloopend, kspeed, kdir, irefdur
PrtArr1S   : PrtArr1S SArr [,istart [,iend]]
PrtArr1i   : PrtArr1 iArr [,istart [,iend [,iprec [,ippr]]]]]
PrtArr1k   : PrtArr1k kArr [,ktrig [,kstart [,kend [,kprec [,kppr]]]]]
PrtTb      : PrtTb ifn [,istart [,iend [,iprec [,ippr]]]]
PrtTbS     : PrtTbS ifn, String [,istart [,iend [,iprec [,ippr]]]]
PrtTbSk    : PrtTbSk ifn, String [,ktrig [,kstart [,kend [,kprec [,kppr]]]]]
PrtTbk     : PrtTbk ifn [,ktrig [,kstart [,kend [,kprec [,kppr]]]]]
Prt_a      : Prt_a aSig [,kPeriod [,kSpaces]]
SfPlay1    : aout SfPlay1 Sfil, kspeed [, iskip [, iloop]]
SfPlay2    : aL, aR SfPlay2 Sfil, kspeed [, iskip [, iloop]]
StrAgrm    : Sout StrAgrm Sin [,iLen]
StrAgrmk   : Sout StrAgrm Sin [,iLen]
StrDir     : Sdir StrDir Spath
StrDirUp   : SUpDir StrDirUp SCurDir
StrExpr    : iNum StrExpr Str [, iStrt [, iEnd]]
StrExpr1   : iNum StrExpr1 Str, iStrt, iEnd
StrExpr2   : iNum StrExpr2 iNum1, iNum2, iOp
StrFiln    : Snam StrFiln Spath [,iRm]
StrIsEmpty : iTrue StrIsEmpty Str, iStrt, iEnd
StrIsOp    : iOp StrIsOp Str, iPos
StrLNoth   : iTrue StrLNoth Str, iMin, iPos
StrL_NvO   : iTrue StrL_NvO Str, iMin, iPos
StrL_Prth  : iPrPos StrL_Prth Str, iMin, iPos
StrLineBreak: Sres StrLineBreak String, iNum
StrMems    : iSumEls StrMems Str, Sel
StrNumP    : itest StrNumP String
StrNxtOpL  : iOpPos, iOp StrNxtOpL Str, iMinPos, iPos
StrRmvST   : Sout StrRmvST Sin, iStrt, iEnd
StrSuf     : Suf StrSuf Spath [,ilow]
StrSum     : iSum StrSum Sin
StrToArr   : S_Arr[], iLen StrToArr S_in, S_sep
StrToAscS  : Sout StrToAscS Sin
StrTrmPos  : iStrtOut, iEndOut StrTrmPos Str, iStrtIn, iEndIn
StrayElCnt : ilen StrayElCnt Stray [, iElOpn] [, iElCls] [, iSep1] [, iSep2]
StrayElMem : ipos StrayElMem Stray, Stest [, isep1 [, isep2]]
StrayGetEl : Sel StrayGetEl Stray, ielindx [, isep1 [, isep2]]
StrayGetNum: inum StrayGetNum Stray, ielindx [, isep1 [, isep2]]
StrayLen   : ilen StrayLen Stray [, isep1 [, isep2]]
StrayNumLen: ilen StrayNumLen Stray [, isep1 [, isep2]]
StrayNumMem: itest StrayNumMem Stray, inum [, isep1 [, isep2]]
StrayNumSum: isum StrayNumSum Stray [, isep1 [, isep2]]]
StrayNumToFt: ift, iftlen StrayNumToFt Stray [, iftno [, isep1 [, isep2]]]
StrayRemDup: Srem StrayRemDup Stray [, isep1 [, isep2]]
StrayRev   : Srev StrayRev Stray [,isepA [, isepB [, isepOut]]]
StrayRndEl : Sel StrayRndEl Stray [, isep1 [, isep2]]
StraySetEl : Sres StraySetEl Stray, Sin [, ielindx [, isep1 [, isep2 [,isepOut]]]]
StraySetNum: Sres StraySetNum Stray, inum [, ielindx [, isep1 [, isep2 [,isepOut]]]]
StraySub   : Sub StraySub Stray [, istart [, iend [, isepA [, isepB [, isepOut]]]]]
StripL     : Sout StripL Sin
TbMem      : ipos TbMem ival, ift [, indxstrt [, indxend]]
TbPeak     : iPeak TbPeak ift [, indxstrt [, indxend]]
TbPrmRnd   : TbPrmRnd ift
TbPrmRndk  : TbPrmRndk ift, ktrig
TbRmDp     : iend TbRmDp iftsrc, iftdst [, ioffset [, inumels]]
TbScala    : ifno TbScala Sfil [, ibasefreq [, ibasekey [, ifn]]] 
TbSinc     : iFt TbSinc iStart, iEnd [,iSize [,iFtNo]]
TbToLin    : kLin TbToLin iFt
TbToSF     : TbToSF ift, Soutname, ktrig [,iformat [,istart [,iend]]]
array_udo_examples: ArrAddEl   : iOutArr[] ArrAddEl iInArr[], iEl [,iPos]
*****************************************************************************
****************************************************************************/

/****************************************************************************
iOutArr[] ArrAddEl iInArr[], iEl [,iPos]
kOutArr[] ArrAddEl kInArr[], kEl [,kPos]
Adds an element to an array and returns the result as new array.
written by joachim heintz

i(k)InArr[] - input array (one dimension)
i(k)El - element to be added
i(k)Pos - index at which the element is to be added (default -1: end of array)
i(k)OutArr[] - output array 
****************************************************************************/
/****************************************************************************
iAvrg ArrAvrg iArr[] [,iStart [,iEnd]]
kAvrg ArrAvrg kArr[] [,iStart [,iEnd]]
Calutates the average of the values in an array, 
or optional a slice of an array.
written by joachim heintz

i(k)Arr[] - input array
iStart - first position to read (default=0)
iEnd - last position to read (excluded) (default=-1 means the last element)
i(k)Avrg - average of all values in iArr
****************************************************************************/
/****************************************************************************
iOutArr[] ArrCat iArr1[], iArr2[]
kOutArr[] ArrCat kArr1[], kArr2[]
Concatenates two arrays and returns the result as new array.
written by joachim heintz

i(k)Arr1[], i(k)Arr2[] - input arrays (one dimension)
i(k)OutArr[] - output array 
****************************************************************************/
/****************************************************************************
iFound ArrElCnt iNeedle, iInArr[]
kFound ArrElCnt kNeedle, iInArr[]
kFound ArrElCnt kNeedle, kInArr[]
Returns a count of instances of an element in an array
written by kevin welch

i(k)Needle - numeric value to search for
i(k)InArr[] - input array to search through
i(k)Found - count of instances found
****************************************************************************/
/****************************************************************************
iRes ArrElIn iEl, iArr[]
kRes ArrElIn kEl, kArr[]
Looks whether i(k)El is in i(k)Arr or not. Returns 1 if element is found, otherwise 0.
written by joachim heintz

i(k)El - element to test
i(k)Arr[] - array in which to look for i(k)El
i(k)Res - 1 for yes, 0 for no
****************************************************************************/
/****************************************************************************
iOutArr[] ArrPermRnd iInArr[] [, iN]
kOutArr[] ArrPermRnd kInArr[] [, iN]
SoutArr[] ArrPermRnd SInArr[] [, iN]
Returns an array of i/k/S N length which contains randomly permuted elements of i/k/S InArr[]. 
As the random opcode is used, make sure to have set the global seed to zero to get always changing results.
written by joachim heintz

i/k/SInArr[] - input array
iN - desired length of the output array (must not be longer than i/k/SInArr), default = -1 which means that the whole length of the input array is taken
i/k/sOutArr[] - output array with iN randomly permuted elements of i/k/SInArr
****************************************************************************/
/****************************************************************************
iOutArr[] ArrPermRnd2 iInArr[] [, iStart [, iEnd]]
kOutArr[] ArrPermRnd2 kInArr[] [, kStart [, kEnd]]
Permutes randomly the elements of i(k)InArr[], from Start to End index (included).
As the random opcode is used, make sure to have set the global seed to zero to get always changing results.
written by joachim heintz

i(k)InArr[] - input array
i(k)Start - first index to change (default = 0)
i(k)End - last index to change (default = -1: whole array)
i(k)OutArr[] - output array with iN randomly permuted elements of iInArr
****************************************************************************/
/****************************************************************************
iOutArr[] ArrPermRndIndx iInArr[] [, iN]
kOutArr[] ArrPermRndIndx kInArr[] [, iN]
Returns an array of kN length which contains randomly permuted indices of kInArr[]. 
As the random opcode is used, make sure to have set the global seed to zero to get always changing results.
This UDO is similar to ArrPermRnd but returns indices instead of values.
written by joachim heintz

i(k)InArr[] - input array
iN - desired length of the output array (must not be longer than i(k)InArr), default = -1 which means that the whole length of the input array is taken
i(k)OutArr[] - output array with kN randomly permuted indices of kInArr
****************************************************************************/
/****************************************************************************
iOutArr[] ArrPldrm iInArr[] [,iOpt]
kOutArr[] ArrPldrm kInArr[] [,iOpt]
Creates a palindrome of the input array, 
with some options.
written by joachim heintz

i(k)InArr[] - input array
iOpt - if 0 (default), the reverse of the array is appended except the last element
       if 1, the reverse is appended except the last and the first element
       if 2, the reverse is appended with both, the last and first element
i(k)OutArry[] - output array
****************************************************************************/
/****************************************************************************
iOutArr[] ArrRmDup iInArr[]
kOutArr[] ArrRmDup kInArr[]
Removes duplicates from an array and returns the result as new array.
Requires the UDO ArrElIn.
written by joachim heintz

i(k)InArr[] - input array (one dimension)
i(k)OutArr[] - output array 
****************************************************************************/
/****************************************************************************
iOutArr[] ArrRmEl iInArr[], iEl
kOutArr[] ArrRmEl kInArr[], kEl
Removes an element from an array and returns the result as new array.
written by joachim heintz

i(k)InArr[] - input array (one dimension)
i(k)El - element to be removed
i(k)OutArr[] - output array 
****************************************************************************/
/****************************************************************************
iOutArr[] ArrRmIndx iInArr[], iIndx
kOutArr[] ArrRmIndx kInArr[], kIndx
Removes the element with the index i(k)Indx from i(k)InArr and returns the result as new array.
written by joachim heintz

i(k)InArr[] - input array
i(k)Indx - index to be removed from i(k)InArr
i(k)OutArr[] - output array as copy of i(k)InArr without i(k)Indx
****************************************************************************/
/****************************************************************************
iEl ArrRndEl iInArr[] [, iStart [, iEnd]]
kEl ArrRndEl kInArr[] [, kStart [, kEnd]]
SEl ArrRndEl SInArr[] [, iStart [, iEnd]]
Returns a random element of an array, or of a part of the array.
As the random opcode is used, make sure to have set the global seed to zero to get always changing results.
written by joachim heintz

i(kS)InArr[] - input array
i(k)Start - first index in i(kS)InArr to use (default = 0)
iEnd - last index in i(S)InArr to use (default = -1: whole length)
kEnd - last index in kInArr to use (default = 0.5: whole length)
i(kS)El - random element of array
****************************************************************************/
/****************************************************************************
iOutArr[] ArrRtt iInArr[] [,iRot]
kOutArr[] ArrRtt kInArr[] [,kRot]
Rotates an array for N positions (positive = right, negative = left)
and returns the result as new array.
written by joachim heintz

i(k)InArr[] - input array
iRot - positions to rotate right or left (default=1)
i(k)OutArr[] - output array
****************************************************************************/
/****************************************************************************
iOutArr[] ArrRvrs iInArr[]
kOutArr[] ArrRvrs kInArr[]
Returns the reverse of an array.
written by joachim heintz

i(k)InArr[] - input array
i(k)OutArr[] - output array
****************************************************************************/
/****************************************************************************
kOutArr[] ArrSrt kInArr[] [,iOutN [,kOutType ,[kStart [,kEnd [,kHop]]]]]
Sorts the content of kInArr[] in descending order and returns the sorted array 
as kOutArr[] of length iOutN.
Depending on kOutType, the output array can either contain the values, or the
indices of the values (thus pointing to kInArr). A section of kInArr can be
specified by kStart and kEnd. Instead of sorting every element, looking only
for the even or odd elements can be done via the kHop parameter.
For simple sorting (ascending or descending), use the Csound opcodes sorta and sortd.
written by joachim heintz

kInArr[] - array to sort
iOutN - length of the output array kOutArr (default = -1 means the whole length)
kOutType - 0 (default) = output as sorted values, 1 = output as indices
kStart - start from this element (inclusive) (default = 0)
kEnd - end at this element (exclusive) (default = 0 means length of array)
kHop - distance from element to element you are regarding (default = 1)
kOutArr[] - sorted array
****************************************************************************/
/****************************************************************************
ift BufCt1 ilen [, inum]
creates a function table of ilen seconds for recording

creates an "empty" function table (filled with zeros) of ilen seconds, using GEN02, for recording sound
written by joachim heintz

ilen - length in seconds
inum - if zero (which is also the default), the number of the function table is given by Csound. Any other positive integer will represent the function table, but the user must take care of not using a number twice
ift - table number as output
****************************************************************************/
/****************************************************************************
iftL, iftR BufCt2 ilen [, inumL [, inumR]]
creates two function tables of ilen seconds for recording

creates two "empty" function tables (filled with zeros) of ilen seconds, using GEN02, for recording stereo sound input
written by joachim heintz

ilen - length in seconds
inumL, inumR - if zero (which is also the default), the number of the function table is given by Csound. Any other positive integer will represent the function table, but the user must take care of not using a number twice
iftL, iftR - table numbers as output
****************************************************************************/
/****************************************************************************
ift BufFiCt1 Sfilenam [, iftnum [, inorm]]
creates a gen01 function table from a mono soundfile 

Creates a gen01 function table from a mono soundfile. This is nothing else than a simplification of creating the same with a ftgen statement.
Use BufFiCtNd to create a non-deferred function table from a soundfile 
written by joachim heintz

Sfilenam - file name or path as string
iftnum - if zero (which is also the default), the number of the function table is given by Csound. Any other positive integer will represent the function table, but the user must take care of not using a number twice
inorm - if zero, the table is not normalized. This is also the default, while any other number creates a normalized table
ift - output table number
****************************************************************************/
/****************************************************************************
iftL, iftR BufFiCt2 Sfilenam [, ifnL [, ifnR [, inorm]]]
creates two gen01 function table from a stereo soundfile

Creates two gen01 function table from a stereo soundfile. This is nothing else than a simplification of creating the same with a ftgen statement.
Use BufFiCtNd to create a non-deferred function table from a soundfile 
written by joachim heintz

Sfilenam - file name or path as string
ifnL, ifnR - if zero (which is also the default), the number of the function table is given by Csound. Any other positive integer will represent the function table, but the user must take care of not using a number twice
inorm - if zero, the table is not normalized. This is also the default, while any other number creates a normalized table
iftL, iftR - output table numbers for left and right channel
****************************************************************************/
/****************************************************************************
ift1, ift2, ift3, ift4 BufFiCt4 Sfilenam [, ifn1 [, ifn2 [, ifn3 [, ifn4 [, inorm]]]]]
creates fout gen01 function table from a four channel soundfile

Creates four gen01 function table from a four channel soundfile. This is nothing else than a simplification of creating the same with a ftgen statement.
Use BufFiCtNd to create a non-deferred function table from a soundfile 
written by joachim heintz

Sfilenam - file name or path as string
ifn1 ... ifn4 - if zero (which is also the default), the number of the function table is given by Csound. Any other positive integer will represent the function table, but the user must take care of not using a number twice
inorm - if zero, the table is not normalized. This is also the default, while any other number creates a normalized table
ift1 ... ift4 - output table numbers
****************************************************************************/
/****************************************************************************
ift1, ift2, ift3, ift4, ift5, ift6, ift7, ift8 BufFiCt8 Sfilenam [, ifn1 [, ifn2 [, ifn3 [, ifn4 [, ifn5 [, ifn6 [, ifn7 [, ifn8 [, inorm]]]]]]]]]
creates eight gen01 function table from an eight channel soundfile

Creates eight gen01 function table from an eight channel soundfile. This is nothing else than a simplification of creating the same with a ftgen statement.
Use BufFiCtNd to create a non-deferred function table from a soundfile 
written by joachim heintz

Sfilenam - file name or path as string
ifn1 ... ifn8 - if zero (which is also the default), the number of the function table is given by Csound. Any other positive integer will represent the function table, but the user must take care of not using a number twice
inorm - if zero, the table is not normalized. This is also the default, while any other number creates a normalized table
ift1 ... ift8 - output table numbers
****************************************************************************/
/****************************************************************************
ift, ilen BufFiCtNd1 Sfilenam [, ichn [, iftnum [, inorm]]]
creates a non deferred function table from a mono soundfile and returns its length

Creates a non deferred function table from a mono soundfile and returns its length. This can be useful is you want to use opcodes (for instance table3) which do not work with deferred size function tables
written by joachim heintz

Sfilenam - file name or path as string
ichn - channel in Sfilenam to read (default=1)
iftnum - if zero (which is also the default), the number of the function table is given by Csound. Any other positive integer will represent the function table, but the user must take care of not using a number twice
inorm - if zero, the table is not normalized. This is also the default, while any other number creates a normalized table
ift - output table number
ilen - length of the function table created (which is also the length of the soundfile in samples)
****************************************************************************/
/****************************************************************************
iftL, iftR, ilen BufFiCtNd2 Sfilenam [, ichnL [, ichnR [, iftnumL [, iftnumR [, inorm]]]]]
creates two non deferred function tables from a stereo soundfile and returns the length

Creates two non deferred function tables from a stereo (or any multichannel) soundfile and returns the length as table size (= sample frames). This can be useful is you want to use opcodes (for instance table3) which do not work with deferred size function tables
written by joachim heintz

Sfilenam - file name or path as string
ichnL, ichnR - channels in Sfilenam to read (default = 1 for ichnL and 2 for ichnR)
iftnumL, iftnumR - if zero (which is also the default), the number of the function table is given by Csound. Any other positive integer will represent the function table, but the user must take care of not using a number twice
inorm - if zero, the table is not normalized. This is also the default, while any other number creates a normalized table
iftL, iftR - output table number
ilen - length of the function table created (which is also the length of the soundfile in samples)
****************************************************************************/
/****************************************************************************
aout, kfin BufFiPl1 ifn, kplay, kspeed, kvol [, iskip [, iwrap]]
Plays a mono sample from a GEN01 function table, including sample rate conversion

Plays a mono sample from a GEN01 function table, including sample rate conversion. The input parameters are similar to diskin (speed, loop play or play once, skiptime) plus a factor for amplitude scaling.
See the UDO BufPlay for playing any buffer, with some more options, but without sample rate conversion.
written by joachim heintz

ifn - number of the function table which contains the sample (please use GEN01 - any other GEN routine will lead to an error because it does not contain the sample rate of the soundfile)
(you can also use BufFiCt1 for creating the table - see the example below)
iskip - skiptime (sec)
iwrap - iwrap=0 plays the file just once (stops at end of table for positive speed and at start of table for negative speed), or stops if the direction of speed changes. the default is 1 (loop play) 
kplay - 1 plays the table, 0 or any other number stops playing
kspeed - speed and direction (negative = backwards) of the pointer through the sample, e.g. 1 = normal, 2 = double (=octave higher), -0.5 = half (octave lower) and backwards
kvol - ampltude scaling factor (1 = original amplitude)
aout - audio output
kfin - 1 if iwrap=0 and playback has finished, otherwise 0
****************************************************************************/
/****************************************************************************
aL, aR BufFiPl2 ifnL, ifnR, kplay, kspeed, kvol [, iskip [, iwrap]]
Plays a stereo sample from two GEN01 function tables, including sample rate conversion

Plays a stereo sample from two GEN01 function tables for the left and right channel, including sample rate conversion. The input parameters are similar to diskin (speed, loop play or play once, skiptime) plus a factor for amplitude scaling.
See the UDO BufPlay for playing any buffer, with some more options, but without sample rate conversion.
written by joachim heintz

ifnL - number of the function table which contains channel 1 of the sample (use GEN01 with 1 for the channel parameter - any other GEN routine will lead to an error because it does not contain the sample rate of the soundfile)
(you can also use BufFiCt2 for creating the tables for left and right channel - see the example below)
ifnR - number of the function table which contains channel 2 of the sample (use the same f-statement as for ifnL but with 2 for the channel parameter)
iskip - skiptime (sec)
iwrap - iwrap=0 plays the file is just once (stops at end of table for positive speed and at start of table for negative speed), or stops if the direction of speed changes.the default is 1 (loop play) 
kplay - 1 plays the table, 0 or any other number stops playing
kspeed - speed and direction (negative = backwards) of the pointer through the sample, e.g. 1 = normal, 2 = double (=octave higher), -0.5 = half (octave lower) and backwards
kvol - ampltude scaling factor (1 = original amplitude)
aL - audio output channel 1
aR - audio output channel 2
kfin - 1 if iwrap=0 and playback has finished, otherwise 0
****************************************************************************/
/****************************************************************************
a1, a2, a3, a4 BufFiPl4 ifn1, ifn2, ifn3, ifn4, kplay, kspeed, kvol [, iskip [, iwrap]]
Plays a four channel sample from four GEN01 function tables, including sample rate conversion

Plays a four channel sample from four GEN01 function tables, including sample rate conversion. The input parameters are similar to diskin (speed, loop play or play once, skiptime) plus a factor for amplitude scaling.
See the UDO BufPlay for playing any buffer, with some more options, but without sample rate conversion.
written by joachim heintz

ifn1 - number of the function table which contains channel 1 of the sample (use GEN01 with 1 for the channel parameter - any other GEN routine will lead to an error because it does not contain the sample rate of the soundfile)
(you can also use BufFiCt4 for creating the tables for all channels - see the example below)
ifn2 - number of the function table which contains channel 2 of the sample (use the same f-statement as for ifnL but with 2 for the channel parameter)
ifn3 - number of the function table for the 3. channel
ifn4 - number of the function table for the 4. channel
iskip - skiptime (sec)
iwrap - iwrap=0 plays the file is just once (stops at end of table for positive speed and at start of table for negative speed), or stops if the direction of speed changes. the default is 1 (loop play)
kplay - 1 plays the table, 0 or any other number stops playing
kspeed - speed and direction (negative = backwards) of the pointer through the sample, e.g. 1 = normal, 2 = double (=octave higher), -0.5 = half (octave lower) and backwards
kvol - ampltude scaling factor (1 = original amplitude)
a1 - audio output channel 1
a2 - audio output channel 2
a3 - audio output channel 3
a4 - audio output channel 4
kfin - 1 if iwrap=0 and playback has finished, otherwise 0 
****************************************************************************/
/****************************************************************************
a1, a2, a3, a4, a5, a6, a7, a8 BufFiPl8 ifn1, ifn2, ifn3, ifn4, ifn5, ifn6, ifn7, ifn8, kplay, kspeed, kvol [, iskip [, iwrap]]
Plays an eight channel sample from eight GEN01 function tables, including sample rate conversion

Plays an eight channel sample from eight GEN01 function tables, including sample rate conversion. The input parameters are similar to diskin (speed, loop play or play once, skiptime) plus a factor for amplitude scaling.
See the UDO BufPlay for playing any buffer, with some more options, but without sample rate conversion.
written by joachim heintz

ifn1 - number of the function table which contains channel 1 of the sample (use GEN01 with 1 for the channel parameter - any other GEN routine will lead to an error because it does not contain the sample rate of the soundfile)
(you can also use BufFiCt8 for creating the tables for all channels - see the example below)
ifn2 - number of the function table which contains channel 2 of the sample (use the same f-statement as for ifnL but with 2 for the channel parameter)
ifn3 - number of the function table for the 3. channel
ifn4 - number of the function table for the 4. channel
ifn5 - number of the function table for the 5. channel
ifn6 - number of the function table for the 6. channel
ifn7 - number of the function table for the 7. channel
ifn8 - number of the function table for the 8. channel
iskip - skiptime (sec)
iwrap - iwrap=0 plays the file is just once (stops at end of table for positive speed and at start of table for negative speed), or stops if the direction of speed changes. the default is 1 (loop play)
kplay - 1 plays the table, 0 or any other number stops playing
kspeed - speed and direction (negative = backwards) of the pointer through the sample, e.g. 1 = normal, 2 = double (=octave higher), -0.5 = half (octave lower) and backwards
kvol - ampltude scaling factor (1 = original amplitude)
a1 - audio output channel 1
a2 - audio output channel 2
a3 - audio output channel 3
a4 - audio output channel 4
a5 - audio output channel 5
a6 - audio output channel 6
a7 - audio output channel 7
a8 - audio output channel 8
kfin - 1 if iwrap=0 and playback has finished, otherwise 0  
****************************************************************************/
/****************************************************************************
aout, kfin BufPlay1 ift, kplay, kspeed, kvol, kstart, kend, kwrap
Plays audio from a mono buffer (function table), with different options

Plays audio from a mono buffer (function table), with control over speed (forward - backward), volume, start point, end point, and different options of wrapping/looping. All parameters can be modified during performance.
See the UDO BufFiPl if you want to play back a soundfile which has been loaded into a buffer. BufFiPl performs also sample rate conversion
written by joachim heintz

ift - function table to play. This can be a non-power-of-two function table (given by a negative size, see example), but no deferred size GEN01 table.
kplay - 1 for playing, 0 (or any other number) stops playing
kspeed - 1 for playing back in the same speed as the buffer has been recorded, 2 for double speed etc., negative numbers for backwards
kvol - volume as multiplier (1=normal)
kstart - begin of playing the buffer in seconds
kend - end of playing in seconds. Zero means the end of the table
kwrap -
kwrap = 0: no wrapping. Stops at kend (positive speed) or kstart (negative speed). This makes just sense if the direction does not change and you just want to play the table once
kwrap = 1: wraps between kstart and kend
kwrap = 2: wraps between 0 and kend
kwrap = 3: wraps between kstart and end of table
aout - audio output signal
kfin - 1 if playing has ended (wrap=0), otherwise 0  
****************************************************************************/
/****************************************************************************
aL, aR, kfin BufPlay2 iftL, iftR, kplay, kspeed, kvol, kstart, kend, kwrap
Plays audio from a stereo buffer (two function tables), with different options

Plays audio from a stereo buffer (two function tables), with control over speed (forward - backward), volume, start point, end point, and different options of wrapping/looping. All parameters can be modified during performance.
See the UDO BufFiPl if you want to play back a soundfile which has been loaded into a buffer. BufFiPl performs also sample rate conversion

iftL, iftR - function tables to play. It is possible to use non-power-of-two function tables (given by a negative size, see example), but no deferred size GEN01 table.
written by joachim heintz

kplay - 1 for playing, 0 (or any other number) stops playing
kspeed - 1 for playing back in the same speed as the buffer has been recorded, 2 for double speed etc., negative numbers for backwards
kvol - volume as multiplier (1=normal)
kstart - begin of playing the buffer in seconds
kend - end of playing in seconds. Zero means the end of the table
kwrap -
kwrap = 0: no wrapping. Stops at kend (positive speed) or kstart (negative speed). This makes just sense if the direction does not change and you just want to play the table once
kwrap = 1: wraps between kstart and kend
kwrap = 2: wraps between 0 and kend
kwrap = 3: wraps between kstart and end of table
aL, aR - audio output signal
kfin - 1 if playing has ended (wrap=0), otherwise 0  
****************************************************************************/
/****************************************************************************
kfin BufRec1 ain, ift, krec, kstart, kend, kwrap
Records in a mono buffer (function table)

Records in a mono buffer (function table), with optional start point, end point, and wrap (= loop record).
The example below has different tests for ensuring that BufRec works as expected. See the example for the UDO BufCt for another example with live recording.
written by joachim heintz

ift - function table for recording
ain - audio signal to record
krec - 1 for recording, 0 (or any other number) stops recording
kstart - begin of recording into the function table in seconds
kend - end of recording into the function table in seconds
kwrap - if 1, recording wraps between kend and the beginning of the buffer (see th examples below for instr 4); if 0 (or any other number), record stops at kend
kfin - 1 if record has finished
****************************************************************************/
/****************************************************************************
kfin BufRec2 ainL, ainR, iftL, iftR, krec, kstart, kend, kwrap
Records in a stereo buffer (= two function tables)

Records in a stereo buffer (two function tables), with optional start point, end point, and wrap (= loop record). 
written by joachim heintz

iftL, iftR - function tables for recording
ainL, ainR - audio signals to record
krec - 1 for recording, 0 (or any other number) stops recording
kstart - begin of recording into the function table in seconds
kend - end of recording into the function table in seconds
kwrap - if 1, recording wraps between kend and the beginning of the buffer (see th examples below for instr 4); if 0 (or any other number), record stops at kend
kfin - 1 if record has finished
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
/**********
EvtLvLp SPatternName, Schedule, SParameters, iTrackStates[][] [iMeter, iBPM]
A sequencer that emits events for live evaluation.
Requires the UDOs EvtPtrnz, StrayLen, StrNumP, StrayElCnt, StrSum
written by Hlödver Sigurdsson

SPatternName - A unique name for pattern, after pattern is assigned to instrument, 
  it can't be reassigned to another instrument.
Schedule - Empty string means the pattern is turned-off. Event calculation starts
  at 0 and ends at but not including the value of iMeter. If equal or larger than the value
  of iMeter, then a new bar is calculated. Since this is based on indexed array, the value
  must be written linearly (example "0 1 2 3"). In case iMeter = 0, then the pattern length
  is equal to the next integer of last (and the greatest) value.
SParameters - Is a string that operates on the p-fields for the events, there is
  to say, all the p-fields except p2. For this UDO to work, the instrument must be defined
  as name but not a number. For each parameter (not including p1 and p2) the numbers can be stored
  inside square brackets, which for each event will iterate trough (i.e Loop).
iTrackStates[][] - 2dim array
iMeter - Optional and defaults to 4. Meter value of 0 indicates a pattern without
  meter, or a pattern that loops from the last and greatest value of the Schedule string.
iBPM - Optinal and defaults to 120. Controls the tempo of the pattern, measured
  in beats per minute.

**********/
/****************************************************************************
kTrig, kOffTrig, kIndx EvtPtrnz kTime, kBPM, SPat
A simple sequencer based on numeric string that returns triggers for events along with index.

Requires Csound 6.07 or higher
Requires the UDOs StrayLen and StrayGetNum
written by Hlöðver Sigurðsson

Input:
kTime - a number representing the length of musical bar
kBPM  - the tempo of 1 integer represented as beats per minute 
sPat  - a string containing numbers on which an event is emitted, seperated by whitespaces
Output:
kTrig - a trigger where 1 represents an event and 0 for no events
kOffTrig - an event triggered after end of each note, ideally for noteoff events
kIndx - a 0 based index of the event that is being triggered
****************************************************************************/
/**********
SAlways, State EvtS2P SPatName, SPar, SPattern, iTimeSignature, iBPM

written by Hlödver Sigurdsson

**********/
/****************************************************************************
Sorc ExtrOrc Sfil
Extracts the orc part of a csd file.

Extracts the orc part (= the text in the <CsInstruments> tag) from the csd 
file Sfil, and returns it as string Sorc. Requires the UDO StripL.
written by joachim heintz

Sfil - csd file (either full path or name if in the same directory)
Sorc - orc part of Sfil as string
****************************************************************************/
/****************************************************************************
iNotNum F2M iFreq [,iRound]
Converts a frequency to MIDI.Cent note number, with optional rounding to the next key.
NOTE: Since Csound 6.09 you can use the ftom opcode!

Converts a frequency to MIDI.Cent note number, for instance 60.024759 for an input of 262 Hz. If the round option is turned on, the frequency is mapped to the nearest key, so that an integer is returned.
written by joachim heintz

iFreq - Frequency to be converted
iRound - 0 = off (default), 1 = on
iNotNum - Midi note number (60 = middle c)
****************************************************************************/
/****************************************************************************
aout GrPtkSmpA ifiltab, iskip, kspeed, kgrainamp, kgrainrate, kgrainsize, kcent, kposrand, kcentrand, icosintab, idisttab, iwin
A simplified version of the Partikkel opcode, but with some additional parameters

A simplified version of the Partikkel opcode, but with some additional parameters. It performs asynchronous granular synthesis with a maximal displacement of 1/grainrate seconds.
written by joachim heintz

ifiltab - function table with the input sound file (usually with GEN01)
iskip - skiptime (sec)
icosintab - function table with cosine (e.g. giCosine ftgen 0, 0, 8193, 9, 1, 1, 90)
idisttab - function table with distribution (e.g. giDisttab ftgen 0, 0, 32768, 7, 0, 32768, 1)
iwin - function table with window shape (e.g. giWin ftgen 0, 0, 4096, 20, 9, 1)
kspeed - speed of the pointer
kgrainamp - multiplier of the grain amplitude (the overall amplitude depends also from grainrate and grainsize)
kgrainrate - number of grains per seconds
kgrainsize - grain duration in ms
kcent - transposition in cent
kposrand - random deviation (offset) of the pointer in ms
kcentrand - random transposition in cents (up and down) 
****************************************************************************/
/*length of input file*/
/*amplitude*/
/*transposition*/
/*pointer*/
/* other parameters */
/****************************************************************************
apartikkel GrPtkSmpB ifiltab, apnter, kgrainamp, kgrainrate, kgrainsize, kcent, kposrand, kcentrand, icosintab, idisttab, iwin
The same as PtkSmpA, but with a time pointer input

A simplified version of the Partikkel opcode, but with some additional parameters. It performs asynchronous granular synthesis with a maximal displacement of 1/grainrate seconds.
written by joachim heintz

ifiltab: function table with the input sound file (usually with GEN01)
icosintab: function table with cosine (e.g. giCosine ftgen 0, 0, 8193, 9, 1, 1, 90)
idisttab: function table with distribution (e.g. giDisttab ftgen 0, 0, 32768, 7, 0, 32768, 1)
iwin: function table with window shape (e.g. giWin ftgen 0, 0, 4096, 20, 9, 1)
apnter: pointer into the function table (0-1)
kgrainamp: multiplier of the grain amplitude (the overall amplitude depends also on grainrate and grainsize)
kgrainrate: number of grains per seconds
kgrainsize: grain duration in ms
kcent: transposition in cent
kposrand: random deviation (offset) of the pointer in ms
kcentrand: random transposition in cents (up and down) 
****************************************************************************/
/*amplitude*/
/*transposition*/
/* other parameters */
/****************************************************************************
aWrp GrPtkWrp aPos, iFilTab [,kAmp [,kCent [,kPosRnd [,kGrainRate [,kGrainSize [,kDistribution]]]]]]
Uses the partikkel opcode to do some sound warping, similar to sndwarp 

Uses the partikkel opcode to do standard sound warping like time freeze, stretch or compress, and pitch shift, on a table with one channel of an audio sample. The goal is to simplify the usage as much as possible, with just setting the position in the sound, and the GEN01 table as inputs. All other parameters are set to  default values.
General notes:
1. The quality of sound transformation with granular synthesis depends mainly on the combination of the different input parameters, at least grain rate, grain size and distribution. So you cannot expect to get excellent results with some default values. Try to use the optional inputs in case of bad results, and if you want to go very much in detail, use the partikkel opcode with all its flexibility. (See, for instance,  SF_Granular.csd in CsoundQt's example menu.)
2. Two function tables are generated from inside the UDO, which is actually bad style. The reason is not to bother the user with tables which are not important for him. But if you want to use this UDO in a real time context, you should definitely put the iWinTab and iDistTab tables outside the UDO.
3. The default values for grain rate (200 Hz) and grain size (100 ms) can be changed easily inside the UDO.
Requires Csound 5.18 or higher.
written by joachim heintz

aPos - position in the sound in seconds
iFilTab - function table containing the mono sound file (use GEN01 with 1 as last parameter to import any sample)
kAmp - amplitude (default = 1). note that the amplitude depends mainly on the combination of grain size and grain rate, so you cannot expect 0 dB when using kAmp=1
kCent - transposition in cent (default = 0)
kPosRnd - position randomness of the time pointer in the sound, in milliseconds (default=0). this can be used in combination with kDistribution to avoid artifacts deriving from synchronous granular synthesis
kGrainRate - grains per second (default = 200)
kGrainSize - grain size in milliseconds (default = 100)
kDistribution - distribution of the grains in time. 0 means periodic, 1 means scattered (which is the dafault), with any value in between possible
see the Csound Manual for partikkel for more information about the input parameters
****************************************************************************/
/****************************************************************************
kval, kfin Linek kthis, knext, ktim, ktrig
performs a linear interpolation from one value to another value in a certain time whenever a trigger is received

Performs a linear interpolation from kthis to knext in ktim whenever ktrig is 1. Otherwise kthis is bypassed (before the first trigger impulse) or kval is held. The behaviour should be the same as in PD's/Max' "line" object.
written by joachim heintz

kthis - starting value
knext - target value
ktim - time for linear ramp in seconds
ktrig - if 1, ramping starts
kval - output value
kfin - 1 if target has been reached
****************************************************************************/
/****************************************************************************
kcount NmCntr kup, kdown [, kstep [, istart]]
Step counter

Counts steps upwards or downwards, whenever a trigger signal has been received. This is meant to be used in live interaction, and is simliar to counter objects in realtime programs like Max or Pd. The example shows how the basic function can be extended to repeat sequences in a certain range.
written by joachim heintz

kstep - step size (default = 1)
istart - starting value (default = 0)
kup - counts upwards when 1
kdown - counts downwards when 1
kcount - current count as output
****************************************************************************/
/****************************************************************************
iFracs NmFrcLen iNum
Returns the real length of the fractional part of a number

Returns the real length of digits in the the fractional part of a number. "Real" means that the number 1.000 actually has no fractional part but is in this sense an integer.
written by joachim heintz

iNum - incoming number
iFracs - number of digits in the fractional part. 0 means that iNum is an integer
****************************************************************************/
/****************************************************************************
iRnd NmRndInt iMin, iMax
kRnd NmRndInt kMin, kMax
Returns a random integer number bewteen Min and Max (included).

Returns a random integer number bewteen Min and Max (included).
As the random opcode is used, make sure to set 'seed 0'.
written by joachim heintz

i(k)Min - minimum possible number
i(k)Max - maximum possible number
i(k)Rnd - result
****************************************************************************/
/****************************************************************************
iValOut NmScl iVal, iInMin, iInMax, iOutMin, iOutMax
kValOut NmScl kVal, kInMin, kInMax, kOutMin, kOutMax

Scales the incoming value i(k)Val in the range between i(k)InMin and i(k)InMax linear to the range between i(k)OutMin and i(k)OutMax.
written by joachim heintz

i(k)Val - incoming number
i(k)InMin - minimum possible incoming number
i(k)InMax - maximum possible incoming numer
i(k)OutMin - minimum possible outgoing number
i(k)OutMax - maximum possible outgoing number
i(k)ValOut - i(k)Val scaled
****************************************************************************/
/****************************************************************************
iOut NmStpInc iValStart, iValEnd, iNumSteps, iThisStep
kOut NmStpInc kValStart, kValEnd, kNumSteps, kThisStep

Step increment

The range between ValStart and ValEnd is divided in a number of steps. The opcode 
returns the proper value for one of these steps.
written by joachim heintz

iValStart (kValStart) - value at start (ThisStep=0)
iValEnd (kValEnd) - value at end (ThisStep=NumSteps)
iNumSteps (kNumSteps) - number of steps between ValStart and ValEnd
iThisStep (kThisStep) - index of this step (starting at zero)
****************************************************************************/
/****************************************************************************
kOnset, kDb OnDtct aIn [,kDbDiff [,kMinTim [,kMinDb [,iRmsFreq [,iDelComp]]]]]
Detects onsets (attacks). Returns also the dB of the rms at this time.

Onset detection is done via the comparision of the current rms value with the
rms value kDelTim seconds before. If the current rms is lager than kDbDiff decibel
compared to the one kDelTim seconds before, an onset is detected. Further conditions
are that kMinTime has passed since the last detection, and the rms value for the 
onset is larger that kMinDb. The velocity of the rms measurement can be adjusted 
with the iRmsFreq parameter.
Note that the kDb output is "too early" for a good estimation of the onset's 
intensity. As the example below shows, it can be taken a short time later.
written by joachim heintz

aIn - audio input signal
kDbDiff - dB difference to signify an offset (default = 10)
kMinTim - minimum time in seconds between two onsets (default = 0.1)
kMinDb - minimum dB to detect an offset (default = -50)
kDelTim - time in seconds which is compared to the current rms (default = 0.025)
iRmsFreq - approximate frequency for rms measurements (default = 50)
kOnset - 1 if onset is detected, otherwise 0
kDb - dB value in the moment of onset detection. Note that this is not the 
      perceived intensity of the beat. About 20 ms later should give a fair result.
****************************************************************************/
/****************************************************************************
atimpt PhsTmPnt kloopstart, kloopend, kspeed, kdir, irefdur
creates a time pointer for loops

creates a time pointer signal for typical loop applications, for instance in the mincer opcode, with optional backward playing
written by joachim heintz

irefdur - the overall duration. must be in the same scale as kloopstart and kloopend (e.g. seconds)
kloopstart - starting point of the loop (in the scale of irefdur)
kloopend - end point of the loop (in the scale of irefdur)
kspeed - 1 = normal speed, 0.5 = half speed, etc.
kdir - 1 = forward, -1 = backward
****************************************************************************/
/****************************************************************************
PrtArr1S SArr [,istart [,iend]]
Prints a one-dimensional string array at i-time.

Prints the content of a one-dimensional string array at i-time. 
Requires Csound 6.
written by joachim heintz

SArr - array to be printed
istart - first index to be printed (default = 0)
iend - first index not to be printed. -1 (default) mean the end of the array
****************************************************************************/
/****************************************************************************
PrtArr1 iArr [,istart [,iend [,iprec [,ippr]]]]]
Prints a one-dimensional array at i-time.

Prints the content of a one-dimensional array at i-time. The indices being printed can be selected, the float precision and the number of values per line (up to 32).
Requires Csound 6.
written by joachim heintz

iArr - array to be printed
istart - first index to be printed (default = 0)
iend - first index not to be printed. -1 (default) mean the end of the array
iprec - float precision while printing (default = 3)
ippr - parameters per row (default = 10, maximum = 32)
****************************************************************************/
/****************************************************************************
PrtArr1k kArr [,ktrig [,kstart [,kend [,kprec [,kppr]]]]]
Prints a one-dimensional array at k-time.

Prints the content of a one-dimensional array at k-time, whenever a trigger is positive. The indices being printed can be selected, the float precision and the number of values per line (up to 32).
Requires Csound 6.
written by joachim heintz

kArr - array to be printed
ktrig - if > 0, kArr is printed once in each k-cycle (= default). for any other value, no printing is performed
kstart - first index to be printed (default = 0)
kend - first index not to be printed. -1 or 0.5 (default) mean the end of the array
kprec - float precision while printing (default = 3)
kppr - parameters per row (default = 10, maximum = 32)
****************************************************************************/
/****************************************************************************
PrtTb ifn [,istart [,iend [,iprec [,ippr]]]]
Prints a function table at i-time.

Prints the content of a function table at i-time, i.e. once at the initialization of an instrument. The indices being printed can be selected, the float precision and the number of values per line (up to 32).
You may have to set the flag -+max_str_len=10000 to avoid buffer overflow. See TbDmpk for the k-rate equivalent.
written by joachim heintz

ifn - function table number
istart - first index to be printed (default = 0)
iend - first index not to be printed (default = -1: end of table)
iprec - float precision while printing (default = 3)
ippr - parameters per row (default = 10, maximum = 32)

****************************************************************************/
/****************************************************************************
PrtTbS ifn, String [,istart [,iend [,iprec [,ippr]]]]
Prints a table with an introducing string at i-time

Prints the content of a table, with an additional string as 'introduction' at i-time (= once at the initialization of an instrument). You may have to set the flag -+max_str_len=10000 for avoiding buffer overflow. See TbDmpSk for the k-rate variant
written by joachim heintz

ifn - function table number
String - string to be printed as introduction
istart - first index to be printed (default = 0)
iend - first index not to be printed (default = -1: end of table)
iprec - float precision while printing (default = 3)
ippr - parameters per row (default = 10, maximum = 32)
****************************************************************************/
/****************************************************************************
PrtTbSk ifn, String [,ktrig [,kstart [,kend [,kprec [,kppr]]]]]
Prints a table with an introducing string at k-time

Prints the content of a function table with a string as 'introduction' at k-time, whenever a trigger is positive. The indices being printed can be selected, the float precision and the number of values per line (up to 32).
You may have to set the flag -+max_str_len=10000 to avoid buffer overflow. See TbDmpS for the i-time equivalent.
Requires Csound 5.18 or higher for the usage of the k-rate default values P, O and V (thanks to Victor Lazzarini for implementing this feature).
written by joachim heintz

ifn - function table number
String - string to be printed as introduction / comment
ktrig - if > 0, ifn is printed once in each k-cycle (= default). for any other value, no printing is performed
kstart - first index to be printed
kend - first index not to be printed. -1 means the end of the table
kprec - float precision while printing
kppr - parameters per row (maximum = 32)
****************************************************************************/
/****************************************************************************
PrtTbk ifn [,ktrig [,kstart [,kend [,kprec [,kppr]]]]]
Prints a function table at k-time.

Prints the content of a function table at k-time, whenever a trigger is positive. The indices being printed can be selected, the float precision and the number of values per line (up to 32).
You may have to set the flag -+max_str_len=10000 to avoid buffer overflow. See TbDmp for the i-time equivalent.
Requires Csound 5.18 or higher for the usage of the k-rate default values P, O and V (thanks to Victor Lazzarini for implementing this feature).
written by joachim heintz

ifn - function table number
ktrig - if > 0, ifn is printed once in each k-cycle (= default). for any other value, no printing is performed
kstart - first index to be printed (default = 0)
kend - first index not to be printed. -1 or 0.5 (default) mean the end of the table
kprec - float precision while printing (default = 3)
kppr - parameters per row (default = 10, maximum = 32)
****************************************************************************/
/****************************************************************************
Prt_a aSig [,kPeriod [,kSpaces]]
Prints an audio signal (vector) every kPeriod seconds.

Prints the values of an audio signal. As this is a list of single sample values in the length of ksmps, ksmps values are printed in []. Like in the printk opcode, you can specify the period between print operations, and the starting spaces.
You may have to set the flag -+max_str_len=10000 to avoid buffer overflow. 
written by joachim heintz

aSig - input signal to be printed
kPeriod - time in seconds between print operations (default = 1). 0 means that printing is performed in each control cycle.
kSpaces - number of spaces to insert before printing (default = 0)

****************************************************************************/
/****************************************************************************
aout SfPlay1 Sfil, kspeed [, iskip [, iloop]]
Plays a mono signal from a mono or stereo soundfile

Gives mono output regardless a soundfile is mono or stereo (if stereo, just the first channel is used).
written by joachim heintz

Sfil - Sound file name (or path) in double quotes
iskip - skiptime in seconds (default=0)
iloop - 1 = loop, 0 = no loop (default=0)
kspeed - speed to read the file (1 = normal, 2 = octave higher, 0.5 = octave lower) ****************************************************************************/
/****************************************************************************
aL, aR SfPlay2 Sfil, kspeed [, iskip [, iloop]]
Plays a stereo signal from a mono or stereo soundfile

Gives stereo output regardless a soundfile is mono or stereo (if mono, this signal is sent to both channels).
written by joachim heintz

Sfil - Sound file name (or path) in double quotes
iskip - skiptime in seconds (default=0)
iloop - 1 = loop, 0 = no loop (default=0)
kspeed - speed to read the file (1 = normal, 2 = octave higher, 0.5 = octave lower)
****************************************************************************/
/****************************************************************************
Sout StrAgrm Sin [,iLen]
Changes the order of the characters in Sin randomly, like in an anagram.

Changes the order of the characters in Sin randomly, like in an anagram, and returns the result as new string.
written by joachim heintz

Sin - input string 
iLen - length of Sin. If -1 (default), the length is calculated internally. 
Sout - output string
****************************************************************************/
/****************************************************************************
Sout StrAgrm Sin [,iLen]
Changes the order of the characters in Sin randomly, like in an anagram.

Changes the order of the characters in Sin randomly, like in an anagram, and returns the result as new string.

Sin - input string 
iLen - length of Sin. If -1 (default), the length is calculated internally. 
Sout - output string
****************************************************************************/
/****************************************************************************
Sdir StrDir Spath
Returns the directory in a given path

Returns the directory part of a given file path string (=everything before the last slash), at i-rate (csound 5.15 or higher).
written by joachim heintz

Spath - full path name as string
Sdir - directory
****************************************************************************/
/****************************************************************************
SUpDir StrDirUp SCurDir
Returns the directory above the current directory

Returns the directory above the current directory.
written by joachim heintz

SCurDir - current directory (with or without an ending slash)
SUpDir - directory above the current directory (returned without an ending slash)
****************************************************************************/
/****************************************************************************
iNum StrExpr Str [, iStrt [, iEnd]]
Converts a string expression to a number. Requires the UDOs StrIsOp, StrLNoth, StrL_NvO, StrL_Prth, StrNxtOpL, StrExpr2, StrRmvST and StrExpr1.

Converts a string expression to a number. Requires the UDOs StrIsOp, StrLNoth, StrL_NvO, StrL_Prth, StrNxtOpL, StrExpr2, StrRmvST and StrExpr1. Spaces (or tabs) are allowed. Supported math operations are +, -, *, /, % and ^. The precedence of bindings is as usual (^ is stronger than *%/ than +-).
written by joachim heintz

Str - input string with a math expression.
iStrt - first index to read in Str (default = 0)
iEnd - last index to read in Str (default = -1 which means end of the string)
iNum - result of the math expression as number
****************************************************************************/
/****************************************************************************
iNum StrExpr1 Str, iStrt, iEnd
Converts a string expression to a number. Note that the string MUST be WITHOUT any spaces or tabs.
Requires the UDOs StrL_Prth, StrNxtOpL, StrLNoth, StrExpr2, StrIsOp, StrL_NvO

Calculates a math expression in a string (optional a part of it >= iStrt <= iEnd) and returns the result as a number. Supported math operations are +, -, *, /, ^, and %. Parentheses are allowed. A simple number string is also accepted and converted to a number. No spaces are allowed; use the UDO StrRmvST if necessary to remove spaces or tabs.
written by joachim heintz

Str - Input string with a common math expression
iStrt - First index (position) to be considered (default = 0)
iEnd - Last index to be considered (default = -1 = end of string)
iNum - Result of the math expression as number
****************************************************************************/
/****************************************************************************
iNum StrExpr2 iNum1, iNum2, iOp

Evaluates two numbers which are combined by the operator iOp.
written by joachim heintz

iNum1, iNum2 - numbers
iOp - 1 -> +, 2 -> -, 3 -> *, 4 -> /, 5 -> %, 6 -> ^
iNum - Result as number
****************************************************************************/
/****************************************************************************
Snam StrFiln Spath [,iRm]
Returns the file name in a given path, toptionally without suffix.

Returns the file name (= everything after the last slash) in a given path.
If iRm is not zero, the suffix is removed.
Requires Csound 5.15 or higher.
written by joachim heintz

Spath - full path name as string
iRm - if zero (default) file name is returned as it is, otherwise without suffix
Snam - name part
****************************************************************************/
/****************************************************************************
iTrue StrIsEmpty Str, iStrt, iEnd
Returns 1 if the positions >= istrt and <= iend are nothing but spaces or tabs.
written by joachim heintz

Str - input string
iStrt - first index (position) to be considered in Str (default = 0)
iEnd - last index to be considered in Str (defualt = -1 = end of string)
iTrue - 1 if true (Str >= istrt and <= iend has only spaces or tabs), 0 else
****************************************************************************/
/****************************************************************************
iOp StrIsOp Str, iPos
Looks whether the iPos character in Str is a mathematical operator. Returns 
1 for for +, 2 for -, 3 for *, 4 for /, 5 for %, 6 for ^ and 0 for anything 
else.
written by joachim heintz

Str - input string
iPos - position (index) to read in Str (default = 0)
iOp - 1-6 for operators '+ - * / % ^', 0 for anything else
****************************************************************************/
/****************************************************************************
iTrue StrLNoth Str, iMin, iPos

Looks whether left of iPos >= iMin is nothing but spaces or tabs. Returns 1 
if true, 0 if false.
written by joachim heintz

Str - input string
iPos - position (index) in Str. the UDO will look "left to" this position
iMin - minimum position (index) which is regarded for left search
iTrue - 1 = true, 0 = false
****************************************************************************/
/****************************************************************************
iTrue StrL_NvO Str, iMin, iPos

Looks whether the next real sign (= except spaces or tabs) left of iPos >= iMin 
is an operator. Returns 1 if true, 0 if false.
Requires the UDO StrIsOp.
written by joachim heintz

Str - input string
iPos - position (index) in Str. the UDO will look "left to" this position
iMin - minimum position (index) which is regarded for left search
iTrue - 1 = true, 0 = false
****************************************************************************/
/****************************************************************************
iPrPos StrL_Prth Str, iMin, iPos

Looks for the next corresponding opening parenthesis < iPos and >= iMin.
written by joachim heintz

Str - input string
iPos - position (index) in Str. the UDO will look "left to" this position.
       the default is -1 which means the end of the input string.
iMin - minimum position (index) which is regarded for left search (default 0)
iPrPos - position (index) of next opening parenthesis (-1 if none)
****************************************************************************/
/****************************************************************************
Sres StrLineBreak String, iNum

Inserts line breaks after iNum characters in the input string.
written by joachim heintz

Sin - Input string which may contain starting spaces or tabs.
Sout - Output string with removed initial spaces/tabs.
****************************************************************************/
/****************************************************************************
iSumEls StrMems Str, Sel
Returns the number of occurencies of a string in another string.

Returns the number of occurencies of a string in another string.
written by joachim heintz

Str - Input string
Sel - Another string which is asked to be a member of Str
iSumEls - Number of occurencies of Sel in Str
****************************************************************************/
/****************************************************************************
itest StrNumP String
Tests whether a string is a numerical string

Tests whether a string is a numerical string ("1" or "1.23435" but not "1a"). Returns 1 for "yes" and 0 for "no". If "yes", the string can be converted to a number by the opcode strtod.
written by joachim heintz

String - any string
itest - 1 if String is a numerical string, 0 if not
****************************************************************************/
/****************************************************************************
iOpPos, iOp StrNxtOpL Str, iMinPos, iPos

Returns position and type of next operator < iPos and >= iMin. Anything inside 
Parentheses will be disregarded.

Requires the UDO StrIsOp.
written by joachim heintz

Str - input string
iPos - position (index) in Str. the UDO will look "left to" this position
iMin - minimum position (index) which is regarded for left search
iOpPos - position of operator
iOp - type of operator: 1-6 for operators '+ - * / % ^', 0 for anything else
****************************************************************************/
/****************************************************************************
Sout StrRmvST Sin, iStrt, iEnd
Removes all spaces or tabs from iStrt to iEnd (both included)

Removes all spaces or tabs in input string Sin from iStrt to iEnd and returns the result as Sout.
written by joachim heintz

Sin - Input string which may contain starting spaces or tabs.
iStrt - First index (position) to consider in Sin (default = 0)
iEnd - Last indes to consider in Sin (default = -1 = end of string)
Sout - Output string with removed initial spaces/tabs.
****************************************************************************/
/****************************************************************************
Suf StrSuf Spath [,ilow]
Returns the suffix of a filename or path, optional in lower case 

Returns the suffix (extension) of a filename or a full path, optional in lower case.
written by joachim heintz

Spath - full pathname (or filename) as string
ilow - return ensuring lower case (1) or return as in Spath (0 = default)
****************************************************************************/
/****************************************************************************
iSum StrSum Sin
Returns the sum of all ASCII values in Sin
written by Hlödver Sigurdsson and joachim heintz

Sin - input string
iSum - sum of all ASCII numbers for the elements in Sin
****************************************************************************/
/****************************************************************************
S_Arr[], iLen StrToArr S_in, S_sep
Transforms the sections of the input string S_in to elements of a string array. The sections in S_in are seperated by the seperator S_in. 
written by joachim heintz

S_in - Input string.
S_sep - Seperator string.
S_Arr - Output string array.
iLen - Its length.
****************************************************************************/
/****************************************************************************
Sout StrToAscS Sin
Returns the ASCII numbers of the input string as string.

Returns the ASCII numbers of the input string as string. The integers in the output string are seperated by one space.
written by joachim heintz

Sin - Input string with any sequence of characters or numbers.
Sout - Output string containing the ASCII numbers of all characters, seperated by spaces.
****************************************************************************/
/****************************************************************************
iStrtOut, iEndOut StrTrmPos Str, iStrtIn, iEndIn
Returns the next position >= iStrtIn and <= iEndIn without possible starting 
and/or ending spaces or tabs.
written by joachim heintz

Str - input string
iStrtIn - first index to read in Str (default = 0)
iEndIn - last index to read in Str (default = -1 which means end of the string)
iStrtOut - first index to read when starting spaces or tabs are omitted
iEndOut - last index to read when ending spaces or tabs are omitted
****************************************************************************/
/****************************************************************************
ilen StrayElCnt Stray [, iElOpn] [, iElCls] [, iSep1] [, iSep2]
Returns the number of elements from a string where a list/array can be counted as 1 element.

Returns the number of elements in Stray. Elements are defined by lists/arrays: iElOpn defaults to 91 (ASCII for '['), iElCls (ASCII for ']'), or by seperators when used outside of lists/arrays: isep1 defaults to 32 (= space) and isep2 defaults to 44 (= comma).
written by Hlöðver Sigurðsson

Stray - a string as array
iElOpn - open element deliminator (default=91: [)
iElCls - close element deliminator (default=93: ])
isep1  - the first seperator (default=32: space)
isep2  - the second seperator (default=44: comma) 
****************************************************************************/
/****************************************************************************
ipos StrayElMem Stray, Stest [, isep1 [, isep2]]
Tests whether a string is contained as an element in an array-string

Looks whether a string equals one of the elements in Stray. If yes, itest returns the position of the element, if no, -1. Elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). if just one seperator is used, isep2 equals isep1.
Requires Csound 5.15 or higher.
written by joachim heintz

Stray - a string as array
Stest - a string to be looked for in Stray
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab) 
ipos - if Stest has been found as element in Stray, the position (starting at 0) is returned. if Stest has not been found as a member of Stray, -1 is returned
****************************************************************************/
/****************************************************************************
Sel StrayGetEl Stray, ielindx [, isep1 [, isep2]]
Gets one element from a string-array

Returns (at i-rate) the element for ielindex in String, or an empty string, if the element has not been found. By default, the seperators between the elements are spaces and tabs. Others seperators can be defined by their ASCII code number.
Requires Csound 5.15 or higher
written by joachim heintz

Input:
Stray - a string as array
ielindx - the index of the element (starting with 0)
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab)
If the defaults are not used and just isep1 is given, it's the only seperator. If you want two seperators (as in the dafault), you must give isep1 and isep2
Output:
Sel - the element at position ielindx, as a string. if the element has not been found, an empty string is returned
****************************************************************************/
/****************************************************************************
inum StrayGetNum Stray, ielindx [, isep1 [, isep2]]
knum StrayGetNum Stray, kelindx [, isep1 [, isep2]]
Gets one number from a string-array

Returns the element with the position ielindex (starting from 0) in Stray. This element must be a number (the other elements can be strings or charcters). By default, the seperators between the elements are spaces and tabs. Others seperators can be defined by their ASCII code number.
If ielindx is out of range, "nan" is returned.
If the element is not a number, "nan" is returned at k-rate, but an error occurs at i-rate.
written by joachim heintz

Input:
Stray - a string as array
ielindx (kelindx) - the index of the element (starting with 0)
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab)
If the defaults are not used and just isep1 is given, it's the only seperator. If you want two seperators (as in the dafault), you must give isep1 and isep2
Output:
inum (knum) - the number which is at the ielindx position of Stray
****************************************************************************/
/****************************************************************************
ilen StrayLen Stray [, isep1 [, isep2]]
kLen StrayLen Stray [, isep1 [, isep2]]
Returns the length of an array-string

Returns the number of elements in Stray. Elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). If just one seperator is used, isep2 equals isep1.
written by joachim heintz

Stray - a string as array
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab) 
****************************************************************************/
/****************************************************************************
ilen StrayNumLen Stray [, isep1 [, isep2]]
Returns the length of numerical elements in an array-string

Returns the number of numerical elements in Stray. Elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). if just one seperator is used, isep2 equals isep1.
Requires the UDOs StrayGetEl, StrayLen and StrNumP
written by joachim heintz

Stray - a string as array
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab) 
****************************************************************************/
/****************************************************************************
itest StrayNumMem Stray, inum [, isep1 [, isep2]]
Tests whether a number is a member of an array-string

Looks whether the number inum is a member of Stray. If yes, itest returns the position of inum in Stray, if no, -1. Elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). If just one seperator is used, isep2 equals isep1.
Requires the UDO StrNumP
written by joachim heintz

Stray - a string as array
inum - the number which is being looked for
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab) 
****************************************************************************/
/****************************************************************************
isum StrayNumSum Stray [, isep1 [, isep2]]]
Adds the elements in a numerical array-string

Adds all numbers in Stray (which must not contain non-numerical elements). Simple math expressions like +, -, *, /, ^ and % are allowed (no parentheses at the moment). Elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). If just one seperator is used, isep2 equals isep1.
Requires the UDOs StrayLen and StrayGetEl.
written by joachim heintz

Stray - a string as array
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab) 
****************************************************************************/
/****************************************************************************
ift, iftlen StrayNumToFt Stray [, iftno [, isep1 [, isep2]]]
Converts a string-array which just consists of numbers or simple math expressions to a function table

Puts all numbers in Stray (which must not contain non-numerical elements) in a function table and returns its variable ift (which is produced by iftno, default=0) and the length of the elements written iftlen. (An empty string as input writes a function table of size=1 to avoid an error but returns 0 as length of elements written.) Simple binary math expressions using +, -, *, /, ^ and % are allowed, with just one parenthesis in total (see the examples below). 
Elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). If just one seperator is used, isep2 equals isep1.
Requires csound 5.15 or higher, and the UDOs StrayLen and StrExpr (which itself requires the UDOs StrIsOp, StrLNoth, StrL_NvO, StrL_Prth, StrNxtOpL, StrExpr2, StrRmvST and StrExpr1).
written by joachim heintz

Stray - a string as array
iftno - like in an ftgen statement: if 0 (which is also the default) an automatic number is generated by Csound; if any positive number, this is then the number of the function table
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab) 
ift - the number of the function table which has been created
iftlen - the length of the elements written to the function table (usually this equals the length of the function table; just an empty string as input will create a function table of size=1 but with iftlen=0)
****************************************************************************/
/****************************************************************************
Srem StrayRemDup Stray [, isep1 [, isep2]]
Removes duplicates in an array-string

Removes duplicates in Stray and returns the result. Elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). If just one seperator is used, isep2 equals isep1.
Requires the UDOs StrayLen and StrayGetEl
written by joachim heintz

Stray - a string as array
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab) 
Srem - the resulting output string
****************************************************************************/
/****************************************************************************
Srev StrayRev Stray [,isepA [, isepB [, isepOut]]]
Reverses the elements of an array-string

Reverses the elements in Stray and returns the result. Elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). If just one seperator is used, isep2 equals isep1. The elements in the resulting string Sres are seperated by isepOut (default=isep1)
Requires Csound 5.16 or higher (new parser)
written by joachim heintz

Stray - a string as array
isepA - the first seperator for the elements in Stray (default=32: space)
isepB - the second seperator for the elements in Stray (default=9: tab) 
isepOut - the seperator for the output string (default=isep1)
Srev - Stray with elements in reverse order
****************************************************************************/
/****************************************************************************
Sel StrayRndEl Stray [, isep1 [, isep2]]
Gets a random element from a string-array.

Returns a random element from a string-array.
Requires Csound 5.15 or higher and the UDOs StrayLen and StrayGetEl.
written by joachim heintz

Input:
Stray - a string as array
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab)
If the defaults are not used and just isep1 is given, it's the only seperator. If you want two seperators (as in the dafault), you must give isep1 and isep2
Output:
Sel - the random element as a string
****************************************************************************/
/****************************************************************************
Sres StraySetEl Stray, Sin [, ielindx [, isep1 [, isep2 [,isepOut]]]]
Inserts an element in an array-string at a certain position

Puts the string Sin at the position ielindx (default=-1: at the end) of Stray, and returns the result as a string. Elements in the string are seperated by the two ascii-coded seperators isepA (default=32: space) and isepB (default=9: tab). If just isepA is given, it is also read as isepB. The new element is inserted using the seperator isepOut (default=isep1)
Requires Csound 5.16 or higher (new parser)
written by joachim heintz

Stray - a string as array 
Sin - a string to be inserted 
ielindx - the element position in Stray at which the new element is to be inserted (starting with 0); the default -1 means append at the end of Stray
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab) 
isepOut - the seperator for the insertion (default=isep1)
****************************************************************************/
/****************************************************************************
Sres StraySetNum Stray, inum [, ielindx [, isep1 [, isep2 [,isepOut]]]]
Inserts a number in an array-string at a certain position

Puts the number inum at the position ielindx (default=-1: at the end) of Stray, and returns the result as Sres. Elements in Stray are seperated by the two ascii-coded seperators isepA (default=32: space) and isepB (default=9: tab). if just isepA is given, it is also read as isepB. the element is inserted using the seperator isepOut (default=isep1)
Requires Csound 5.16 or higher, and the UDO NmFrcLen.
written by joachim heintz

Stray - a string as array
inum - the number to be inserted
ielindx - the element position in Stray at which the number is inserted (starting with 0); the default -1 means append at the end of Stray
istrout - a number for the strset opcode, denoting the resulting string (Stray with the insertion of the new element). the default is 1; as strset creates global numbers you should be careful in using this number
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab)
isepOut - the seperator for the insertion (default=isep1)
****************************************************************************/
/****************************************************************************
Sub StraySub Stray [, istart [, iend [, isepA [, isepB [, isepOut]]]]]
Returns a subset of elements in an array-string

Returns a subset of elements in Stray, from istart (included) to iend (excluded). The defaults are istart=0 (first element) and iend=-1 (end of string). Elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). If just one seperator is used, isep2 equals isep1.
The resulting substring will use isepOut as seperator (default=isep1)
Requires Csound 5.16 or higher (new parser)
written by joachim heintz

Stray - a string as array
istart - first element to extract (default=0)
iend - first element after selection (default=-1: end of string)
isep1 - first seperator for the elements in Stray (default=32: space)
isep2 - second seperator for the elements in Stray (default=9: tab) 
isepOut - seperator for the elements in the output string (default=isep1)
Sub - resulting subset of Stray
****************************************************************************/
/****************************************************************************
Sout StripL Sin
Strips all initial spaces or tabs from a string.

Strips all spaces or tabs at the beginning of the input string Sin and returns the result as Sout.
written by joachim heintz

Sin - Input string which may contain starting spaces or tabs.
Sout - Output string with removed initial spaces/tabs.
****************************************************************************/
/****************************************************************************
ipos TbMem ival, ift [, indxstrt [, indxend]]
Looks whether a number is in a function table

Looks whether a number is a member of a function table, in a range between indxstart (included) and indxend (excluded). Returns the position of the element if found, or -1 otherwise.
written by joachim heintz

ival - element (number) to be looked for
ift - function table
indxstart - starting index in ift to look for ival (default=0)
indxend - position after the last index which is tested (default = -1 = length of the table). if a number is given for indxend which exceeds the length of the function table, an error occurs
ipos - if ival has been found in ift, the position of the first occurence is returned, or -1, if ival has not been found
****************************************************************************/
/****************************************************************************
iPeak TbPeak ift [, indxstrt [, indxend]]
Returns the peak (highest absolute number) value of a function table.

Returns the peak value of a function table, or a part of it, in a range between indxstart (included, defaults to zero) and indxend (excluded, defaults to table length). The return value is always positive.
written by joachim heintz

ift - function table
indxstart - starting index in ift to look for ival (default=0)
indxend - position after the last index which is tested (default = -1 = length of the table). if a number is given for indxend which exceeds the length of the function table, it will stop at table end
iPeak - peak value as absolute number
****************************************************************************/
/****************************************************************************
TbPrmRnd ift
Permutes the values of a function table randomly, at i-time

Permutes the values of ift randomly and overwrites this table with the result. See TbPrmRndk for the k-rate version
written by joachim heintz

ift: function table to be permuted
****************************************************************************/
/****************************************************************************
TbPrmRndk ift, ktrig
Permutes the values of a function table randomly, at k-time

Permutes the values of ift randomly and overwrites this table with the result. This operation is performed once a k-cycle, as long as a trigger is positive. See TbPrmRnd for the i-rate version
written by joachim heintz

ift - function table to be permuted
ktrig - if > 0, the permutation is performed once a k-cycle
****************************************************************************/
/****************************************************************************
iend TbRmDp iftsrc, iftdst [, ioffset [, inumels]]
Removes duplicates from a function table

Removes duplicates from a function table, copies the elements in a new table, and returns the end position (which can be used to build a table with just these elements).
Requires the UDO TbMem
written by joachim heintz

iftsrc - source function table
iftdst - table (usually with the same length as iftsrc) for copying the non-duplicated elements of iftsrc
ioffset - index to start copying of elements in iftsrc
inumels - number of elements to investigate
iend - position after the last index which has been written in iftdest
****************************************************************************/
/****************************************************************************
ifno TbScala Sfil [, ibasefreq [, ibasekey [, ifn]]] 
Creates a table by reading a scala scale file (.scl)

Scale values are converted to decimal format useable by the cpstun(i) opcode.
Written by Thorin Kerr

ifno - Return number of generated table.
Sfil - scale file name (or path) in double quotes
ibasefreq - The base frequency of the scale in cycles per second (default = Csounds A4 value)
ibasekey - The integer index of the scale to which to assign basefreq unmodified (default = 69)
ifn - destination table number of the table. (default 0: generated by Csound)

The scala software, file format, and scale archive is available from  http://www.huygens-fokker.org/scala/
****************************************************************************/
/****************************************************************************
iFt TbSinc iStart, iEnd [,iSize [,iFtNo]]
Creates a table with a sinc function.

Creates a table containing the values of a sinc function f(x)/x from x between start and end, with a table size of 4096 as default. Returns the table number which is by default generated by Csound, but can also be assigned by an input.
written by joachim heintz

iStart - lowest x value for sinc function
iEnd - highest x value for sinc function
iSize - size of the function table generated (default 4096 points)
iFtNo - number of the generated table (default 0: generated by Csound)
iFt - the number of the table 
****************************************************************************/
/****************************************************************************
kLin TbToLin iFt
Reads a table in the same way as a linseg opcode

Reads a table which contains segments of value - duration - value in the same way as a linseg opcocde would do.
written by joachim heintz

iFt - a function table, usually generated with GEN02 and not normaized
kLin - k-rate output
****************************************************************************/
/****************************************************************************
TbToSF ift, Soutname, ktrig [,iformat [,istart [,iend]]]
Writes the content of a table to a soundfile.
NOTE. After Csound 6.11 you can use the ftaudio opcode!

Writes the content of a table to a soundfile, with optional start and end point
written by joachim heintz

ift - function table to write
Soutname - output file name in double quotes
iformat - output file format according to the fout manual page. if not specified or -1, the file is written with a wav header and 24 bit
istart - start in seconds in the function table to write (default=0)
iend - last point to write in the function table in seconds (default=-1: until the end)
ktrig - if 1, the file is being written in one control-cycle. Make sure the trigger is 1 just for one k-cycle; otherwise the writing operation will be repeated again and again in each control cycle
****************************************************************************/
/*
ArrAddEl   : iOutArr[] ArrAddEl iInArr[], iEl [,iPos]
ArrAvrg    : iAvrg ArrAvrg iArr[] [,iStart [,iEnd]]
ArrCat     : iOutArr[] ArrCat iArr1[], iArr2[]
ArrElCnt   : iFound ArrElCnt iNeedle, iInArr[]
ArrElIn    : iRes ArrElIn iEl, iArr[]
ArrPermRnd : iOutArr[] ArrPermRnd iInArr[] [, iN]
ArrPermRnd2: iOutArr[] ArrPermRnd2 iInArr[] [, iStart [, iEnd]]
ArrPermRndIndx: iOutArr[] ArrPermRndIndx iInArr[] [, iN]
ArrPldrm   : iOutArr[] ArrPldrm iInArr[] [,iOpt]
ArrRmDup   : iOutArr[] ArrRmDup iInArr[]
ArrRmEl    : iOutArr[] ArrRmEl iInArr[], iEl
ArrRmIndx  : iOutArr[] ArrRmIndx iInArr[], iIndx
ArrRndEl   : iEl ArrRndEl iInArr[] [, iStart [, iEnd]]
ArrRtt     : iOutArr[] ArrRtt iInArr[] [,iRot]
ArrRvrs    : iOutArr[] ArrRvrs iInArr[]
ArrSrt     : kOutArr[] ArrSrt kInArr[] [,iOutN [,kOutType ,[kStart [,kEnd [,kHop]]]]]
*/
/* prints:
ArrAddEl:
 1 2 3 4 5 6 7 8 9 10 
Average: 5
ArrCat:
 1 2 3 4 5 6 7 8 9 -1 -2 -3 -2 
ArrElCnt: 1 (for element=5)
ArrElIn: 0 (yes/no) for element=-1
ArrPermRnd:
 4 3 7 5 9 6 8 1 2 
ArrPermRnd2:
 1 2 3 4 7 5 6 8 9 
ArrPermRndIndx:
 0 3 8 4 1 6 5 7 2 
ArrPldrm:
 1 2 3 4 5 6 7 8 9 8 7 6 5 4 3 2 1 
ArrRmDup:
 -1 -2 -3 
ArrRmEl:
 -1 -3 
ArrRmIndx:
 -2 -3 -2 
ArrRndEl: 7
ArrRtt:
 2 3 4 5 6 7 8 9 1 
ArrRvrs:
 9 8 7 6 5 4 3 2 1 
*/

opcode ArrAddEl, i[], i[]ij

 iInArr[], iEl, iPos xin
 iOutArr[] init lenarray:i(iInArr)+1
 iPos = (iPos == -1) ? lenarray:i(iInArr) : iPos
 iWriteIndx = 0
 iIndxDiff = 0
 while iWriteIndx < lenarray:i(iOutArr) do
  iReadIndx = iWriteIndx - iIndxDiff
  if iWriteIndx == iPos then
   iOutArr[iWriteIndx] = iEl
   iIndxDiff = 1
  else
   iOutArr[iWriteIndx] = iInArr[iReadIndx]
  endif
  iWriteIndx += 1
 od
 xout iOutArr

endop
opcode ArrAddEl, k[], k[]kJ

 kInArr[], kEl, kPos xin
 kOutArr[] init lenarray:i(kInArr)+1
 kPos = (kPos == -1) ? lenarray:i(kInArr) : kPos
 kWriteIndx = 0
 kIndxDiff = 0
 while kWriteIndx < lenarray:k(kOutArr) do
  kReadIndx = kWriteIndx - kIndxDiff
  if kWriteIndx == kPos then
   kOutArr[kWriteIndx] = kEl
   kIndxDiff = 1
  else
   kOutArr[kWriteIndx] = kInArr[kReadIndx]
  endif
  kWriteIndx += 1
 od
 xout kOutArr

endop

opcode ArrAvrg, i, i[]oj

 iArr[], iStart, iEnd xin
 iEnd = (iEnd == -1) ? lenarray(iArr) : iEnd
 iAvrg = 0
 if iStart >= iEnd then
  prints "ERROR in ArrAvrg: iEnd must be larger than iStart\n"
  igoto end
 endif
 iCnt = 0
 while iStart < iEnd do
  iAvrg += iArr[iStart]
  iStart += 1
  iCnt += 1
 od
 iAvrg /= iCnt
 end:
 xout iAvrg

endop
opcode ArrAvrg, k, k[]oj

 kArr[], iStart, iEnd xin
 iEnd = (iEnd == -1) ? lenarray(kArr) : iEnd
 kAvrg = 0
 if iStart >= iEnd then
  prints "ERROR in ArrAvrg: iEnd must be larger than iStart\n"
  igoto end
 endif
 kStart = iStart
 kCnt = 0
 while kStart < iEnd do
  kAvrg += kArr[kStart]
  kStart += 1
  kCnt += 1
 od
 kAvrg /= kCnt
 end:
 xout kAvrg

endop


opcode ArrCat, i[], i[]i[]

 iArr1[], iArr2[] xin
 iLenOutArr = lenarray(iArr1) + lenarray(iArr2)
 iOutArr[] init iLenOutArr
 indx = 0
 while indx < lenarray(iArr1) do
  iOutArr[indx] = iArr1[indx]
  indx += 1
 od
 while indx < iLenOutArr do
  iOutArr[indx] = iArr2[indx-lenarray(iArr1)]
  indx += 1
 od
 xout iOutArr

endop
opcode ArrCat, k[], k[]k[]

 kArr1[], kArr2[] xin
 iLenOutArr = lenarray:i(kArr1) + lenarray:i(kArr2)
 kOutArr[] init iLenOutArr
 kndx = 0
 while kndx < lenarray(kArr1) do
  kOutArr[kndx] = kArr1[kndx]
  kndx += 1
 od
 while kndx < iLenOutArr do
  kOutArr[kndx] = kArr2[kndx-lenarray(kArr1)]
  kndx += 1
 od
 xout kOutArr

endop

opcode ArrElCnt,k,ki[]
  kNeedle, iInArr[] xin
  kLen lenarray iInArr
  kIndx = 0
  kFound = 0
  while (kIndx<kLen) do
    if (kNeedle == iInArr[kIndx]) then
      kFound = kFound+1
    endif
    kIndx = kIndx+1
  od
  xout kFound
endop
opcode ArrElCnt,k,kk[]
  kNeedle, kInArray[] xin
  kLen lenarray kInArray
  kIndx = 0
  kFound = 0
  while (kIndx<kLen) do
    if (kNeedle == kInArray[kIndx]) then
      kFound = kFound+1
    endif
    kIndx = kIndx+1
  od
  xout kFound
endop
opcode ArrElCnt,i,ii[]
  iNeedle, iInArr[] xin
  iLen lenarray iInArr
  iIndex = 0
  iFound = 0
  while (iIndex<iLen) do
    if (iNeedle == iInArr[iIndex]) then
      iFound = iFound+1
    endif
    iIndex = iIndex+1
  od
  xout iFound
endop

opcode ArrElIn, i, ii[]

 iEl, iArr[] xin
 iRes = 0
 indx = 0
 while indx < lenarray:i(iArr) do
  if iEl == iArr[indx] then
   iRes = 1
   igoto end
  endif
  indx += 1
 od
 end:
 xout iRes

endop
opcode ArrElIn, k, kk[]

 kEl, kArr[] xin
 kRes = 0
 kndx = 0
 while kndx < lenarray:k(kArr) do
  if kEl == kArr[kndx] then
   kRes = 1
   kgoto end
  endif
  kndx += 1
 od
 end:
 xout kRes

endop

  opcode ArrPermRnd, i[], i[]j
iInArr[], iN xin
iLen       =          lenarray(iInArr)
;get output length
iN = (iN == -1) ? iLen : iN
;create out array and set index
iOutArr[]  init       iN
iIndx      =          0
;for iN elements:
 until iIndx == iN do
 ;get one random element and put it in iOutArr
iRndIndx   random     0, iLen-.0001
iRndIndx   =          int(iRndIndx)
iOutArr[iIndx] =      iInArr[iRndIndx]
 ;shift the elements after this one to the left
  until iRndIndx == iLen-1 do
iInArr[iRndIndx] = iInArr[iRndIndx+1]
iRndIndx   +=         1
  enduntil
 ;reset iLen and increase counter
iLen       -=         1
iIndx      +=         1
 enduntil
           xout       iOutArr
  endop
  opcode ArrPermRnd, k[], k[]j
kInArr[], iN xin
iLen       =          lenarray(kInArr)
iN = (iN == -1) ? iLen : iN
kOutArr[]  init       iN
kIndx = 0
kLen = iLen
;for kN elements:
until kIndx == iN do
 ;get one random element and put it in kOutArr
kRndIndx   random     0, kLen-.0001
kRndIndx   =          int(kRndIndx)
kOutArr[kIndx] =      kInArr[kRndIndx]
 ;shift the elements after this one to the left
 until kRndIndx == kLen-1 do
kInArr[kRndIndx] = kInArr[kRndIndx+1]
kRndIndx   +=         1
 enduntil
 ;reset kLen and increase counter
kLen       -=         1
kIndx      +=         1
enduntil
           xout       kOutArr
  endop
  opcode ArrPermRnd, S[], S[]j
SInArr[], iN xin
iLen       =          lenarray(SInArr)
iN = (iN == -1) ? iLen : iN
SOutArr[]  init       iN
indx      =          0
while indx < iN do
 iRndIndx   random     0, iLen-.0001
 iRndIndx   =          int(iRndIndx)
 SOutArr[indx] =      SInArr[iRndIndx]
 while iRndIndx < iLen-1 do
  SInArr[iRndIndx] = SInArr[iRndIndx+1]
  iRndIndx   +=         1
 od
 iLen       -=         1
 indx      +=         1
od
           xout       SOutArr
  endop

  opcode ArrPermRnd2, i[], i[]oj
iInArr[], iStart, iEnd xin
iLen = lenarray(iInArr)
iEnd = (iEnd == -1) ? iLen-1 : iEnd
;create out array and set index
iOutArr[] = iInArr
iIndx = iStart
iLast = iEnd
;for elements between iStart amd iEnd:
 until iIndx > iLast do
 ;get one random element and put it in iOutArr
iRndIndx random iStart, iEnd+.9999
iRndIndx = int(iRndIndx)
iOutArr[iIndx] = iInArr[iRndIndx]
 ;shift the elements after this one to the left
  until iRndIndx >= iEnd do
iInArr[iRndIndx] = iInArr[iRndIndx+1]
iRndIndx += 1
  od
 ;reset end and increase counter
iIndx += 1
iEnd -= 1
 od
 xout iOutArr
  endop
  opcode ArrPermRnd2, k[], k[]OJ
kInArr[], kStart, kEnd xin
kLen lenarray kInArr
kEnd = (kEnd == -1) ? kLen-1 : kEnd
;create out array and set index
kOutArr[] = kInArr
kIndx = kStart
kLast = kEnd
 until kIndx > kLast do
 ;get one random element and put it in iOutArr
kRndIndx random kStart, kEnd+.9999
kRndIndx = int(kRndIndx)
kOutArr[kIndx] = kInArr[kRndIndx]
 ;shift the elements after this one to the left
  until kRndIndx >= kEnd do
kInArr[kRndIndx] = kInArr[kRndIndx+1]
kRndIndx += 1
  od
 ;reset end and increase counter
kIndx += 1
kEnd -= 1
 od
 xout kOutArr
  endop

opcode ArrPermRndIndx, i[], i[]j
 iInArr[], iN xin
 iLen       lenarray   iInArr
 iN = (iN == -1) ? iLen : iN
 iInd[]     genarray   0, iLen-1
 iIndCpy[]  =          iInd
 iOutArr[]  init       iN
 iIndx      =          0
 until iIndx == iN do
  iRndIndx   =          int(random:i(0, iLen-.0001))
  iOutArr[iIndx] =      iIndCpy[iRndIndx]
  until iRndIndx == iLen-1 do
   iIndCpy[iRndIndx] = iIndCpy[iRndIndx+1]
   iRndIndx   +=         1
  od
  iLen       -=         1
  iIndx      +=         1
 od
           xout       iOutArr
endop
opcode ArrPermRndIndx, k[], k[]j
 kInArr[], iN xin
 iLen       lenarray   kInArr
 iN = (iN == -1) ? iLen : iN
 kInd[]     genarray_i  0, iLen-1
 kIndCpy[]  =          kInd
 kOutArr[]  init       iN
 kIndx      =          0
 kLen       =          iLen
 until kIndx == iN do
  kRndIndx   =          int(random:k(0, kLen-.0001))
  kOutArr[kIndx] =      kIndCpy[kRndIndx]
  until kRndIndx == kLen-1 do
   kIndCpy[kRndIndx] = kIndCpy[kRndIndx+1]
   kRndIndx   +=         1
  od
  kLen       -=         1
  kIndx      +=         1
 od
           xout       kOutArr
endop

opcode ArrPldrm, i[], i[]o
 iInArr[], iOpt xin
 iReadIndx = 0
 iWriteIndx = 0
 if iOpt == 0 then
  iOutArr[] init lenarray:i(iInArr) * 2 - 1
  while iWriteIndx < lenarray:i(iOutArr) do
   iOutArr[iWriteIndx] = iInArr[iReadIndx]
   iWriteIndx += 1
   iReadIndx = (iWriteIndx < lenarray:i(iInArr)) ? iReadIndx+1 : iReadIndx-1
  od
 elseif iOpt == 1 then
  iOutArr[] init lenarray:i(iInArr) * 2 - 2
  while iWriteIndx < lenarray:i(iOutArr) do
   iOutArr[iWriteIndx] = iInArr[iReadIndx]
   iWriteIndx += 1
   iReadIndx = (iWriteIndx < lenarray:i(iInArr)) ? iReadIndx+1 : iReadIndx-1
  od
 elseif iOpt == 2 then
  iOutArr[] init lenarray:i(iInArr) * 2
  while iWriteIndx < lenarray:i(iOutArr) do
   iOutArr[iWriteIndx] = iInArr[iReadIndx]
   iWriteIndx += 1
   iReadIndx = (iWriteIndx < lenarray:i(iInArr)) ? iReadIndx+1 : ((iWriteIndx > lenarray:i(iInArr)) ? iReadIndx-1 : iReadIndx)
  od
 endif
 xout iOutArr
endop
opcode ArrPldrm, k[], k[]o
 kInArr[], iOpt xin
 kReadIndx = 0
 kWriteIndx = 0
 if iOpt == 0 then
  kOutArr[] init lenarray:i(kInArr) * 2 - 1
  while kWriteIndx < lenarray:i(kOutArr) do
   kOutArr[kWriteIndx] = kInArr[kReadIndx]
   kWriteIndx += 1
   kReadIndx = (kWriteIndx < lenarray:i(kInArr)) ? kReadIndx+1 : kReadIndx-1
  od
 elseif iOpt == 1 then
  kOutArr[] init lenarray:i(kInArr) * 2 - 2
  while kWriteIndx < lenarray:i(kOutArr) do
   kOutArr[kWriteIndx] = kInArr[kReadIndx]
   kWriteIndx += 1
   kReadIndx = (kWriteIndx < lenarray:i(kInArr)) ? kReadIndx+1 : kReadIndx-1
  od
 elseif iOpt == 2 then
  kOutArr[] init lenarray:i(kInArr) * 2
  while kWriteIndx < lenarray:i(kOutArr) do
   kOutArr[kWriteIndx] = kInArr[kReadIndx]
   kWriteIndx += 1
   kReadIndx = (kWriteIndx < lenarray:i(kInArr)) ? kReadIndx+1 : ((kWriteIndx > lenarray:i(kInArr)) ? kReadIndx-1 : kReadIndx)
  od
 endif
 xout kOutArr
endop

opcode ArrRmDup, i[], i[]
 iInArr[] xin
 iOutArr[] init lenarray:i(iInArr)
 iReadIndx = 0
 iWriteIndx = 0
 iCnt = 0
 while iReadIndx < lenarray:i(iInArr) do
  if ArrElIn:i(iInArr[iReadIndx],iOutArr) == 0 then
   iOutArr[iWriteIndx] = iInArr[iReadIndx]
   iWriteIndx += 1
   iCnt += 1
  endif
  iReadIndx += 1
 od
 trim_i iOutArr, iCnt
 xout iOutArr
endop
opcode ArrRmDup, k[], k[]
 kInArr[] xin
 kOutArr[] init lenarray:i(kInArr)
 kReadIndx = 0
 kWriteIndx = 0
 kCnt = 0
 while kReadIndx < lenarray:i(kInArr) do
  if ArrElIn:k(kInArr[kReadIndx],kOutArr) == 0 then
   kOutArr[kWriteIndx] = kInArr[kReadIndx]
   kWriteIndx += 1
   kCnt += 1
  endif
  kReadIndx += 1
 od
 trim kOutArr, kCnt
 xout kOutArr
endop

opcode ArrRmEl, i[], i[]i
 iInArr[], iEl xin
 iOutArr[] init lenarray:i(iInArr)
 iReadIndx = 0
 iWriteIndx = 0
 while iReadIndx < lenarray:i(iInArr) do
  if iInArr[iReadIndx] != iEl then
   iOutArr[iWriteIndx] = iInArr[iReadIndx]
   iWriteIndx += 1
  endif
  iReadIndx += 1
 od
 trim_i iOutArr, iWriteIndx
 xout iOutArr
endop
opcode ArrRmEl, k[], k[]k
 kInArr[], kEl xin
 kOutArr[] init lenarray:i(kInArr)
 kReadIndx = 0
 kWriteIndx = 0
 while kReadIndx < lenarray(kInArr) do
  if kInArr[kReadIndx] != kEl then
   kOutArr[kWriteIndx] = kInArr[kReadIndx]
   kWriteIndx += 1
  endif
  kReadIndx += 1
 od
 trim kOutArr, kWriteIndx
 xout kOutArr
endop

  opcode ArrRmIndx, i[], i[]i
iInArr[], iIndx xin
iOutArr[]  init       lenarray(iInArr)-1
iReadIndx  =          0
 until iReadIndx == iIndx do
iOutArr[iReadIndx] =  iInArr[iReadIndx]
iReadIndx  +=         1
 enduntil
iReadIndx  +=         1
 until iReadIndx == lenarray(iInArr) do
iOutArr[iReadIndx-1] = iInArr[iReadIndx]
iReadIndx  +=         1
 enduntil
           xout       iOutArr
  endop
  opcode ArrRmIndx, k[], k[]k
kInArr[], kIndx xin
kOutArr[]  init       lenarray:i(kInArr)-1
kReadIndx  =          0
 until kReadIndx == kIndx do
kOutArr[kReadIndx] =  kInArr[kReadIndx]
kReadIndx += 1
 enduntil
kReadIndx += 1
 until kReadIndx == lenarray(kInArr) do
kOutArr[kReadIndx-1] = kInArr[kReadIndx]
kReadIndx += 1
 enduntil
           xout       kOutArr
  endop

opcode ArrRndEl, i, i[]oj
 iInArr[], iStart, iEnd xin
 iLen lenarray iInArr
 iEnd = (iEnd == -1) ? iLen-1 : iEnd
 iElIndx random iStart, iEnd+0.999
 iEl = iInArr[int(iElIndx)]
 xout iEl
endop
opcode ArrRndEl, k, k[]OV
 kInArr[], kStart, kEnd xin
 kLen lenarray kInArr
 kEnd = (kEnd == 0.5) ? kLen-1 : kEnd
 kElIndx random kStart, kEnd+0.999
 kEl = kInArr[int(kElIndx)]
 xout kEl
endop
opcode ArrRndEl, S, S[]oj
 SInArr[], iStart, iEnd xin
 iLen lenarray SInArr
 iEnd = (iEnd == -1) ? iLen-1 : iEnd
 iElIndx random iStart, iEnd+0.999
 SEl = SInArr[int(iElIndx)]
 xout SEl
endop

opcode ArrRtt, i[], i[]p
 iInArr[], iPos xin
 iLen lenarray iInArr
 iOutArr[] init iLen
 iPos = (iPos < 0) ? iLen-(abs(iPos%iLen)) : iPos
 indx = 0
 while indx < iLen do
  iOutArr[indx] = iInArr[(iPos+indx)%iLen]
  indx += 1
 od
 xout iOutArr
endop
opcode ArrRtt, k[], k[]P
 kInArr[], kPos xin
 iLen lenarray kInArr
 kOutArr[] init iLen
 kPos = (kPos < 0) ? iLen-(abs(kPos%iLen)) : kPos
 kndx = 0
 while kndx < iLen do
  kOutArr[kndx] = kInArr[(kPos+kndx)%iLen]
  kndx += 1
 od
 xout kOutArr
endop

opcode ArrRvrs, i[], i[]
 iInArr[] xin
 iOutArr[] init lenarray:i(iInArr)
 indx = 0
 while indx < lenarray:i(iInArr) do
  iOutArr[lenarray:i(iInArr)-indx-1] = iInArr[indx]
  indx += 1
 od
 xout iOutArr
endop
opcode ArrRvrs, k[], k[]
 kInArr[] xin
 kOutArr[] init lenarray:i(kInArr)
 kndx = 0
 while kndx < lenarray(kInArr) do
  kOutArr[lenarray(kInArr)-kndx-1] = kInArr[kndx]
  kndx += 1
 od
 xout kOutArr
endop

  opcode ArrSrt, k[], k[]jOOOP
  
kArr[], iOutN, kOutType, kStart, kEnd, kHop xin

;calculate some common values 
kLen lenarray kArr
kEnd = kEnd > kLen || kEnd == 0 ? kLen : kEnd

;create the array for the result
iOutN = (iOutN == -1) ? lenarray:i(kArr) : iOutN
kRes[] init iOutN

;fill this array with the smallest number minus 1 of kArr
kIndx = 0
kMin minarray kArr
until kIndx == iOutN do
  kRes[kIndx] = kMin-1
  kIndx += 1
enduntil

;if necessary, create index array
if kOutType != 0 then
  kIndices[] init iOutN
endif

;initialize pointer
kArrPnt = kStart

;loop over the elements of the array
until kArrPnt >= kEnd do
 
  ;loop over kRes
  kResPnt = 0
  until kResPnt == iOutN do
  
    ;if an el in kRes is smaller than the element we are comparing with
    if kRes[kResPnt] < kArr[kArrPnt] then
    
      ;shift the elements right to kResPnt one position to the right
      kShiftPnt = iOutN-1 
      until kShiftPnt == kResPnt do
        kRes[kShiftPnt] = kRes[kShiftPnt-1]
        kShiftPnt -= 1 
      enduntil
      
      ;then put the element we are comparing with at this position
      kRes[kResPnt] = kArr[kArrPnt]

      ;if indices array 
      if kOutType != 0 then
      
        ;shift the elements in kIndices one position to the right
        kShiftPnt = iOutN-1 
        until kShiftPnt == kResPnt do
          kIndices[kShiftPnt] = kIndices[kShiftPnt-1]
          kShiftPnt -= 1
        enduntil

        ;then put in the index
        kIndices[kResPnt] = kArrPnt
      endif
      
      ;and leave the loop
      kgoto Break
      
    endif
    
    ;increase res pointer
    kResPnt += 1
    
  enduntil
  
  Break:
  ;increase array pointer
  kArrPnt += kHop
 
enduntil

;copy array to final result
if kOutType == 0 then
kOut[] = kRes
else
kOut[] = kIndices
endif

xout kOut

 endop

  opcode BufFiCt1, i, Soo
Sfilenam, iftnum, inorm xin
igen      =         (inorm == 0 ? -1 : 1)
ift       ftgen     iftnum, 0, 0, igen, Sfilenam, 0, 0, 1
          xout      ift  
  endop

  opcode BufFiCt2, ii, Sooo
Sfilenam, ifnL, ifnR, inorm xin
igen      =         (inorm == 0 ? -1 : 1)
iftL      ftgen     ifnL, 0, 0, igen, Sfilenam, 0, 0, 1
iftR      ftgen     ifnR, 0, 0, igen, Sfilenam, 0, 0, 2
          xout      iftL, iftR  
  endop

  opcode BufFiCt4, iiii, Sooooo
Sfilenam, ifn1, ifn2, ifn3, ifn4, inorm xin
igen       =          (inorm == 0 ? -1 : 1)
ift1       ftgen      ifn1, 0, 0, igen, Sfilenam, 0, 0, 1
ift2       ftgen      ifn2, 0, 0, igen, Sfilenam, 0, 0, 2
ift3       ftgen      ifn3, 0, 0, igen, Sfilenam, 0, 0, 3
ift4       ftgen      ifn4, 0, 0, igen, Sfilenam, 0, 0, 4
           xout       ift1, ift2, ift3, ift4
  endop

  opcode BufFiCt8, iiiiiiii, Sooooooooo
Sfilenam, ifn1, ifn2, ifn3, ifn4, ifn5, ifn6, ifn7, ifn8, inorm xin 
igen      =         (inorm == 0 ? -1 : 1)
ift1      ftgen     ifn1, 0, 0, igen, Sfilenam, 0, 0, 1
ift2      ftgen     ifn2, 0, 0, igen, Sfilenam, 0, 0, 2
ift3      ftgen     ifn3, 0, 0, igen, Sfilenam, 0, 0, 3
ift4      ftgen     ifn4, 0, 0, igen, Sfilenam, 0, 0, 4
ift5      ftgen     ifn5, 0, 0, igen, Sfilenam, 0, 0, 5
ift6      ftgen     ifn6, 0, 0, igen, Sfilenam, 0, 0, 6
ift7      ftgen     ifn7, 0, 0, igen, Sfilenam, 0, 0, 7
ift8      ftgen     ifn8, 0, 0, igen, Sfilenam, 0, 0, 8
          xout      ift1, ift2, ift3, ift4, ift5, ift6, ift7, ift8
  endop

  opcode BufFiCtNd1, ii, Spoo
Sfilenam, ichn, iftnum, inorm xin
igen      =         (inorm == 0 ? -1 : 1)
ifttmp    ftgen     0, 0, 0, igen, Sfilenam, 0, 0, ichn
ilen      tableng   ifttmp
ift       ftgen     iftnum, 0, -ilen, -2, 0
          vcopy_i   ift, ifttmp, ilen
          ftfree    ifttmp, 0
          xout      ift, ilen
  endop

  opcode BufFiCtNd2, iii, Sjjpoo
Sfilenam, ichnL, ichnR, iftnumL, iftnumR, inorm xin 
ichnL     =         (ichnL == -1 ? 1 : ichnL) ;default for chnL = 1
ichnR     =         (ichnR == -1 ? 2 : ichnR) ;default for chnR = 2
igen      =         (inorm == 0 ? -1 : 1)
ifttmpL   ftgen     0, 0, 0, igen, Sfilenam, 0, 0, ichnL
ifttmpR   ftgen     0, 0, 0, igen, Sfilenam, 0, 0, ichnR
ilen      tableng   ifttmpL
iftL      ftgen     iftnumL, 0, -ilen, -2, 0
iftR      ftgen     iftnumR, 0, -ilen, -2, 0
          vcopy_i   iftL, ifttmpL, ilen
          vcopy_i   iftR, ifttmpR, ilen
          ftfree    ifttmpL, 0
          ftfree    ifttmpR, 0
          xout      iftL, iftR, ilen
  endop

  opcode BufFiPl1, ak, ikkkop
ifn, kplay, kspeed, kvol, iskip, iwrap xin
;SAFETY CHECK IF THE TABLE IS REALLY GENERATED BY GEN01
if ftsr(ifn) == 0 then
 prints    "ERROR!\n FUNCTION TABLE %d HAS NO SAMPLE RATE VALUE (NOT GENERATED BY GEN01?)\n", ifn
 prints    "PERFORMANCE HAS BEEN TURNED OF.\n"
 turnoff
endif
iftlen    =         ftlen(ifn)/ftsr(ifn)
kcps      =         kspeed / iftlen
iphs      =         iskip / iftlen
kfin      init      0
;CALCULATIONS ONLY REQUIRED FOR WRAP=0
if iwrap == 0 then
kndx      phasor    kcps, iphs
kfirst    init      1 ;don't check condition below at the first k-cycle (always true)
kprevndx  init      0
 ;end of table check:
  ;for positive speed, check if this index is lower than the previous one
  if kfirst == 0 && kspeed > 0 && kndx < kprevndx then 
kfin      =         1
  else
 ;for negative speed, check if this index is higher than the previous one
kprevndx  =         (kprevndx == iphs ? 1 : kprevndx) 
   if kfirst == 0 && kspeed < 0 && kndx > kprevndx then
kfin      =         1
   endif
kfirst    =         0 ;end of first cycle in wrap = 0
  endif
kprevndx  =         kndx ;next previous is this index
endif
;READING THE SOUND WITH POSCIL3
if kplay == 1 && kfin == 0 then
asig      poscil3   kvol, kcps, ifn, iphs
else
asig      =         0
endif
          xout      asig, kfin
  endop

  opcode BufFiPl2, aak, iikkkop
ifnL, ifnR, kplay, kspeed, kvol, iskip, iwrap xin
aL, kfin  BufFiPl1  ifnL, kplay, kspeed, kvol, iskip, iwrap
aR, kfin  BufFiPl1  ifnR, kplay, kspeed, kvol, iskip, iwrap
          xout      aL, aR, kfin
  endop

  opcode BufFiPl4, aaaak, iiiikkkop
ifn1, ifn2, ifn3, ifn4, kplay, kspeed, kvol, iskip, iwrap xin
a1, kfin  BufFiPl1  ifn1, kplay, kspeed, kvol, iskip, iwrap
a2, kfin  BufFiPl1  ifn2, kplay, kspeed, kvol, iskip, iwrap
a3, kfin  BufFiPl1  ifn3, kplay, kspeed, kvol, iskip, iwrap
a4, kfin  BufFiPl1  ifn4, kplay, kspeed, kvol, iskip, iwrap
          xout      a1, a2, a3, a4, kfin
  endop

  opcode BufFiPl8, aaaaaaaak, iiiiiiiikkkop
ifn1, ifn2, ifn3, ifn4, ifn5, ifn6, ifn7, ifn8, kplay, kspeed, kvol, iskip, iwrap xin
a1, kfin  BufFiPl1  ifn1, kplay, kspeed, kvol, iskip, iwrap
a2, kfin  BufFiPl1  ifn2, kplay, kspeed, kvol, iskip, iwrap
a3, kfin  BufFiPl1  ifn3, kplay, kspeed, kvol, iskip, iwrap
a4, kfin  BufFiPl1  ifn4, kplay, kspeed, kvol, iskip, iwrap
a5, kfin  BufFiPl1  ifn5, kplay, kspeed, kvol, iskip, iwrap
a6, kfin  BufFiPl1  ifn6, kplay, kspeed, kvol, iskip, iwrap
a7, kfin  BufFiPl1  ifn7, kplay, kspeed, kvol, iskip, iwrap
a8, kfin  BufFiPl1  ifn8, kplay, kspeed, kvol, iskip, iwrap
          xout      a1, a2, a3, a4, a5, a6, a7, a8, kfin
  endop

  opcode BufCt1, i, io
ilen, inum xin
ift        ftgen     inum, 0, -(ilen*sr), 2, 0
           xout      ift
  endop

  opcode BufCt2, ii, ioo
ilen, inumL, inumR xin 
iftL       ftgen     inumL, 0, -(ilen*sr), 2, 0
iftR       ftgen     inumR, 0, -(ilen*sr), 2, 0
           xout      iftL, iftR
  endop

  opcode BufPlay1, ak, ikkkkkk
ift, kplay, kspeed, kvol, kstart, kend, kwrap xin
;CALCULATE BASIC VALUES
kfin       init       0
iftlen     =          ftlen(ift)/sr ;ftlength in seconds
kend       =          (kend == 0 ? iftlen : kend) ;kend=0 means end of table
kstart01   =          kstart/iftlen ;start in 0-1 range
kend01     =          kend/iftlen ;end in 0-1 range
kfqbas     =          (1/iftlen) * kspeed ;basic phasor frequency
;DIFFERENT BEHAVIOUR DEPENDING ON WRAP:
if kplay == 1 && kfin == 0 then
 ;1. STOP AT START- OR ENDPOINT IF NO WRAPPING REQUIRED (kwrap=0)
 if kwrap == 0 then
kfqrel     =          kfqbas / (kend01-kstart01) ;phasor freq so that 0-1 values match distance start-end
andxrel    phasor     kfqrel ;index 0-1 for distance start-end
andx       =          andxrel * (kend01-kstart01) + (kstart01) ;final index for reading the table (0-1)
kfirst     init       1 ;don't check condition below at the first k-cycle (always true)
kndx       downsamp   andx
kprevndx   init       0
 ;end of table check:
  ;for positive speed, check if this index is lower than the previous one
  if kfirst == 0 && kspeed > 0 && kndx < kprevndx then
kfin       =          1
 ;for negative speed, check if this index is higher than the previous one
           else
kprevndx   =          (kprevndx == kstart01 ? kend01 : kprevndx)
   if kfirst == 0 && kspeed < 0 && kndx > kprevndx then
kfin       =          1
   endif
kfirst     =          0 ;end of first cycle in wrap = 0
  endif
 ;sound out if end of table has not yet reached
asig       table3     andx, ift, 1
kprevndx   =          kndx ;next previous is this index
 ;2. WRAP BETWEEN START AND END (kwrap=1)
 elseif kwrap == 1 then
kfqrel     =          kfqbas / (kend01-kstart01) ;same as for kwarp=0
andxrel    phasor     kfqrel
andx       =          andxrel * (kend01-kstart01) + (kstart01)
asig       table3     andx, ift, 1 ;sound out
 ;3. START AT kstart BUT WRAP BETWEEN 0 AND END (kwrap=2)
 elseif kwrap == 2 then
kw2first   init       1
  if kw2first == 1 then ;at first k-cycle:
           reinit     wrap3phs ;reinitialize for getting the correct start phase
kw2first   =          0
  endif
kfqrel     =          kfqbas / kend01 ;phasor freq so that 0-1 values match distance start-end
wrap3phs:
andxrel    phasor     kfqrel, i(kstart01) ;index 0-1 for distance start-end
           rireturn   ;end of reinitialization
andx       =          andxrel * kend01 ;final index for reading the table
asig       table3     andx, ift, 1 ;sound out
 ;4. WRAP BETWEEN kstart AND END OF TABLE(kwrap=3)
 elseif kwrap == 3 then
kfqrel     =          kfqbas / (1-kstart01) ;phasor freq so that 0-1 values match distance start-end
andxrel    phasor     kfqrel ;index 0-1 for distance start-end
andx       =          andxrel * (1-kstart01) + kstart01 ;final index for reading the table
asig       table3     andx, ift, 1
 endif
           else       ;if either not started or finished at wrap=0
asig       =          0 ;don't produce any sound
endif
           xout       asig*kvol, kfin
  endop

  opcode BufPlay2, aak, iikkkkkk
iftL, iftR, kplay, kspeed, kvol, kstart, kend, kwrap xin  
aL, kfin	BufPlay1	iftL, kplay, kspeed, kvol, kstart, kend, kwrap
aR, kfin	BufPlay1	iftR, kplay, kspeed, kvol, kstart, kend, kwrap
		xout		aL, aR, kfin
  endop

  opcode BufRec1, k, aikkkk
ain, ift, krec, kstart, kend, kwrap xin
		setksmps	1
kendsmps	=		kend*sr ;end point in samples
kendsmps	=		(kendsmps == 0 || kendsmps > ftlen(ift) ? ftlen(ift) : kendsmps)
kfinished	=		0
knew		changed	krec ;1 if record just started
 if krec == 1 then
  if knew == 1 then
kndx		=		kstart * sr - 1 ;first index to write minus one
  endif
  if kndx >= kendsmps-1 && kwrap == 1 then
kndx		=		-1
  endif
  if kndx < kendsmps-1 then
kndx		=		kndx + 1
andx		=		kndx
		tabw		ain, andx, ift
  else
kfinished	=		1
  endif
 endif
 		xout		kfinished
  endop

  opcode BufRec2, k, aaiikkkk
ainL, ainR, iftL, iftR, krec, kstart, kend, kwrap xin
kfinished	BufRec1	ainL, iftL, krec, kstart, kend, kwrap
kfinished	BufRec1	ainR, iftR, krec, kstart, kend, kwrap
 		xout		kfinished
  endop

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

  opcode StrSum, i, S
Sin xin 
iPos, iSum init 0
while iPos < strlen(Sin) do
 iSum+= strchar(Sin, iPos)
 iPos += 1
od
   xout iSum
  endop

  opcode StrNumP, i, S
Str        xin
ip         =          1; start at yes and falsify
ilen       strlen     Str
 if ilen == 0 then
ip         =          0
           igoto      end
 endif
ifirst     strchar    Str, 0
 if ifirst == 45 then; a "-" is just allowed as first character
Str        strsub     Str, 1, -1
ilen       =          ilen-1
 endif
indx       =          0
inpnts     =          0; how many points have there been
loop:
iascii     strchar    Str, indx; 48-57
 if iascii < 48 || iascii > 57 then; if not 0-9
  if iascii == 46 && inpnts == 0 then; if not the first point
inpnts     =          1
           else
ip         =          0
  endif
 endif
           loop_lt    indx, 1, ilen, loop
end:       xout       ip
  endop

opcode StrayElCnt, i, Sjjjj
  Sin, iElOpn, iElCls, iSep1, iSep2 xin
  iElOpn = (iElOpn == -1 ? 91 : iElOpn) ; Defaults to [
  iElCls = (iElCls == -1 ? 93 : iElCls) ; Defaults to ]
  iSep1  = (iSep1  == -1 ? 32 : iSep1)  ; Defaults to Whitespace
  iSep2  = (iSep2  == -1 ? 44 : iSep2)  ; Defaults to Comma

  SElOpen   sprintf    "%c", iElOpn ; (default)'[' Symbol
  SElClose  sprintf    "%c", iElCls ; (default) ']' Symbol
  Sep1      sprintf    "%c", iSep1  ; (default) Whitespace
  Sep2      sprintf    "%c", iSep2  ; (default) ',' Comma (optional)

  ilen       strlen     Sin
  ipcount   = 0
  insidearr = 0
  ipos      = 0
  iOnSep    = 1
  loop:
    Schar  strsub Sin, ipos, ipos+1
    icompElOpen  strcmp Schar, SElOpen ;is in an array?
    icompElClose strcmp Schar, SElClose ;array ends?
    icompSep1    strcmp Schar, Sep1    ;is a space?
    icompSep2    strcmp Schar, Sep2    ;is a comma?

    if icompElOpen == 0 then 
      insidearr = 1
      iOnSep = 0
      ipcount += 1
    endif
    if icompElClose == 0 then
      insidearr = 0
      iOnSep = 0
    endif
    if ((icompSep1 == 0 ) || (icompSep2 == 0 )) && (insidearr == 0) then
      iOnSep = 1
    elseif iOnSep == 1 then
      ipcount += 1
      iOnSep = 0
    endif
    loop_lt ipos, 1, ilen, loop
    xout ipcount
endop

  opcode StrayLen, i, Sjj
Stray, isepA, isepB xin
 ;seperators
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
 ;initialize
ilen      strlen    Stray
icount    =         0; number of elements
iwarsep   =         1
indx      =         0
 if ilen == 0 igoto end ;don't go into the loop if String is empty
loop:
Snext     strsub    Stray, indx, indx+1; next sign
isep1p    strcmp    Snext, Sep1; returns 0 if Snext is sep1
isep2p    strcmp    Snext, Sep2; 0 if Snext is sep2
 if isep1p == 0 || isep2p == 0 then; if sep1 or sep2
iwarsep   =         1; tell the log so
 else 				; if not 
  if iwarsep == 1 then	; and has been sep1 or sep2 before
icount    =         icount + 1; increase counter
iwarsep   =         0; and tell you are ot sep1 nor sep2 
  endif 
 endif	
          loop_lt   indx, 1, ilen, loop 
end:      xout      icount
  endop 
  opcode StrayLen, k, Sjj
Stray, isepA, isepB xin
 ;define seperators
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
 ;initialize
klen      strlenk   Stray
kcount    =         0; number of elements
kwarsep   =         1
kndx      =         0
 if klen == 0 kgoto end ;don't go into the loop if String is empty
loop:
Snext     strsubk   Stray, kndx, kndx+1; next sign
ksep1p    strcmpk   Snext, Sep1; returns 0 if Snext is sep1
ksep2p    strcmpk   Snext, Sep2; 0 if Snext is sep2
 if ksep1p == 0 || ksep2p == 0 then; if sep1 or sep2
kwarsep   =         1; tell the log so
 else 				; if not 
  if kwarsep == 1 then	; and has been sep1 or sep2 before
kcount    =         kcount + 1; increase counter
kwarsep   =         0; and tell you are not sep1 nor sep2 
  endif 
 endif	
          loop_lt   kndx, 1, klen, loop 
end:      xout      kcount
  endop 

  opcode StrayGetNum, i, Sijj
;returns ielindex in Stray. this element must be a number
Stray, ielindx, isepA, isepB xin
;;DEFINE THE SEPERATORS
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
;;INITIALIZE SOME PARAMETERS
ilen      strlen    Stray
istartsel =         -1; startindex for searched element
iendsel   =         -1; endindex for searched element
iel       =         0; actual number of element while searching
iwarleer  =         1
indx      =         0
 if ilen == 0 igoto end ;don't go into the loop if Stray is empty
loop:
Snext     strsub    Stray, indx, indx+1; next sign
isep1p    strcmp    Snext, Sep1; returns 0 if Snext is sep1
isep2p    strcmp    Snext, Sep2; 0 if Snext is sep2
;;NEXT SIGN IS NOT SEP1 NOR SEP2
if isep1p != 0 && isep2p != 0 then
 if iwarleer == 1 then; first character after a seperator 
  if iel == ielindx then; if searched element index
istartsel =         indx; set it
iwarleer  =         0
  else 			;if not searched element index
iel       =         iel+1; increase it
iwarleer  =         0; log that it's not a seperator 
  endif 
 endif 
;;NEXT SIGN IS SEP1 OR SEP2
else 
 if istartsel > -1 then; if this is first selector after searched element
iendsel   =         indx; set iendsel
          igoto     end ;break
 else	
iwarleer  =         1
 endif 
endif
          loop_lt   indx, 1, ilen, loop 
end: 		
Snum      strsub    Stray, istartsel, iendsel
if strcmp(Snum,"") == 0 then
 Snum     =         "nan"
endif
inum      strtod    Snum
          xout      inum
  endop 
  opcode StrayGetNum, k, Skjj
;returns kelindex in Stray. this element must be a number
Str, kelindx, isepA, isepB xin
;;DEFINE THE SEPERATORS
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
;;INITIALIZE SOME PARAMETERS
Stray     strcpyk   Str ;make sure to update in performance
klen      strlenk   Stray
kstartsel =         -1; startindex for searched element
kendsel   =         -1; endindex for searched element
kel       =         0; actual number of element while searching
kwarleer  =         1
kndx      =         0
 if klen == 0 kgoto end ;don't go into the loop if Stray is empty
loop:
Snext     strsubk   Stray, kndx, kndx+1; next sign
ksep1p    strcmpk   Snext, Sep1; returns 0 if Snext is sep1
ksep2p    strcmpk   Snext, Sep2; 0 if Snext is sep2
;;NEXT SIGN IS NOT SEP1 NOR SEP2
if ksep1p != 0 && ksep2p != 0 then
 if kwarleer == 1 then; first character after a seperator 
  if kel == kelindx then; if searched element index
kstartsel =         kndx; set it
kwarleer  =         0
  else 			;if not searched element index
kel       =         kel+1; increase it
kwarleer  =         0; log that it's not a seperator 
  endif 
 endif 
;;NEXT SIGN IS SEP1 OR SEP2
else 
 if kstartsel > -1 then; if this is first selector after searched element
kendsel   =         kndx; set iendsel
          kgoto     end ;break
 else	
kwarleer  =         1
 endif 
endif
          loop_lt   kndx, 1, klen, loop 
end: 		
Snum      strsubk   Stray, kstartsel, kendsel
Snum      init      "nan"
knum      strtodk   Snum
          xout      knum
  endop 

opcode EvtPtrnz, kkk,iiS
  ; Give it a string with numbers and it outputs trigger 1 or no-trigger 0
  ; Made by Hlödver Sigurdsson 2016
  iTimeSignature, iBPM, Spattern xin
  kOffTrigger init 0
  kPatLen StrayLen Spattern
  kPatMax StrayGetNum Spattern, kPatLen - 1
  krate_counter timek
  iOneSecond =  kr
  iBeatsPerSecond = iBPM / 60
  iTicksPerBeat = iOneSecond / iBeatsPerSecond
  if iTimeSignature != 0 then
    kBeatCounts = (ceil(kPatMax) >= iTimeSignature ? ceil((kPatMax+0.00001)/iTimeSignature)*iTimeSignature : iTimeSignature)
  endif
  kPatternLength = (iTimeSignature < 1 ? ceil(kPatMax+0.00001) * iTicksPerBeat : kBeatCounts * iTicksPerBeat)
  kIndex init 0
  kNextEvent StrayGetNum Spattern, kIndex % kPatLen
  kLastEvent StrayGetNum Spattern, (kPatLen - 1)

  if int(krate_counter % kPatternLength) == int(iTicksPerBeat * kLastEvent) then
    kOffTrigger = 1
  else
    kOffTrigger = 0
  endif
  if int(krate_counter % kPatternLength) == int(iTicksPerBeat * kNextEvent) then
    kTrigger = 1
    kIndex += 1
  else
    kTrigger = 0
  endif
  xout kTrigger, kOffTrigger, kIndex
endop

opcode EvtS2P, SS, SSSii
 ; String to Pattern, to be used with EvtPtrnz and EvtLvLp opcodes
 ; Made by Hlödver Sigurdsson 2016
SPatName, SPar, SPattern, iTimeSignature, iBPM xin
SPatNameState strcat SPatName, "_s"
SInits init ""
SInitsDef init ""
SInitsLen init ""
SInitsLenDef init ""
SPToStringNum init ""
SPToStringArr init ""
SInstr init ""
Schedule init ""
SAlways init ""
State init ""
Sep1		sprintf 	"%c", 32 ; Space
Sep2		sprintf    "%c", 9  ; Tab
SarrOpen   sprintf    "%c", 91 ; '[' Symbol
SarrClose  sprintf    "%c", 93 ; ']' Symbol
indx = 0
iarrndx = 0
iSpaceCount init 0
iMoreThanOneSpace = 0
iInstr = 1 ;Pattern begins with instrument name/number, 0 means strings are passed to parameter fields
iInsideArray = 0
iStrLen strlen SPar
SFirstLetter strsub SPar, 0, 1
iNumberedInstrument StrNumP SFirstLetter
loop:
  Snext 	strsub		SPar, indx, indx+1
  isep1p	strcmp		Snext, Sep1
  isep2p	strcmp		Snext, Sep2
  iArrOpen strcmp   Snext, SarrOpen
  iArrClose strcmp  Snext, SarrClose
if isep1p != 0 && isep2p != 0 then
  if iInsideArray == 0 &&  iInstr == 1 then
  SInstr strcat SInstr, Snext
  elseif iArrOpen == 0 && iInsideArray == 0 then ;Here the array opens
  iInsideArray = 1
  elseif iArrClose == 0 && iInsideArray == 1 then ;Here the array closes
  iInsideArray = 0
  iarrndx = 0
  SInits strcat SInits, "\n"
  ;SInitsLen strcat SInitsLen, "\"\n"
  elseif iInstr == 0 && iInsideArray == 1 then
    if iarrndx > 0 && iMoreThanOneSpace == 0 then ;In array, commas preceed all numbers 
      SInitsDef strcat SInitsDef, Snext           ;except for first element (fillarray)
      SInits strcat SInits, SInitsDef
      SInitsLen strcat SInitsLen, Snext
      SInitsLenDef = ""
      SInitsDef = ""
      iarrndx += 1
    elseif iarrndx > 0 && iMoreThanOneSpace == 1 then ;If this is multidigit number in array
      SInitsDef strcat ", ", Snext
      SInits strcat SInits, SInitsDef
      SInitsLen strcat SInitsLen, " "
      SInitsLen strcat SInitsLen, Snext
      SInitsLenDef = ""
      SInitsDef = ""
      iarrndx += 1
    else
      SInitsLen strcat SInitsLen, Snext
      SInitsLenDef = ""
      SInitsDef strcat SInitsDef, Snext
      SInits strcat SInits, SInitsDef
      SInitsDef = ""
      iarrndx += 1
   endif
  else
    SInitsLen strcat SInitsLen, Snext
    SInitsLenDef = "" 
    SInitsDef strcat SInitsDef, Snext
    SInits strcat SInits, SInitsDef
    SInitsDef = ""
  endif
 iMoreThanOneSpace = 0 ;Each time an alphabetical letter or number arrives, space locker is returned to 0
 else
   iInstr = 0 ;Safe way to make sure that defenition of instrument quits after first space
   if (iInsideArray == 0) && (iMoreThanOneSpace == 0)  then
     SInits strcat SInits, "\n"
     if iSpaceCount > 0 then
     SInitsLen strcat SInitsLen,"\"\n"
     endif
     iSpaceCount += 1
   endif
   if iMoreThanOneSpace == 0 then
    if iarrndx == 0 && (iStrLen-indx) != 1 then
      ;SPToString2a sprintf "%i[kIndex %% gi", (iSpaceCount+2) ;Len%i]
      SPToString sprintf ", gip%s%i[kIndex %% gip%sLen%i]",SPatName,(iSpaceCount+2), SPatName, (iSpaceCount+2)
      ;SPToString2b strcat SPToString2a,"Len%i]"
      ;SPToString2 sprintf SPToString2b, (iSpaceCount+2), (iSpaceCount+2)
      ;SCurrentPar strcat ", gip", SPatName
      ;SCurrentPar strcat SCurrentPar, SPToString
      Schedule strcat Schedule, SPToString
      SPToStringNum sprintf "%i", (iSpaceCount + 2)
      SPToStringArr strcat "gip", SPatName
      SPToStringArr strcat SPToStringArr, SPToStringNum
      SPToStringArr2 strcat "gip", SPatName
      SPToStringArr2 strcat SPToStringArr2, "Len"
      SPToStringArr2 strcat SPToStringArr2, SPToStringNum
      SInitsLenDef  strcat SPToStringArr2," StrayLen \""
      ;SInitsLenDef  strcat SInitsLenDef, SPToStringArr
      SInitsLen strcat SInitsLen, SInitsLenDef
      ;SInitsLen strcat SInitsLen, 
      ;SInitsLen strcat SInitsLen, "\n"
      SInitsDef    strcat SPToStringArr, "[] fillarray "
      iMoreThanOneSpace = 1
       else
      iMoreThanOneSpace = 1
     endif
   endif
endif
loop_lt	 indx, 1, iStrLen, loop
;Here comes Arguments for Schedkwhen
if iNumberedInstrument == 1 then    
  SInstrCat strcat "iInstr = ", SInstr ;If instrument name is number
  SInstrCat strcat SInstr, "\n"
  ;SInstr strcat SInstr, "\n"
  Schedule strcat "schedkwhen kTrigger, 0, 0, iInstr, 0 ", Schedule
elseif iNumberedInstrument == 0 then
  SInstrCat strcat "SInstr = \"", SInstr ;If instrument name is string
  SInstrCat strcat SInstrCat, "\"\n"
  Schedule strcat "\nschedkwhen kTrigger, 0, 0, SInstr, 0", Schedule
endif
Schedule strcat "\n;;Here comes the scheduler", Schedule ;;Useless but fixes a bug.
SInits strcat SInits, "\n"
Schedule strcat Schedule, "\n"
SPatName1 strcat "\ninstr ", SPatName
SPatName2 strcat  "\ninstr ",SPatNameState
SPatName1 strcat SPatName1, " \n"
SPatName3 strcat "\nSPatName = \"",SPatName
SPatName3 strcat SPatName3, "\"\n"
SPatternizerParam sprintf "giTimeSignature%s = %i\ngiBPM%s = %i\ngSpattern%s = \"%s\"\n", SPatName, iTimeSignature,SPatName, iBPM,SPatName, SPattern
SPatternizer sprintf "kTrigger, kOffTrigger, kIndex EvtPtrnz giTimeSignature%s, giBPM%s, gSpattern%s", SPatName,SPatName,SPatName
SAlways strcat SAlways, SPatternizer
SAlways strcat SAlways, Schedule
SAlways strcat SAlways,"\nif kOffTrigger == 1 then \n turnoff \n endif \n endin \n"
SAlways strcat SInstrCat, SAlways
SAlways strcat SPatName1, SAlways
State = "\"\nkActive active SPatName\nif kActive < 1 then\nschedkwhen 1, 0, 1, SPatName, 0, 100000\nendif\nendin\n;"
State strcat SInitsLen, State
State strcat SInits, State
State strcat SPatternizerParam, State
State strcat SPatName3, State
State strcat SPatName2, State
xout SAlways, State
;prints SAlways
;prints State
endop

opcode EvtLvLp, 0, SSSi[][]oj
SPatName, SPattern, SParameters, iTrackStates[][], iTimeSignature, iBPM xin
  SPatName2 strcat SPatName, "_s"
  iTurnOff strcmp "", SPattern
  if iTurnOff == 0 goto donothing
  if iBPM <= 0 then
    iBPM = 120
  endif
  if iTimeSignature <= -1 then
    iTimeSignature = 4
  endif
  iActive active SPatName
  iActive_state active SPatName2
  iTrackID StrSum SPatName
  iPatSum  StrSum SPattern
  iParSum  StrSum SParameters
  iParCount StrayElCnt SParameters
if iTrackStates[iTrackID][0] != iPatSum  || \
   iTrackStates[iTrackID][1] != iParSum  || \
   iTrackStates[iTrackID][2] != iTimeSignature || \
   iTrackStates[iTrackID][3] != iBPM then
  SConsoleLog sprintf "Pattern: %s was evaluated!\n", SPatName
  prints SConsoleLog
  SAlways, State EvtS2P SPatName, SParameters, SPattern, iTimeSignature, iBPM
  iFailTest1 compilestr State
  if iFailTest1 != 0 then
    SConsoleLogFailEval sprintf "ERROR: FAILED TO EVALUATE PATTERN %s\n", SPatName 
    prints SConsoleLogFailEval
  endif
  if (iActive < 1) || (iTrackStates[iTrackID][4] != iParCount) then
    iFailTest2 compilestr SAlways
    if iFailTest2 != 0 then
      SConsoleLogStartFail sprintf "ERROR: FAILED TO START THE PATTERN %s\n", SPatName
      prints SConsoleLogStartFail
    endif
  endif
endif
  iTrackStates[iTrackID][0] = iPatSum
  iTrackStates[iTrackID][1] = iParSum
  iTrackStates[iTrackID][2] = iTimeSignature
  iTrackStates[iTrackID][3] = iBPM
  iTrackStates[iTrackID][4] = iParCount
  schedkwhen 1, 1, 1, SPatName2, 0, 1
donothing:
endop

	opcode GrPtkSmpA, a, iikkkkkkkiii
ifiltab, iskip, kspeed, kgrainamp, kgrainrate, kgrainsize, kcent, kposrand, kcentrand, icosintab, idisttab, iwin xin

/*length of input file*/
itablen    tableng    ifiltab
ifilsr     =          ftsr(ifiltab)
ifildur    =          itablen / ifilsr
/*amplitude*/
kamp       =          kgrainamp * 0dbfs
/*transposition*/
kcentrand  rand       kcentrand; random transposition
iorig      =          1 / ifildur; original pitch
kwavfreq   =          iorig * cent(kcent + kcentrand)
/*pointer*/
istartpos  =          iskip / ifildur; start 0-1
afilposphas phasor    kspeed / ifildur, istartpos
arndpos    linrand    kposrand; random offset in phase values
asamplepos =          afilposphas + arndpos; resulting phase values (0-1)
/* other parameters */
imax_grains =         1000; maximum number of grains per k-period
idist      =          1; scattered distribution
async      =          0; no sync input
awavfm     =          0; no audio input for fm

aout       partikkel  kgrainrate, idist, idisttab, async, 1, iwin, \
-1, -1, 0, 0, kgrainsize, kamp, -1, \
kwavfreq, 0, -1, -1, awavfm, \
-1, -1, icosintab, kgrainrate, 1, \
1, -1, 0, ifiltab, ifiltab, ifiltab, ifiltab, \
-1, asamplepos, asamplepos, asamplepos, asamplepos, \
1, 1, 1, 1, imax_grains

           xout       aout
	endop

  opcode GrPtkSmpB, a, iakkkkkkiii
ifiltab, apnter, kgrainamp, kgrainrate, kgrainsize, kcent, kposrand, kcentrand, icosintab, idisttab, iwin xin

/*amplitude*/
kamp       =          kgrainamp * 0dbfs
/*transposition*/
kcentrand  rand       kcentrand; random transposition
iorig      =          1 / (ftlen(ifiltab)/sr); original pitch
kwavfreq   =          iorig * cent(kcent + kcentrand)
/* other parameters */
imax_grains =         1000; maximum number of grains per k-period
idist      =          1; scattered distribution
async      =          0; no sync input
awavfm     =          0; no audio input for fm

aout       partikkel  kgrainrate, idist, idisttab, async, 1, iwin, \
-1, -1, 0, 0, kgrainsize, kamp, -1, \
kwavfreq, 0, -1, -1, awavfm, \
-1, -1, icosintab, kgrainrate, 1, \
1, -1, 0, ifiltab, ifiltab, ifiltab, ifiltab, \
-1, apnter, apnter, apnter, apnter, \
1, 1, 1, 1, imax_grains
           xout       aout
  endop

  opcode GrPtkWrp, a, aiPOOOOP

aPos, iFilTab, kAmp, kCent, kPosRnd, kGrainRate, kGrainSize, kDistribution xin

;build tables for window shape and distribution
iWinTab    ftgentmp   0, 0, 4096, 20, 9, 1
iDistTab   ftgentmp   0, 0, 32768, 7, 0, 32768, 1

;resolve default parameters for grain size and grain rate
kGrainRate =          (kGrainRate == 0 ? 200 : kGrainRate)
kGrainSize =          (kGrainSize == 0 ? 100 : kGrainSize)

;transform position input from seconds to phase values (0-1)
iFilDur    =          ftlen(iFilTab)/ftsr(iFilTab)
aPos       =          aPos/iFilDur
kPosRnd    =          kPosRnd/1000/iFilDur

;calculate random deviations of the position for the four streams of grains
aRndPos1   random     0, kPosRnd
aRndPos2   random     0, kPosRnd
aRndPos3   random     0, kPosRnd
aRndPos4   random     0, kPosRnd
;add random deviation to the time pointer and make sure not to wrap around
aPos1      mirror     aPos+aRndPos1, 0, 1
aPos2      mirror     aPos+aRndPos2, 0, 1
aPos3      mirror     aPos+aRndPos3, 0, 1
aPos4      mirror     aPos+aRndPos4, 0, 1

;transposition
iOrigPitch =          1 / iFilDur; original pitch
kPitch     =          iOrigPitch * cent(kCent)

;other parameters
aSync      =          0; no sync input
aWavFM     =          0; no audio input for fm

aOut       partikkel  kGrainRate, kDistribution, iDistTab, aSync, 1, iWinTab, -1, -1, 0, 0, kGrainSize, kAmp/10, -1, kPitch, 0, -1, -1, aWavFM, -1, -1, iWinTab, kGrainRate, 1, 1, -1, 0, iFilTab, iFilTab, iFilTab, iFilTab, -1, aPos1, aPos2, aPos3, aPos4, 1, 1, 1, 1, 1000
           xout       aOut
  endop

  opcode Linek, kk, kkkk
;performs a linear interpolation from kthis to knext in ktim whenever ktrig is 1
kthis, knext, ktim, ktrig xin 
kstat     init      0 ;status at the begin
kfin      init      0
knprd     =         round(ktim*kr) ;number of k-cycles for ktim
ktimek    timek
 if ktrig == 1 then ;freeze values 
kthistim  =         ktimek 
kstrt     =         kthis
kend      =         knext
kstat     =         1
 endif
 if kstat == 0 then
kval      =         kthis
 elseif kstat == 1 then
kcount    =         ktimek-kthistim ;number of k-cycles in the time needed
kinc      =         (kend-kstrt) / knprd ;increment
kval      =         kstrt + kcount * kinc 
  if ktimek == kthistim+knprd then ;if target reached
kfin      =         1 ;tell it
kstat     =         2 ;set status
  else
kfin      =         0
  endif
 elseif kstat == 2 then
kval      =         kval ;stay at kval if no new trigger
kfin      =         0
 endif
          xout      kval, kfin ;value and 1 if target reached
  endop

  opcode F2M, i, io
iFq, iRnd xin
iNotNum = 12 * (log(iFq/220)/log(2)) + 57
iNotNum = (iRnd == 1 ? round(iNotNum) : iNotNum)
xout iNotNum
  endop

  opcode StripL, S, S
  ;strips all tabs or spaces at the left from an input string
Source     xin
Sin        strcpy     Source
iLen       strlen     Sin
again:
Sel        strsub     Sin, 0, 1
iSpace     strcmp     Sel, " "
iTab       strcmp     Sel, "	"
 ;if space or tab, remove it and go back if not end of string
if iSpace == 0 || iTab == 0 then
Sin        strsub     Sin, 1
iLen       =          iLen-1
 if iLen != 0 igoto again
endif
           xout       Sin
  endop

  opcode ExtrOrc, S, S
  ;extracts the orc part of a csd Sfile
Sfile      xin
iRead      init       0
Sorc       init       ""
read:
Sline, iLineNum readfi Sfile
 ;remove left side spaces or tabs to check tags
Slinestrp  StripL     Sline
 ;check for CsInstruments start tag
iIsStart   strindex   Slinestrp, "<CsInstruments>"
iIsEnd     strindex   Slinestrp, "</CsInstruments>"
 ;set toggle to read
 if iIsStart == 0 then
iRead      =          1
 elseif iIsEnd == 0 then
iRead      =          0
 endif
 ;collect lines inside the tags
if iRead == 1 && iIsStart != 0 then
Sorc       strcat     Sorc, Sline
endif
 ;go back if not eof or end tag
if iLineNum != -1 && iIsEnd != 0 igoto read
           xout       Sorc
  endop

opcode OnDtct, kk, aOOOOo

 aIn, kDbDiff, kMinTim, kMinDb, kDelTim, iRmsFreq xin
 
 //resolving defaults
 kDbDiff = (kDbDiff==0) ? 10 : kDbDiff
 kMinTim = (kMinTim==0) ? 0.1 : kMinTim
 kMinDb = (kMinDb==0) ? -50 : kMinDb
 kDelTim = (kDelTim==0) ? 0.025 : kDelTim
 iRmsFreq = (iRmsFreq==0) ? 50 : iRmsFreq
 
 kPrevDetect init 0.1
 iMaxDelTim init 0.5
 kOnset init 0

 kRms rms aIn,iRmsFreq
 kDb = dbamp(kRms)
 kDelRms vdelayk kDb, kDelTim, iMaxDelTim
 
 if (kDb>kDelRms+kDbDiff) && (kDb>kMinDb) && (kPrevDetect>kMinTim) then
  kOnset = 1
  kPrevDetect = 0
 else
  kOnset = 0
 endif

 kPrevDetect += 1/kr
 
 xout kOnset, kDb

endop

  opcode NmCntr, k, kkPo
kup, kdown, kstep, istart xin
kcount    init      istart
kchange   changed   kup, kdown
if kchange == 1 then
 if kup == 1 then
kcount    =         kcount+kstep
 elseif kdown == 1 then	
kcount    =         kcount-kstep
 endif
endif
          xout      kcount
  endop

  opcode NmFrcLen, i, io
;returns the number of digits in the fractional part of inum (0=integer)
inum, ifracs xin
ifac      =         10^ifracs
if int(inum*ifac) == inum*ifac then
          igoto     end
else
ifracs    NmFrcLen   inum, ifracs+1
endif
end:      xout      ifracs
  endop

  opcode NmRndInt, i, ii
iMin, iMax xin
iRnd random iMin, iMax+.999999
xout int(iRnd)
  endop
  opcode NmRndInt, k, kk
kMin, kMax xin
kRnd random kMin, kMax+.999999
xout int(kRnd)
  endop

  opcode NmScl, i, iiiii
iVal, iInMin, iInMax, iOutMin, iOutMax xin
iValOut = (((iOutMax - iOutMin) / (iInMax - iInMin)) * (iVal - iInMin)) + iOutMin
xout iValOut
  endop
  opcode NmScl, k, kkkkk
kVal, kInMin, kInMax, kOutMin, kOutMax xin
kValOut = (((kOutMax - kOutMin) / (kInMax - kInMin)) * (kVal - kInMin)) + kOutMin
xout kValOut
  endop

opcode NmStpInc, i, iiii
 iValStart, iValEnd, iNumSteps, iThisStep xin
 iOut = ((iValEnd-iValStart) / iNumSteps) * iThisStep + iValStart
 xout iOut
endop
opcode NmStpInc, k, kkkk
 kValStart, kValEnd, kNumSteps, kThisStep xin
 kOut = ((kValEnd-kValStart) / kNumSteps) * kThisStep + kValStart
 xout kOut
endop

  opcode PhsTmPnt, a, kkkki
kloopstart, kloopend, kspeed, kdir, irefdur xin

kstart01   =          kloopstart/irefdur ;start in 0-1 range
kend01     =	        kloopend/irefdur ;end in 0-1 range
ifqbas     =	        1 / irefdur ;phasor frequency for the whole irefdur range
kfqrel     =          ifqbas / (kend01-kstart01) * kspeed ;phasor frequency for the selected section
andxrel    phasor     kfqrel*kdir ;phasor 0-1 
atimpt     =	        andxrel * (kloopend-kloopstart) + kloopstart ;adjusted to start and end

           xout       atimpt
  
  endop

  opcode PrtArr1i, 0, i[]ojjj
iArr[], istart, iend, iprec, ippr xin
iprint     init       0
ippr       =          (ippr == -1 ? 10 : ippr)
iend       =          (iend == -1 ? lenarray:i(iArr) : iend)
iprec      =          (iprec == -1 ? 3 : iprec)
indx       =          istart
Sformat    sprintf    "%%%d.%df, ", iprec+3, iprec
Sdump      sprintf    "%s", "["
loop:
Snew       sprintf    Sformat, iArr[indx]
Sdump      strcat     Sdump, Snew
imod       =          (indx+1-istart) % ippr
 if imod == 0 && indx != iend-1 then
           printf_i   "%s\n", iprint+1, Sdump
Sdump      strcpy     " "
 endif
iprint     =          iprint + 1
           loop_lt    indx, 1, iend, loop
ilen       strlen     Sdump
Slast      strsub     Sdump, 0, ilen-2
           printf_i   "%s]\n", iprint+1, Slast
  endop

  opcode PrtArr1k, 0, k[]POVVO
kArr[], ktrig, kstart, kend, kprec, kppr xin
kprint     init       0
kndx       init       0
if ktrig > 0 then
kppr       =          (kppr == 0 ? 10 : kppr)
kend       =          (kend == -1 || kend == .5 ? lenarray:k(kArr) : kend)
kprec      =          (kprec == -1 || kprec == .5 ? 3 : kprec)
kndx       =          kstart
Sformat    sprintfk   "%%%d.%df, ", kprec+3, kprec
Sdump      sprintfk   "%s", "["
loop:
Snew       sprintfk   Sformat, kArr[kndx]
Sdump      strcatk    Sdump, Snew
kmod       =          (kndx+1-kstart) % kppr
 if kmod == 0 && kndx != kend-1 then
           printf     "%s\n", kprint+1, Sdump
Sdump      strcpyk    " "
 endif
kprint     =          kprint + 1
           loop_lt    kndx, 1, kend, loop
klen       strlenk    Sdump
Slast      strsubk    Sdump, 0, klen-2
           printf     "%s]\n", kprint+1, Slast
endif
  endop

  opcode PrtArr1S, 0, S[]oj
SArr[], istart, iend xin
iend       =          (iend == -1 ? lenarray:i(SArr) : iend)
indx       =          istart
           printf_i   "%s", 1, "["
 until indx >= iend-1 do
           printf_i    "%s, ", 1, SArr[indx]
indx       +=         1
 enduntil
           printf_i   "%s]\n", 1, SArr[indx]
  endop

  opcode Prt_a, 0, aPO
aSig, kPeriod, kSpaces xin
kTim       timeinsts
kNextPeriod init      0
kPrevTim   init       0 
;perform printout if period has been reached
if kTim >= kPrevTim + kNextPeriod - ksmps/sr then
kIndx      =          0
Sformat    sprintfk   "%%%ds %%.6f: [", kSpaces + 5
Sout       sprintfk   Sformat, "Time:", kTim
;collect all values in a string
printloop:
kVal       vaget      kIndx, aSig
Sval       sprintfk   "%f, ", kVal
Sout       strcatk    Sout, Sval
           loop_lt    kIndx, 1, ksmps, printloop
;remove the last comma and close the bracket
kLen       strlenk    Sout
Scut       strsubk    Sout, 0, kLen-2
           printf     "%s]\n", kTim, Scut
;reset previous time and next period
kPrevTim   =          kTim      
kNextPeriod =         kPeriod
endif
  endop

  opcode PrtTb, 0, iojjo
ifn, istart, iend, iprec, ippr xin
ippr       =          (ippr == 0 ? 10 : ippr)
iend       =          (iend == -1 ? ftlen(ifn) : iend)
iprec      =          (iprec == -1 ? 3 : iprec)
indx       =          istart
Sformat    sprintf    "%%.%df, ", iprec
Sdump      sprintf    "%s", "["
loop:
ival       tab_i      indx, ifn
Snew       sprintf    Sformat, ival
Sdump      strcat     Sdump, Snew
imod       =          (indx+1-istart) % ippr
 if imod == 0 && indx != iend-1 then
           puts       Sdump, 1
Sdump      =          ""
 endif
           loop_lt    indx, 1, iend, loop
ilen       strlen     Sdump
Slast      strsub     Sdump, 0, ilen-2
           printf_i   "%s]\n", 1, Slast
  endop

  opcode PrtTbk, 0, iPOVVO
ifn, ktrig, kstart, kend, kprec, kppr xin
kprint     init       0
if ktrig > 0 then
kppr       =          (kppr == 0 ? 10 : kppr)
kend       =          (kend == -1 || kend == .5 ? ftlen(ifn) : kend)
kprec      =          (kprec == -1 || kprec == .5 ? 3 : kprec)
kndx       =          kstart
Sformat    sprintfk   "%%.%df, ", kprec
Sdump      sprintfk   "%s", "["
loop:
kval       tab        kndx, ifn
Snew       sprintfk   Sformat, kval
Sdump      strcatk    Sdump, Snew
kmod       =          (kndx+1-kstart) % kppr
 if kmod == 0 && kndx != kend-1 then
           printf     "%s\n", kprint+1, Sdump
Sdump      strcpyk    ""
 endif
kprint     =          kprint + 1
           loop_lt    kndx, 1, kend, loop
klen       strlenk    Sdump
Slast      strsubk    Sdump, 0, klen-2
           printf     "%s]\n", kprint+1, Slast
endif
  endop

  opcode PrtTbS, 0, iSojjo
;prints the content of a table in a simple way, with an additional string as 'introduction'
ifn, String, istart, iend, iprec, ippr xin; function table, first index to print, first index not to be printed (-1 =whole table), float precision while printing, String, parameters per row (maximum =  32)
ippr       =          (ippr == 0 ? 10 : ippr)
iend       =          (iend == -1 ? ftlen(ifn) : iend)
iprec      =          (iprec == -1 ? 3 : iprec)
indx       =          istart
Sformat    sprintf    "%%.%df, ", iprec
Sdump      sprintf    "%s[", String
loop:
ival       tab_i      indx, ifn
Snew       sprintf    Sformat, ival
Sdump      strcat     Sdump, Snew
imod       =          (indx+1-istart) % ippr
 if imod == 0 && indx != iend-1 then
           puts       Sdump, 1
Sdump      =          ""
 endif
           loop_lt    indx, 1, iend, loop
ilen       strlen     Sdump
Slast      strsub     Sdump, 0, ilen-2
           printf_i   "%s]\n", 1, Slast
  endop

  opcode PrtTbSk, 0, iSPOVVO
ifn, String, ktrig, kstart, kend, kprec, kppr xin
kprint     init       0
if ktrig > 0 then
kppr       =          (kppr == 0 ? 10 : kppr)
kend       =          (kend == -1 || kend == .5 ? ftlen(ifn) : kend)
kprec      =          (kprec == -1 || kprec == .5 ? 3 : kprec)
kndx       =          kstart
Sformat    sprintfk   "%%.%df, ", kprec
Sdump      sprintfk   "%s[", String
loop:
kval       tab        kndx, ifn
Snew       sprintfk   Sformat, kval
Sdump      strcatk    Sdump, Snew
kmod       =          (kndx+1-kstart) % kppr
 if kmod == 0 && kndx != kend-1 then
           printf     "%s\n", kprint+1, Sdump
Sdump      strcpyk    ""
 endif
kprint     =          kprint + 1
           loop_lt    kndx, 1, kend, loop
klen       strlenk    Sdump
Slast      strsubk    Sdump, 0, klen-2
           printf     "%s]\n", kprint+1, Slast
endif
  endop

  opcode SfPlay1, a, Skoo
Sfil, kspeed, iskip, iloop xin
ichn       filenchnls Sfil
if ichn == 1 then
aout       diskin2    Sfil, kspeed, iskip, iloop
           else
aout, ano  diskin2    Sfil, kspeed, iskip, iloop
endif
           xout       aout
  endop

  opcode SfPlay2, aa, Skoo
Sfil, kspeed, iskip, iloop xin
ichn       filenchnls Sfil
if ichn == 1 then
aL         diskin2    Sfil, kspeed, iskip, iloop
aR         =          aL
           else
aL, aR     diskin2    Sfil, kspeed, iskip, iloop
endif
           xout       aL, aR
  endop

  opcode StrayElMem, i, SSjj
;looks whether Stest is an element of Stray. returns the index of the element if found, and -1 if not.
Stray, Stest, isepA, isepB xin
;;DEFINE THE SEPERATORS
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
;;INITIALIZE SOME PARAMETERS
ilen      strlen    Stray
istartsel =         -1; startindex for searched element
iout      =         -1 ;default output
iel       =         -1; actual number of element while searching
iwarleer  =         1; is this the start of a new element
indx      =         0 ;character index
inewel    =         0 ;new element to find
;;LOOP
 if ilen == 0 igoto end ;don't go into the loop if Stray is empty
loop:
Schar     strsub    Stray, indx, indx+1; this character
isep1p    strcmp    Schar, Sep1; returns 0 if Schar is sep1
isep2p    strcmp    Schar, Sep2; 0 if Schar is sep2
is_sep    =         (isep1p == 0 || isep2p == 0 ? 1 : 0) ;1 if Schar is a seperator
 ;END OF STRING AND NO SEPARATORS BEFORE?
 if indx == ilen && iwarleer == 0 then
Sel       strsub    Stray, istartsel, -1
inewel    =         1
 ;FIRST CHARACTER OF AN ELEMENT?
 elseif is_sep == 0 && iwarleer == 1 then
istartsel =         indx ;if so, set startindex
iwarleer  =         0 ;reset info about previous separator 
iel       =         iel+1 ;increment element count
 ;FIRST SEPERATOR AFTER AN ELEMENT?
 elseif iwarleer == 0 && is_sep == 1 then
Sel       strsub    Stray, istartsel, indx ;get elment
inewel    =         1 ;tell about
iwarleer  =         1 ;reset info about previous separator
 endif
 ;CHECK THE ELEMENT
 if inewel == 1 then ;for each new element
icmp      strcmp    Sel, Stest ;check whether equals Stest
  ;terminate and return the position of the element if successful
  if icmp == 0 then
iout      =         iel
          igoto     end
  endif
 endif
inewel    =         0
          loop_le   indx, 1, ilen, loop 
end:
          xout      iout
  endop 

  opcode StrayGetEl, S, Sijj
;returns the element at position ielindx in Stray, or an empty string if the element has not been found
Stray, ielindx, isepA, isepB xin
;;DEFINE THE SEPERATORS
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
;;INITIALIZE SOME PARAMETERS
ilen      strlen    Stray
istartsel =         -1; startindex for searched element
iendsel   =         -1; endindex for searched element
iel       =         0; actual number of element while searching
iwarleer  =         1
indx      =         0
 if ilen == 0 igoto end ;don't go into the loop if Stray is empty
loop:
Snext     strsub    Stray, indx, indx+1; next sign
isep1p    strcmp    Snext, Sep1; returns 0 if Snext is sep1
isep2p    strcmp    Snext, Sep2; 0 if Snext is sep2
;;NEXT SIGN IS NOT SEP1 NOR SEP2
if isep1p != 0 && isep2p != 0 then
 if iwarleer == 1 then; first character after a seperator 
  if iel == ielindx then; if searched element index
istartsel =         indx; set it
iwarleer  =         0
  else 			;if not searched element index
iel       =         iel+1; increase it
iwarleer  =         0; log that it's not a seperator 
  endif 
 endif 
;;NEXT SIGN IS SEP1 OR SEP2
else 
 if istartsel > -1 then; if this is first selector after searched element
iendsel   =         indx; set iendsel
          igoto     end ;break
 else	
iwarleer  =         1
 endif 
endif
          loop_lt   indx, 1, ilen, loop 
end:
Sout      strsub    Stray, istartsel, iendsel
          xout      Sout
  endop 

  opcode StrayNumLen, i, Sjj
  ;requires the UDOs StrayGetEl, StrayLen and StrNumP
Stray, isepA, isepB xin
isep1      =          (isepA == -1 ? 32 : isepA)
isep2      =          (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
ilen       StrayLen   Stray, isep1, isep2
 if ilen == 0 igoto end ;don't go into the loop if there is nothing to do
icount     =          0; number of elements
indx       =          0
loop:
Snext      StrayGetEl Stray, indx, isep1, isep2
inump      StrNumP    Snext
 if inump == 1 then
icount     =          icount + 1
 endif
           loop_lt    indx, 1, ilen, loop
end:       xout       icount
  endop

  opcode StrayNumMem, i, Sijj
;looks whether inum is an element of Stray. returns the index of the element if found, and -1 if not.
Stray, inum, isepA, isepB xin
;;DEFINE THE SEPERATORS
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
;;INITIALIZE SOME PARAMETERS
ilen      strlen    Stray
istartsel =         -1; startindex for searched element
iout      =         -1 ;default output
iel       =         -1; actual number of element while searching
iwarleer  =         1; is this the start of a new element
indx      =         0 ;character index
inewel    =         0 ;new element to find
;;LOOP
 if ilen == 0 igoto end ;don't go into the loop if Stray is empty
loop:
Schar     strsub    Stray, indx, indx+1; this character
isep1p    strcmp    Schar, Sep1; returns 0 if Schar is sep1
isep2p    strcmp    Schar, Sep2; 0 if Schar is sep2
is_sep    =         (isep1p == 0 || isep2p == 0 ? 1 : 0) ;1 if Schar is a seperator
 ;END OF STRING AND NO SEPARATORS BEFORE?
 if indx == ilen && iwarleer == 0 then
Sel       strsub    Stray, istartsel, -1
inewel    =         1
 ;FIRST CHARACTER OF AN ELEMENT?
 elseif is_sep == 0 && iwarleer == 1 then
istartsel =         indx ;if so, set startindex
iwarleer  =         0 ;reset info about previous separator 
iel       =         iel+1 ;increment element count
 ;FIRST SEPERATOR AFTER AN ELEMENT?
 elseif iwarleer == 0 && is_sep == 1 then
Sel       strsub    Stray, istartsel, indx ;get element
inewel    =         1 ;tell about
iwarleer  =         1 ;reset info about previous separator
 endif
 ;CHECK THE ELEMENT
 if inewel == 1 then ;for each new element
inump     StrNumP   Sel ;check whether element is number
  if inump == 1 then
inumber   strtod    Sel ;if so, convert
   if inumber == inum then ;check if equals inum
iout      =         iel
          igoto     end ;if so, terminate
   endif
  endif
 endif
inewel    =         0
          loop_le   indx, 1, ilen, loop 
end:
          xout      iout
  endop 

  opcode StrayNumSum, i, Sjj
  ;requires the UDOs StrayLen and StrayGetEl
Stray, isepA, isepB xin
isep1      =          (isepA == -1 ? 32 : isepA)
isep2      =          (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
Sep1       sprintf    "%c", isep1
Sep2       sprintf    "%c", isep2
isumtot    =          0
ilen       StrayLen   Stray, isep1, isep2
if ilen == 0 igoto end
indx       =          0
loop:
Snum       StrayGetEl Stray, indx, isep1, isep2
;test if Snum is an math expression
isum       strindex   Snum, "+"; sum
idif       strindex   Snum, "-"; difference
ipro       strindex   Snum, "*"; product
irat       strindex   Snum, "/"; ratio
ipow       strindex   Snum, "^"; power
imod       strindex   Snum, "%"; modulo
 if ipow > -1 then
ifirst     strindex   Snum, "^"
S1         strsub     Snum, 0, ifirst
S2         strsub     Snum, ifirst+1
iratio     strindex   S2, "/"
ifirst     strtod     S1
  if iratio == -1 then
isec       strtod     S2
           else
Snumer     strsub     S2, 0, iratio
Sdenom     strsub     S2, iratio+1
inumer     strtod     Snumer
idenom     strtod     Sdenom
isec       =          inumer / idenom
  endif
inum       =          ifirst ^ isec
 elseif imod > -1 then
ifirst     strindex   Snum, "%"
S1         strsub     Snum, 0, ifirst
S2         strsub     Snum, ifirst+1
ifirst     strtod     S1
isec       strtod     S2
inum       =          ifirst % isec
 elseif ipro > -1 then
ifirst     strindex   Snum, "*"
S1         strsub     Snum, 0, ifirst
S2         strsub     Snum, ifirst+1
ifirst     strtod     S1
isec       strtod     S2
inum       =          ifirst * isec
 elseif irat > -1 then
ifirst     strindex   Snum, "/"
S1         strsub     Snum, 0, ifirst
S2         strsub     Snum, ifirst+1
ifirst     strtod     S1
isec       strtod     S2
inum       =          ifirst / isec
 elseif isum > -1 then
ifirst     strindex   Snum, "+"
S1         strsub     Snum, 0, ifirst
S2         strsub     Snum, ifirst+1
ifirst     strtod     S1
isec       strtod     S2
inum       =          ifirst + isec
 elseif idif > -1 then
ifirst     strrindex  Snum, "-";(last occurrence: -3-4 is possible, but not 3--4)
S1         strsub     Snum, 0, ifirst
S2         strsub     Snum, ifirst+1
ifirst     strtod     S1
isec       strtod     S2
inum       =          ifirst - isec
           else
inum       strtod     Snum
 endif
isumtot    =          isumtot + inum
           loop_lt    indx, 1, ilen, loop
end:       xout       isumtot
  endop

  opcode StrIsOp, i, So
String, indx xin
Str strsub String, indx, indx+1
if strcmp(Str, "+") == 0 then
iRes = 1
elseif strcmp(Str, "-") == 0 then
iRes = 2
elseif strcmp(Str, "*") == 0 then
iRes = 3
elseif strcmp(Str, "/") == 0 then
iRes = 4
elseif strcmp(Str, "%") == 0 then
iRes = 5
elseif strcmp(Str, "^") == 0 then
iRes = 6
else
iRes = 0
endif
xout iRes  
  endop

  opcode StrL_Prth, i, Soj
Str, imin, iPos xin
iPos = iPos == -1 ? strlen(Str) - 1 : iPos
iPrtPos = -1
iLevel = 0
until iPos < imin+1 do
  iPos -= 1
  iChar strchar Str, iPos
   ;if next sign is another closing parenthesis, increase level
  if iChar == 41 then
    iLevel += 1
   ;if opening parenthesis 
  elseif iChar == 40 then
     ;and level=0: return position
    if iLevel == 0 then
      iPrtPos = iPos
      igoto end
     ;otherwise decrease level
    else 
      iLevel -= 1
    endif
  endif
enduntil
end: xout iPrtPos
  endop

  opcode StrNxtOpL, ii, Soj
Str, iminpos, ipos xin
ipos = ipos == -1 ? strlen(Str) - 1 : ipos
iop = 0
until ipos <= iminpos || iop > 0 do
ipos -= 1
 if strchar(Str, ipos) == 41 then
  iPrthPos strrindex strsub(Str, 0, ipos), "("
  ipos = iPrthPos
 else
iop StrIsOp Str, ipos
 endif
enduntil
xout ipos, iop
  endop

  opcode StrLNoth, i, Sii
Str, imin, iPos xin
iTrue = 1
until iPos < imin+1 do
iPos -= 1
if strchar(Str, iPos) != 32 && strchar(Str, iPos) != 9 then
iTrue = 0
igoto end
endif
enduntil
end: xout iTrue  
  endop

  opcode StrExpr2, i, iii
iNum1, iNum2, iOp xin
if iOp == 1 then
iNum = iNum1 + iNum2
elseif iOp == 2 then
iNum = iNum1 - iNum2
elseif iOp == 3 then
iNum = iNum1 * iNum2
elseif iOp == 4 then
iNum = iNum1 / iNum2
elseif iOp == 5 then
iNum = iNum1 % iNum2
elseif iOp == 6 then
iNum = iNum1 ^ iNum2
endif
xout iNum
  endop

  opcode StrL_NvO, i, Sii
Str, imin, iPos xin
iTrue = 0
until iPos < imin+1 do
iPos -= 1
  ;if next sign is not empty, test and break
 if strchar(Str, iPos) != 32 && strchar(Str, iPos) != 9 then
  if StrIsOp(Str, iPos) > 0 then
   iTrue = 1 ;implicit: else iTrue=0
  endif
  igoto end
 endif
enduntil
end: xout iTrue
  endop

  opcode StrRmvST, S, Soj
Str, istrt, iend xin
iend = iend == -1 ? strlen(Str) - 1 : iend
Scpy = ""
until istrt == iend+1 do
 if strchar(Str, istrt) != 32 && strchar(Str, istrt) != 9 then
  Scpy strcat Scpy, strsub(Str, istrt, istrt+1)
 endif
 istrt += 1
enduntil
   xout Scpy
  endop

  opcode StrExpr1, i, Soj

 ;input (string, first and last index to read)
Str, istrt, iend xin
iend = (iend == -1) ? strlen(Str) - 1 : iend

 ;read backwards
indx = iend
until indx == istrt do

  ;1. if this char is closing parenthesis:
 if strchar(Str, indx) == 41 then
   ;look for the corresponding opening parenthesis
  iPrthPos StrL_Prth Str, istrt, indx
   ;look for the operator before
  iOpPos, iOp StrNxtOpL Str, istrt, iPrthPos
  
   ;if there is one:
  if iOp > 0 then
    ;if this is a simple minus sign:
   if iOp == 2 && StrLNoth(Str, istrt, iOpPos) == 1 then
     ;evaluate 
    iNum = -StrExpr1(Str, iPrthPos+1, indx-1)
    ;if this is plus or minus, split here
   elseif iOp <= 2 then
    iNum StrExpr2 StrExpr1(Str, istrt, iOpPos-1), StrExpr1(Str, iPrthPos+1, indx-1), iOp
    
    ;else splitting might be here or not, if there is another operator before
   else 
     ;look for the operator before
    iPrecOpPos, iPrecOp StrNxtOpL Str, istrt, iOpPos    
     ;if there is none or nothing left to it (= single minus sign), split here
    if iPrecOp == 0 || StrLNoth(Str, istrt, iPrecOpPos) == 1 then
     iNum StrExpr2 StrExpr1(Str, istrt, iOpPos-1), StrExpr1(Str, iPrthPos+1, indx-1), iOp     
     ;if preceding operator >= than operator here, split here
    elseif iPrecOp >= iOp then
     iNum StrExpr2 StrExpr1(Str, istrt, iOpPos-1), StrExpr1(Str, iPrthPos+1, indx-1), iOp     
     ;else split there
    else
     iNum StrExpr2 StrExpr1(Str, istrt, iPrecOpPos-1), StrExpr1(Str, iPrecOpPos+1, indx), iPrecOp
    endif
   endif
   
   ;if no operator before, evaluate this section 
  else
   iNum StrExpr1 Str, iPrthPos+1, indx-1
  endif
   ;leave
  igoto end
  
  ;2. if this char is +:
 elseif StrIsOp(Str, indx) == 1 then
   ;split here, evaluate sections and break
  iNum StrExpr2 StrExpr1(Str, istrt, indx-1), StrExpr1(Str, indx+1, iend), 1
  igoto end

  ;3. if this char is -:
 elseif StrIsOp(Str, indx) == 2 then
   ;if this is a minus sign, ignore
  if StrL_NvO(Str, istrt, indx) == 0 then
    ;otherwise split here, evaluate sections and break
   iNum StrExpr2 StrExpr1(Str, istrt, indx-1), StrExpr1(Str, indx+1, iend), 2
   igoto end
  endif

  ;4. if this char is *, / or %:
 elseif StrIsOp(Str, indx) == 3 || StrIsOp(Str, indx) == 4 || StrIsOp(Str, indx) == 5 then

   ;look for next operator at left
  iOpPos, iOp StrNxtOpL Str, istrt, indx
   ;if +: split there
   if iOp == 1  then
    iNum StrExpr2 StrExpr1(Str, istrt, iOpPos-1), StrExpr1(Str, iOpPos+1, iend), iOp
   ;if - and not minus sign: split there as well
   elseif iOp == 2 && StrLNoth(Str, istrt, iOpPos) == 0 then
    iNum StrExpr2 StrExpr1(Str, istrt, iOpPos-1), StrExpr1(Str, iOpPos+1, iend), iOp
    ;else split here
   else
    iNum StrExpr2 StrExpr1(Str, istrt, indx-1), StrExpr1(Str, indx+1, iend), StrIsOp(Str, indx)
   endif
   ;break loop
  igoto end
  
  ;5. if this char is ^:
 elseif StrIsOp(Str, indx) == 6 then  
   ;look for next operator at left
  iOpPos, iOp StrNxtOpL Str, istrt, indx   
   ;if ^ or minus sign or none: split here
  if iOp == 0 || iOp == 6 || (iOp == 2 && iOpPos == 0) then
    iNum StrExpr2 StrExpr1(Str, istrt, indx-1), StrExpr1(Str, indx+1, iend), 6
   ;else there
  else
    iNum StrExpr2 StrExpr1(Str, istrt, iOpPos-1), StrExpr1(Str, iOpPos+1, iend), 6   
  endif
   ;break loop
  igoto end
 endif

  ;decrease index
indx -= 1
 
enduntil

iNum strtod strsub(Str, istrt, iend+1)

end: xout iNum  
  endop

  opcode StrExpr, i, Soj
  ;converts a string expression to a number
 
 ;input
Str, istrt, iend xin
iend = (iend == -1) ? strlen(Str) - 1 : iend

 ;remove spaces
StrRmvd StrRmvST Str, istrt, iend

 ;make sure this is a real string
if strlen(StrRmvd) == 0 then
prints "ERROR in UDO StrExpr: Input String is empty!\n"
igoto skip
endif

 ;then let the sub functions do their work
iNum StrExpr1 StrRmvd
   xout iNum
skip:
  endop

  opcode StrayNumToFt, ii, Sojj
  ;requires the UDOs StrayLen and StrExpr (which itself requires others)
Stray, iftno, isepA, isepB xin
;;DEFINE THE SEPERATORS
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
;;CREATE A FUNCTION TABLE
iftlen    StrayLen  Stray, isep1, isep2
 if iftlen == 0 then
          prints    "WARNING! StrayNumToFt got empty string as input. Function table with length=1 created, but iftlen=0 returned.\n"
iftl      =         1
 else
iftl      =         iftlen
 endif
ift       ftgen     iftno, 0, -iftl, -2, 0 
;;INITIALIZE SOME PARAMETERS
ilen      strlen    Stray
istartsel =         -1; startindex for searched element
iel       =         -1; number of element in Stray and ift
iwarleer  =         1; is this the start of a new element
indx      =         0 ;character index
inewel    =         0 ;new element to find
;;LOOP
 if ilen == 0 igoto end ;don't go into the loop if Stray is empty
loop:
Schar     strsub    Stray, indx, indx+1; this character
isep1p    strcmp    Schar, Sep1; returns 0 if Schar is sep1
isep2p    strcmp    Schar, Sep2; 0 if Schar is sep2
is_sep    =         (isep1p == 0 || isep2p == 0 ? 1 : 0) ;1 if Schar is a seperator
 ;END OF STRING AND NO SEPARATORS BEFORE?
 if indx == ilen && iwarleer == 0 then
Sel       strsub    Stray, istartsel, -1
inewel    =         1
 ;FIRST CHARACTER OF AN ELEMENT?
 elseif is_sep == 0 && iwarleer == 1 then
istartsel =         indx ;if so, set startindex
iwarleer  =         0 ;reset info about previous separator 
iel       =         iel+1 ;increment element count
 ;FIRST SEPERATOR AFTER AN ELEMENT?
 elseif iwarleer == 0 && is_sep == 1 then
Sel       strsub    Stray, istartsel, indx ;get element
inewel    =         1 ;tell about
iwarleer  =         1 ;reset info about previous separator
 endif
 ;WRITE THE ELEMENT TO THE TABLE
 if inewel == 1 then
inum      StrExpr   Sel ;convert expression to number
          tabw_i    inum, iel, ift ;write to ift
 endif
inewel    =         0
          loop_le   indx, 1, ilen, loop 
end:
          xout      ift, iftlen
  endop 

  opcode StrayRemDup, S, Sjj
;removes duplicates in Stray and returns the result. elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). if just one seperator is used, isep2 equals isep1.
;requires the UDOs StrayLen and StrayGetEl
Stray, isepA, isepB xin
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
ilen1     StrayLen  Stray, isep1, isep2
Sres      =         ""
if ilen1 == 0 igoto end1 
indx1     =         0
loop1:
Sel       StrayGetEl Stray, indx1, isep1, isep2; get element
ires      =         0
ilen      StrayLen  Sres, isep1, isep2; length of Sres
if ilen == 0 igoto end 
indx      =         0
loop:	;iterate over length of Sres
Snext     StrayGetEl Sres, indx, isep1, isep2
icomp     strcmp    Snext, Sel
 if icomp == 0 then
ires      =         1
          igoto     end 
 endif
          loop_lt   indx, 1, ilen, loop 
end:		
 if ires == 0 then ;if element is not already in Sres, append
Sdran     sprintf   "%s%s", Sep1, Sel
Sres      strcat    Sres, Sdran
 endif

          loop_lt	indx1, 1, ilen1, loop1 
end1:		
Sout      strsub    Sres, 1; remove starting sep1
          xout      Sout
  endop 

  opcode StrayRev, S, Sjjj
;reverses the elements in Stray and returns the result. elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). if just one seperator is used, isep2 equals isep1. the elements in the resulting string Sres are seperated by isepOut (default=isep1)
Stray, isepA, isepB, isepOut xin
;;DEFINE THE SEPERATORS
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
isepOut   =         (isepOut == -1 ? isep1 : isepOut)
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
;;INITIALIZE SOME PARAMETERS
Sres      =         ""
ilen      strlen    Stray
istartsel =         -1; startindex for searched element
iwarleer  =         1; is this the start of a new element
indx      =         0 ;character index
inewel    =         0 ;new element to find
;;LOOP
 if ilen == 0 igoto end ;don't go into the loop if Stray is empty
loop:
Schar     strsub    Stray, indx, indx+1; this character
isep1p    strcmp    Schar, Sep1; returns 0 if Schar is sep1
isep2p    strcmp    Schar, Sep2; 0 if Schar is sep2
is_sep    =         (isep1p == 0 || isep2p == 0 ? 1 : 0) ;1 if Schar is a seperator
 ;END OF STRING AND NO SEPARATORS BEFORE?
 if indx == ilen && iwarleer == 0 then
Sel       strsub    Stray, istartsel, -1
inewel    =         1
 ;FIRST CHARACTER OF AN ELEMENT?
 elseif is_sep == 0 && iwarleer == 1 then
istartsel =         indx ;if so, set startindex
iwarleer  =         0 ;reset info about previous separator 
 ;FIRST SEPERATOR AFTER AN ELEMENT?
 elseif iwarleer == 0 && is_sep == 1 then
Sel       strsub    Stray, istartsel, indx ;get elment
inewel    =         1 ;tell about
iwarleer  =         1 ;reset info about previous separator
 endif
 ;PREPEND THE ELEMENT TO THE RESULT
 if inewel == 1 then ;for each new element
Selsep    sprintf   "%c%s", isepOut, Sel ;prepend seperator
Sres      strcat    Selsep, Sres ;prepend to result
 endif
inewel    =         0
          loop_le   indx, 1, ilen, loop 
end:
Sout      strsub    Sres, 1; remove starting seperator
          xout      Sout
  endop 

  opcode StrayRndEl, S, Sjj
Stray, isepA, isepB xin
iLen       StrayLen   Stray, isepA, isepB
iElIndx    rnd31      iLen, 0
Sel        StrayGetEl Stray, abs(int(iElIndx)), isepA, isepB
           xout       Sel
  endop

  opcode StraySetEl, S, SSjjjj
;puts the string Sin at the position ielindx (default=-1: at the end) of Stray, and returns the result as a string. elements in the string are seperated by the two ascii-coded seperators isepA (default=32: space) and isepB (default=9: tab). if just isepA is given, it is also read as isepB. the element is inserted using the seperator isepOut (default=isep1)
Stray, Sin, ielindx, isepA, isepB, isepOut xin
;;DEFINE THE SEPERATORS
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
isepOut   =         (isepOut == -1 ? isep1 : isepOut)
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
SepOut    sprintf   "%c", isepOut
;;INITIALIZE SOME PARAMETERS
ilen      strlen    Stray
iel       =         0; actual element position
iwarsep   =         1
indx      =         0
;;APPEND Sin IF ielindx=-1
 if ielindx == -1 then
Sres      sprintf   "%s%s%s", Stray, SepOut, Sin
          igoto     end	
 endif
;;PREPEND Sin IF ielindx=0
 if ielindx == 0 then
Sres      sprintf   "%s%s%s", Sin, SepOut, Stray
          igoto     end	
  endif
loop:
Snext     strsub    Stray, indx, indx+1; next sign
isep1p    strcmp    Snext, Sep1; returns 0 if Snext is sep1
isep2p    strcmp    Snext, Sep2; 0 if Snext is sep2
;;NEXT SIGN IS NOT SEP1 NOR SEP2
if isep1p != 0 && isep2p != 0 then
 if iwarsep == 1 then; first character after a seperator 
  if iel == ielindx then; if searched element index
S1        strsub    Stray, 0, indx; string before Sin
S2        strsub    Stray, indx, -1; string after Sin
Sres      sprintf   "%s%s%s%s", S1, Sin, SepOut, S2
          igoto     end
  else 			;if not searched element index
iel       =         iel+1; increase it
iwarsep   =         0; log that it's not a seperator 
  endif 
 endif 
;;NEXT SIGN IS SEP1 OR SEP2
else 
iwarsep   =         1
endif
          loop_lt   indx, 1, ilen, loop 
;;APPEND Sin IF ielindx is >= number of elements
Sres      sprintf   "%s%s%s", Stray, SepOut, Sin
end:      xout      Sres
  endop 

  opcode StraySetNum, S, Sijjjj
  ;requires the UDO NmFrcLen
Stray, inum, ielindx, isepA, isepB, isepOut xin
;;DEFINE THE SEPERATORS
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
isepOut   =         (isepOut == -1 ? isep1 : isepOut)
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
SepOut    sprintf   "%c", isepOut
;;INITIALIZE SOME PARAMETERS
ifracs    NmFrcLen   inum
ilen      strlen    Stray
iel       =         0; actual element position
iwarsep   =         1
indx      =         0
;;APPEND inum IF ielindx=-1
 if ielindx == -1 then
Sformat   sprintf   "%%s%%s%%.%df", ifracs
Sres      sprintf   Sformat, Stray, SepOut, inum
          igoto     end	
 endif
;;PREPEND inum IF ielindx=0
 if ielindx == 0 then
Sformat   sprintf   "%%.%df%%s%%s", ifracs
Sres      sprintf   Sformat, inum, SepOut, Stray
          igoto     end	
  endif
loop:
Snext     strsub    Stray, indx, indx+1; next sign
isep1p    strcmp    Snext, Sep1; returns 0 if Snext is sep1
isep2p    strcmp    Snext, Sep2; 0 if Snext is sep2
;;NEXT SIGN IS NOT SEP1 NOR SEP2
if isep1p != 0 && isep2p != 0 then
 if iwarsep == 1 then; first character after a seperator 
  if iel == ielindx then; if searched element index
S1        strsub    Stray, 0, indx; string before Sin
S2        strsub    Stray, indx, -1; string after Sin
Sformat   sprintf   "%%s%%.%df%%s%%s", ifracs
Sres      sprintf   Sformat, S1, inum, SepOut, S2
          igoto     end
  else              ;if not searched element index
iel       =         iel+1; increase it
iwarsep   =         0; log that it's not a seperator 
  endif 
 endif 
;;NEXT SIGN IS SEP1 OR SEP2
else 
iwarsep   =         1
endif
          loop_lt   indx, 1, ilen, loop 
;;APPEND inum IF ielindx IS >= NUMBER OF ELEMENTS
Sformat   sprintf   "%%s%%s%%.%df", ifracs
Sres      sprintf   Sformat, Stray, SepOut, inum
end:		xout      Sres
  endop 

  opcode StraySub, S, Sojjjj
;returns a subset of elements in Stray. elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). if just one seperator is used, isep2 equals isep1.
Stray, istart, iend, isepA, isepB, isepOut xin
;;DEFINE THE SEPERATORS
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
isepOut   =         (isepOut == -1 ? 32 : isepOut)
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
;;INITIALIZE SOME PARAMETERS
Sres      =         ""
ilen      strlen    Stray
iend      =         (iend == -1 ? ilen : iend) ;for simplifying tests later
istartsel =         -1; startindex for any element
iel       =         -1; actual number of element while searching
iwarleer  =         1; is this the start of a new element
indx      =         0 ;character index
inewel    =         0 ;new element to find
;;LOOP
 if ilen == 0 igoto end ;don't go into the loop if Stray is empty
loop:
Schar     strsub    Stray, indx, indx+1; this character
isep1p    strcmp    Schar, Sep1; returns 0 if Schar is sep1
isep2p    strcmp    Schar, Sep2; 0 if Schar is sep2
is_sep    =         (isep1p == 0 || isep2p == 0 ? 1 : 0) ;1 if Schar is a seperator
 ;END OF STRING AND NO SEPARATORS BEFORE?
 if indx == ilen && iwarleer == 0 then
Sel       strsub    Stray, istartsel, -1
inewel    =         1
 ;FIRST CHARACTER OF AN ELEMENT?
 elseif is_sep == 0 && iwarleer == 1 then
istartsel =         indx ;if so, set startindex
iwarleer  =         0 ;reset info about previous separator 
iel       =         iel+1 ;increment element count
 ;FIRST SEPERATOR AFTER AN ELEMENT?
 elseif iwarleer == 0 && is_sep == 1 then
Sel       strsub    Stray, istartsel, indx ;get elment
inewel    =         1 ;tell about
iwarleer  =         1 ;reset info about previous separator
 endif
 ;APPEND THE ELEMENT TO THE RESULT IF IN RANGE
 if inewel == 1 && iel >= istart && iel < iend then ;for each new element in range
Selsep    sprintf   "%c%s", isepOut, Sel ;prepend seperator
Sres      strcat    Sres, Selsep ;append to result
 endif
inewel    =         0
          loop_le   indx, 1, ilen, loop 
end:
Sout      strsub    Sres, 1; remove starting seperator
          xout      Sout
  endop 

  opcode StrIsEmpty, i, Soj
Str, istrt, iend xin
iend = iend == -1 ? strlen(Str) - 1 : iend
iTrue = 1
until iTrue == 0 || istrt > iend do
 if strchar(Str, istrt) != 32 && strchar(Str, istrt) != 9 then
  iTrue = 0
 endif
istrt += 1
enduntil
xout iTrue
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

  opcode StrTrmPos, ii, Soj
Str, istrt, iend xin
iend = iend == -1 ? strlen(Str) - 1 : iend
;left trim
until strchar(Str, istrt) != 32 && strchar(Str, istrt) != 9 || istrt == iend do
istrt += 1
enduntil
;right trim
until strchar(Str, iend) != 32 && strchar(Str, iend) != 9 || iend == istrt do
iend -= 1
enduntil
xout istrt, iend
  endop

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

  opcode StrToAscS, S, S
Sin        xin
ilen       strlen     Sin
ipos       =          0
Sres       =          ""
loop:
ichr       strchar    Sin, ipos
Snew       sprintf    "%d ", ichr
Sres       strcat     Sres, Snew
           loop_lt    ipos, 1, ilen, loop
           xout       Sres
  endop

  opcode StrAgrm, S, Sj
Sin, iLen  xin
 if iLen == -1 then
iLen       strlen     Sin
 endif
Sout       =          ""
;for all elements in Sin
iCnt       =          0
iRange     =          iLen
loop:
;get one randomly
iRnd       rnd31      iRange-.0001, 0
iRnd       =          int(abs(iRnd))
Sel        strsub     Sin, iRnd, iRnd+1
Sout       strcat     Sout, Sel
;take it out from Sin
Ssub1      strsub     Sin, 0, iRnd
Ssub2      strsub     Sin, iRnd+1
Sin        strcat     Ssub1, Ssub2
;adapt range (new length)
iRange     =          iRange-1
           loop_lt    iCnt, 1, iLen, loop
           xout       Sout
  endop

  opcode StrAgrmk, S, S
  ;same at k-time
Sin  xin
kLen       strlenk    Sin
Sout       strcpyk    ""
Sin        strcpyk    Sin
;for all elements in Sin
kCnt       =          0
kRange     =          kLen
loop:
;get one randomly
kRnd       rnd31      kRange-.0001, 0
kRnd       =          int(abs(kRnd))
Sel        strsubk    Sin, kRnd, kRnd+1
Sout       strcatk    Sout, Sel
;take it out from Sin
Ssub1      strsubk    Sin, 0, kRnd
Ssub2      strsubk    Sin, kRnd+1, kLen
Sin        strcatk    Ssub1, Ssub2
;adapt range (new length)
kRange     =          kRange-1
           loop_lt    kCnt, 1, kLen, loop
           xout       Sout
  endop

  opcode StrLineBreak, S, Si
String, iNum xin
Sres    =        ""
loop:
ilen    strlen   String
 if ilen > iNum then
S1      strsub   String, 0, iNum
Sres    strcat   Sres, S1
Sres    strcat   Sres, "\n"
String  strsub   String, iNum
        igoto    loop
        else
Sres    strcat   Sres, String
 endif
        xout     Sres
  endop

  opcode StrDir, S, S
;returns the directory of a file path
Spath      xin
ipos      strrindex Spath, "/"
Sdir      strsub    Spath, 0, ipos
          xout      Sdir
  endop

  opcode StrDirUp, S, S
  ;returns the directory above the current directory
SCurDir    xin
;make sure the input does not end with '/'
ilen       strlen     SCurDir
ipos       strrindex  SCurDir, "/"
 if ipos == ilen-1 then
Sok        strsub     SCurDir, 0, ipos
 else	
Sok        strcpy     SCurDir
 endif
ipos       strrindex  Sok, "/"
SUpDir     strsub     Sok, 0, ipos
           xout       SUpDir
  endop

opcode StrFiln, S, So
 Spath, iRm xin
 ipos strrindex Spath, "/"
 Snam strsub Spath, ipos+1
 if iRm != 0 then
  ipos strindex Snam, "."
  Snam strsub Snam, 0, ipos
 endif
 xout Snam
endop

  opcode StrSuf, S, So
  ;returns the suffix of a filename or path, optional in lower case 
Spath,ilow xin
ipos      strrindex Spath, "."
Suf       strsub    Spath, ipos+1
 if ilow != 0 then
Suf       strlower  Suf 
 endif
          xout      Suf
  endop

  opcode TbToSF, 0, iSkjoj
ift, Soutname, ktrig, iformat, istart, iend xin; start (default = 0) and end (default = last sample) in seconds
istrtsmps =         istart*sr; start to write in samples 
iendsmps  =         (iend == -1 ? ftlen(ift) : iend*sr); end to write in samples
 if iformat == -1 then
iformat   =         18; default: wav 24 bit (for other options see fout manual page)
 endif
 if ktrig == 1 then; make sure that trigger sends "1" just for one k-cycle
kcnt      init      istrtsmps; set the counter to 0 at start
loop:
kcnt      =         kcnt+ksmps; next value (e.g. 10 if ksmps=10)
andx      interp    kcnt-1; build audio index (e.g. from 0 to 9)
asig      tab       andx, ift; read the table values as audio signal
          fout      Soutname, iformat, asig; write asig to a file
 if kcnt <= iendsmps-ksmps kgoto loop; go back as long there is something to do
 endif 
  endop

opcode TbScala, i, Sjjo
 ScalaFile, ibasefreq, ibasekey, ifn xin
 if filevalid(ScalaFile) == 0 then
  prints "TBScala didn't work. File not found\n"
  idummy_ = 0
 else
  iline init 0
  inoncommentline init 0
  inumgrades init 0
  ipitwrites init 0
  ibasefreq = (ibasefreq == -1 ? A4 : ibasefreq)
  ibasekey = (ibasekey == -1 ? 69 : ibasekey)
  while iline != -1 do
   Sline, iline readfi ScalaFile
   istrlen strlen Sline
   if strchar:i(Sline) == 33 then
    ;;ignore commentlines
   elseif inoncommentline == 0 then
    ;;; first non comment line is description
    inoncommentline += 1
   elseif inoncommentline == 1 then
    ;;; second non comment line is numnotes
    inumgrades strtod strsub(Sline, 0, istrlen - 1)
    ipitstore[] init inumgrades
    inoncommentline += 1
   else
    ;; cents or ratio's from here
    ipos init 0
    istartslice init -1
    iendslice init -1
    icentformat init 0
    while ipos < istrlen do
     ichr strchar Sline, ipos
     if (ichr >= 45 && ichr < 58) then
      if (istartslice == -1) then
       istartslice = ipos
      endif
      if (ichr == 46) then
       icentformat = 1
      endif
     elseif (istartslice >= 0 && iendslice == -1) then
      iendslice = ipos
      igoto breakout
     endif
     ipos += 1
    od
    breakout:
    if (istartslice != -1) then
     Ssegment strsub Sline, istartslice, iendslice
     if (icentformat == 1) then
      ipitval strtod Ssegment
     else
      idiv strindex Ssegment, "/"
      Snumer strsub Ssegment, 0, idiv
      Sdenom strsub Ssegment, idiv+1
      inumer strtod Snumer
      idenom = (idiv == -1 ? 1 : strtod:i(Sdenom)) 
      ipitval = inumer/idenom
     endif            
     ipitval = (icentformat == 1 ? (2 ^ (ipitval/1200)) : ipitval)
     ipitstore[ipitwrites] = ipitval
     ipitwrites += 1
    endif
   endif
  od
  idummy_ ftgen ifn, 0, -(ipitwrites + 5), -2, inumgrades, ipitval, ibasefreq, ibasekey, 1
  iarrstep init 0
  while iarrstep < inumgrades do
   tablew ipitstore[iarrstep], iarrstep + 5, idummy_
   iarrstep += 1
  od
 endif
 xout idummy_
endop 

opcode TbSinc, i, iioo
 iStart, iEnd, iSize, iFtNo xin
 iFt ftgen 0, 0, -iSize, 2, 0
 iRange = iEnd - iStart
 iCnt = 0
 while iCnt < iSize do
  iX = iRange/(iSize-1) * iCnt + iStart
  iY = (iX == 0 ? 1 : sin(iX) / iX)
  tablew iY, iCnt, iFt
  iCnt += 1
 od
 xout iFt
endop

  opcode TbPrmRnd, 0, i
ift xin
itablen    =          ftlen(ift)
icopy      ftgentmp   0, 0, -itablen, -2, 0
           tableicopy  icopy, ift
ileng      =          itablen
indxerg    =          0
loop:
irand      random     0, ileng - .0001
index      =          int(irand)
ival       tab_i      index, icopy
           tabw_i     ival, indxerg, ift
lshift:
if (index == ileng-1) igoto next
indxneu    =          index
indxalt    =          indxneu+1
ivalalt    tab_i      indxalt, icopy
           tabw_i     ivalalt, indxneu, icopy
index      =          index + 1
           igoto      lshift
next:
ileng      =          ileng - 1
indxerg    =          indxerg + 1
if (ileng > 0) igoto loop
  endop

  opcode TbPrmRndk, 0, ik
;changes the contents of ift each time ktrig is positive
ift, ktrig xin
itablen    =          ftlen(ift)
icopy      ftgentmp   0, 0, -itablen, -2, 0
if ktrig > 0 then
           tablecopy  icopy, ift
kleng      =          itablen
kndxerg    =          0
loop:
krand      random     0, kleng - .0001
kndex      =          int(krand)
kval       tab        kndex, icopy
           tabw       kval, kndxerg, ift
lshift:
if (kndex == kleng-1) kgoto next
kndxneu    =          kndex
kndxalt    =          kndxneu+1
kvalalt    tab        kndxalt, icopy
           tabw       kvalalt, kndxneu, icopy
kndex      =          kndex + 1
           kgoto      lshift
next:
kleng      =          kleng - 1
kndxerg    =          kndxerg + 1
if (kleng > 0) kgoto loop
endif
  endop

  opcode TbMem, i, iioj
ival, ift, indxstrt, indxend xin
indxend   =         (indxend == -1 ? ftlen(ift) : indxend)
ipos      =         -1
loop:
iftel     tab_i     indxstrt, ift
  if iftel == ival then
ipos      =         indxstrt
          igoto     end  
  endif
          loop_lt   indxstrt, 1, indxend, loop
end:      xout      ipos
  endop

  opcode TbRmDp, i, iioj
iftsrc, iftdst, ioffset, inumels xin
;copy first element
ifirst    tab_i     ioffset, iftsrc
          tabw_i    ifirst, 0, iftdst
;calculate border in iftsrc
iftlen    tableng   iftsrc
ireadend  =         (inumels == -1 || ioffset+inumels > iftlen ? iftlen : inumels+ioffset)
;compare each element with all already written in iftdst
;and add to iftdst if not already there
ireadindx =         ioffset+1
iwritindx =         1
loop:
iel       tab_i     ireadindx, iftsrc
itest     TbMem     iel, iftdst, 0, iwritindx
 if itest == -1 then
          tabw_i    iel, iwritindx, iftdst
iwritindx =         iwritindx + 1
 endif
          loop_lt   ireadindx, 1, ireadend, loop
          xout      iwritindx
  endop

  opcode TbPeak, i, ioj
ift, indxstrt, indxend xin
indxend   =         (indxend == -1 ? ftlen(ift) : indxend)
iPeak     =         0
while indxstrt < indxend do
  iVal = abs(table:i(indxstrt, ift))
  iPeak = iVal > iPeak ? iVal : iPeak
  indxstrt += 1
od
     xout      iPeak
  endop

  opcode TbToLin, k, i
ift        xin
iftlen     tableng    ift
indx1      =          0
indx2      =          1
indx3      =          2
segment:
if indx3 >= iftlen igoto end
iStart     table      indx1, ift
iDur       table      indx2, ift
iTarget    table      indx3, ift
           timout     0, iDur, do
           reinit     segment
do:
kOut       linseg     iStart, iDur, iTarget
indx1      =          indx1+2
indx2      =          indx2+2
indx3      =          indx3+2
end:
           xout       kOut
  endop


