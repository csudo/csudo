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


<CsoundSynthesizer>
<CsOptions>
-nm0
</CsOptions>
<CsInstruments>
ksmps = 32

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

  instr 1
Str = " This is my	string    "
printf_i "string = '%s'\n", 1, Str
printf_i "index =   %d1234567890	2345678901\n", 1, 0
iS, iE StrTrmPos Str
Sub1 strsub Str, iS, iE+1
printf_i "Reading string with default values:\n  Start = %d, End = %d, String = '%s'\n", 1, iS, iE, Sub1
iS, iE StrTrmPos Str, 0, 12
Sub2 strsub Str, iS, iE+1
printf_i "Reading string with End = 12:\n  Start = %d, End = %d, String = '%s'\n", 1, iS, iE, Sub2
iS, iE StrTrmPos Str, 0, 11
Sub2 strsub Str, iS, iE+1
printf_i "Reading string with End = 11:\n  Start = %d, End = %d, String = '%s'\n", 1, iS, iE, Sub2
iS, iE StrTrmPos Str, 5, 11
Sub3 strsub Str, iS, iE+1
printf_i "Reading string with Start=5, End = 11:\n  Start = %d, End = %d, String = '%s'\n", 1, iS, iE, Sub3
  endin 
</CsInstruments>
<CsScore>
i 1 0 0
</CsScore>
</CsoundSynthesizer>
Returns:
string = ' This is my	string    '
index =   01234567890	2345678901
Reading string with default values:
  Start = 1, End = 17, String = 'This is my	string'
Reading string with End = 12:
  Start = 1, End = 12, String = 'This is my	s'
Reading string with End = 11:
  Start = 1, End = 10, String = 'This is my'
Reading string with Start=5, End = 11:
  Start = 6, End = 10, String = 'is my'

