#include-once
#include <Nathalib.au3>
#include <ImageSearch.au3>

Global $image = ""
Global $tolerance = 0
Global $transparency = 0
Global $refXY[2] 

HotkeySet("{HOME}", "flexible_find")

While 1
  Sleep(100)
WEnd

Func flexible_find()
If _FindImageWithTolerance($image, $refXY[0], $refXY[1], $tolerance, $transparency) Then
  MouseMove($refXY[0], $refXY[1], 10)
Else
	MsgBox(0, "FIND", "Unable to find flexible.")
EndIf
EndFunc
