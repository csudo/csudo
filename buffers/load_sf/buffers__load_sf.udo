/****************************************************************************
*****************************************************************************
UDO DEFINITIONS IN buffers/load_sf:
*****************************************************************************
BufFiCt1   : ift BufFiCt1 Sfilenam [, iftnum [, inorm]]
BufFiCt2   : iftL, iftR BufFiCt2 Sfilenam [, ifnL [, ifnR [, inorm]]]
BufFiCt4   : ift1, ift2, ift3, ift4 BufFiCt4 Sfilenam [, ifn1 [, ifn2 [, ifn3 [, ifn4 [, inorm]]]]]
BufFiCt8   : ift1, ift2, ift3, ift4, ift5, ift6, ift7, ift8 BufFiCt8 Sfilenam [, ifn1 [, ifn2 [, ifn3 [, ifn4 [, ifn5 [, ifn6 [, ifn7 [, ifn8 [, inorm]]]]]]]]]
BufFiCtNd1 : ift, ilen BufFiCtNd1 Sfilenam [, ichn [, iftnum [, inorm]]]
BufFiCtNd2 : iftL, iftR, ilen BufFiCtNd2 Sfilenam [, ichnL [, ichnR [, iftnumL [, iftnumR [, inorm]]]]]
*****************************************************************************
****************************************************************************/

/****************************************************************************
ift BufFiCt1 Sfilenam [, iftnum [, inorm]]
creates a gen01 function table from a mono soundfile 

Creates a gen01 function table from a mono soundfile. This is nothing else than a simplification of creating the same with a ftgen statement.
Use BufFiCtNd to create a non-deferred function table from a soundfile 

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

Sfilenam - file name or path as string
ifn1 ... ifn8 - if zero (which is also the default), the number of the function table is given by Csound. Any other positive integer will represent the function table, but the user must take care of not using a number twice
inorm - if zero, the table is not normalized. This is also the default, while any other number creates a normalized table
ift1 ... ift8 - output table numbers
****************************************************************************/
/****************************************************************************
ift, ilen BufFiCtNd1 Sfilenam [, ichn [, iftnum [, inorm]]]
creates a non deferred function table from a mono soundfile and returns its length

Creates a non deferred function table from a mono soundfile and returns its length. This can be useful is you want to use opcodes (for instance table3) which do not work with deferred size function tables

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

Sfilenam - file name or path as string
ichnL, ichnR - channels in Sfilenam to read (default = 1 for ichnL and 2 for ichnR)
iftnumL, iftnumR - if zero (which is also the default), the number of the function table is given by Csound. Any other positive integer will represent the function table, but the user must take care of not using a number twice
inorm - if zero, the table is not normalized. This is also the default, while any other number creates a normalized table
iftL, iftR - output table number
ilen - length of the function table created (which is also the length of the soundfile in samples)
****************************************************************************/

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


