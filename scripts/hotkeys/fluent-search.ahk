global LastLWinPressTime := 0

; LWin::F24

; ~LWin::
; {
; 	if (A_PriorHotkey != "~LWin")
; 	{
; 		global LastLWinPressTime := A_TickCount
; 	}

; 	Send "{Blind}{vkFF}"
; }

; LWin up::
; {
; 	If (A_PriorKey = "LWin" and A_TickCount - LastLWinPressTime <= ReleaseDuration)
; 	{
; 		Send "{F24}" ; show FS
; 	}
; }

; F24::
; {
; 	Send "{Blind}l"
; }

#f::
{
	Send "{F23}" ; dec:134 hex:86
	Send "{Blind}{vkFF}" ; show FS in-window
}

#^f::
{
	Send "{F22}" ; dec:133 hex:85
	Send "{Blind}{vkFF}" ; show FS hints
}