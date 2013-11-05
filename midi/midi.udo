/****************************************************************************
*****************************************************************************
UDO DEFINITIONS IN midi:
*****************************************************************************
F2M        : iNotNum F2M iFreq [,iRound]
*****************************************************************************
****************************************************************************/

/****************************************************************************
iNotNum F2M iFreq [,iRound]
Converts a frequency to MIDI.Cent note number, with optional rounding to the next key.

Converts a frequency to MIDI.Cent note number, for instance 60.024759 for an input of 262 Hz. If the round option is turned on, the frequency is mapped to the nearest key, so that an integer is returned.

iFreq - Frequency to be converted
iRound - 0 = off (default), 1 = on
iNotNum - Midi note number (60 = middle c)
****************************************************************************/

  opcode F2M, i, io
iFq, iRnd xin
iNotNum = 12 * (log(iFq/220)/log(2)) + 57
iNotNum = (iRnd == 1 ? round(iNotNum) : iNotNum)
xout iNotNum
  endop


