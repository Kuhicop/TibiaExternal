#Region ### CHECK IF WINDOW IS ACTIVE START ###
;False to WinActivate, True to just see if it's active
Func _WinActiveByExe($sExe, $iActive = True)
    If Not ProcessExists($sExe) Then Return SetError(1, 0, 0)
    Local $aPL = ProcessList($sExe)
    Local $aWL = WinList()
    For $iCC = 1 To $aWL[0][0]
        For $xCC = 1 To $aPL[0][0]
            If $aWL[$iCC][0] <> '' And _
                WinGetProcess($aWL[$iCC][1]) = $aPL[$xCC][1] And _
                BitAND(WinGetState($aWL[$iCC][1]), 2) Then
                If $iActive And WinActive($aWL[$iCC][1]) Then Return 1
                If Not $iActive And Not WinActive($aWL[$iCC][1]) Then
                    WinActivate($aWL[$iCC][1])
                    Return 1
                EndIf
            EndIf
        Next
    Next
    Return SetError(2, 0, 0)
EndFunc
#EndRegion ### CHECK IF WINDOW IS ACTIVE END ###

#Region  ### GET MOUSE X,Y START ###
Func _MousePos()
	$mouseXY = MouseGetPos()
	Return $mouseXY
EndFunc
#EndRegion ### END OF GET MOUSE X,Y ###

#Region ### FIND FREE HAND FOR RUNES START ###
Func _FindHand(ByRef $X, ByRef $Y)
$lhand = "images\Left Hand.png"
$rhand = "images\Right Hand.png"

If Not FileExists($lhand) Then
	MsgBox(16,"ERROR","Unable to find " & $lhand)
ElseIf Not FileExists($rhand) Then
	MsgBox(16,"ERROR","Unable to find " & $rhand)
Else
	If _ImageSearch($lhand, $X, $Y) Then
		Return True
	EndIf
	If _ImageSearch($rhand, $X, $Y) Then
		Return True
	EndIf
EndIf
EndFunc
#Region ### END OF FIND FREE HAND FOR RUNES ###

#Region ### GET WINDOW NAME BY PID ###
Func _WinGetByPID($iPID, $iArray = 1) ; 0 Will Return 1 Base Array & 1 Will Return The First Window.
    Local $aError[1] = [0], $aWinList, $sReturn
    If IsString($iPID) Then
        $iPID = ProcessExists($iPID)
    EndIf
    $aWinList = WinList()
    For $A = 1 To $aWinList[0][0]
        If WinGetProcess($aWinList[$A][1]) = $iPID And BitAND(WinGetState($aWinList[$A][1]), 2) Then
            If $iArray Then
                Return $aWinList[$A][1]
            EndIf
            $sReturn &= $aWinList[$A][1] & Chr(1)
        EndIf
    Next
    If $sReturn Then
        Return StringSplit(StringTrimRight($sReturn, 1), Chr(1))
    EndIf
    Return SetError(1, 0, $aError)
EndFunc
#EndRegion

#Region ### FIND BLANK RUNES ###
Func _FindBlankRune(ByRef $X, ByRef $Y)
$blankrunefile = "images\Blank Rune.png"

If Not FileExists($blankrunefile) Then
	MsgBox(16,"ERROR","Unable to find " & $blankrunefile)
Else
	If _FindImage($blankrunefile, $X, $Y) Then
		Return True
	Else
		Return False
	EndIf
EndIf
EndFunc
#EndRegion ### FIND BLANK RUNES ###

#Region ### FIND IMAGE START ###
Func _FindImage($image, ByRef $x, ByRef $y)
$x=0
$y=0
$picture = $image

$result = _ImageSearch($picture,1,$x,$y,0,0)

If $result = 1 Then
	Return True
Else
	Return False
EndIf
EndFunc
#EndRegion ### END OF FIND

Func _FindImageArea($areaimg, $area1, $area2, $area3, $area4, ByRef $resultx, ByRef $resulty)
$result = _ImageSearchArea($areaimg, 1, $area1, $area2, $area3, $area4, $resultx, $resulty, 0, 0)
If $result = 1 Then
	Return True
Else
	Return False
EndIf
EndFunc

#Region ### FIND IMAGE WITH TOLERANCE START ###
Func _FindImageWithTolerance($image, ByRef $x, ByRef $y, $tolerance, $transparency)
$x=0
$y=0
$picture = $image

$result = _ImageSearch($picture,1,$x,$y,$tolerance, $transparency)

If $result = 1 Then
	Return True
Else
	Return False
EndIf
EndFunc
#EndRegion ### END OF FIND IMAGE WITH TOLERANCE ###
