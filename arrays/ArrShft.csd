/****************************************************************************
iOutArr[] ArrShft iInArr[] [,iNumShft]
Shift the values of an array by iNumShft positions.
written by joachim heintz

iInArr[] - input array
iNumShft - defaults to 1 = shift one position to the right side
iOutArry[] - output array
****************************************************************************/

<CsoundSynthesizer>
<CsOptions>
-nm0
</CsOptions>

<CsInstruments>
ksmps = 32

myarr@global:i[] = [1,2,3,4,5]

opcode ArrShft,i[],i[]p
  inarr[],numshft:i xin
  l:i = lenarray(inarr)
  outarr:i[] init l
  numshft = (numshft < 0) ? l+numshft : numshft
  for el,i in inarr do
    outarr[(i+numshft)%l] = el
  od
  xout outarr
endop


instr Test_i

  prints("Original array: ")
  printarray(myarr)
  shft1r:i[] = ArrShft(myarr)
  prints("Default shift (= 1): ")
  printarray(shft1r)
  shft2r:i[] = ArrShft(myarr,2)
  prints("NumShft = 2: ")
  printarray(shft2r)
  shft1l:i[] = ArrShft(myarr,-1)
  prints("NumShft = -1: ")
  printarray(shft1l)
  
endin

</CsInstruments>
<CsScore>
i "Test_i" 0 0
</CsScore>
</CsoundSynthesizer>
prints:

Original array: 
 1.0000 2.0000 3.0000 4.0000 5.0000 
Default shift (= 1): 
 5.0000 1.0000 2.0000 3.0000 4.0000 
NumShft = 2: 
 4.0000 5.0000 1.0000 2.0000 3.0000 
NumShft = -1: 
 2.0000 3.0000 4.0000 5.0000 1.0000 

