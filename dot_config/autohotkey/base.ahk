^+!r:: Reload
^+!e:: Edit
^+!d:: KeyHistory
#SuspendExempt
^+!s:: Suspend
#SuspendExempt False

A_MenuMaskKey := "vkFF"
SetCapsLockState("AlwaysOff")
CapsLock::Ctrl

#Include de-elevated-run.lib.ahk

ActivateWindowWhenExists(criteria)
{
    while (WinExist(criteria) == false)
    {
        Sleep 200
    }

    WinActivate criteria
}

#+^f::
{
    RunDeelevatedDefault AppsDir "\everything\current\Everything.exe"
    ActivateWindowWhenExists "ahk_exe everything.exe"
}

^!t::
{
    RunDeelevatedDefault ShimsDir '\alacritty-config.exe --working-directory ' HomeDir
    ActivateWindowWhenExists "Alacritty"
}

^!+t::
{
    Run ShimsDir '\alacritty-config.exe --working-directory ' HomeDir, '', 'Hide'
    ActivateWindowWhenExists "Alacritty"
}

#e::
{
    Run 'explorer.exe ' HomeDir
}

#b::
{
    RunDeelevatedDefault AppsDir '\firefox\current\firefox.exe'
    ActivateWindowWhenExists "ahk_exe firefox.exe"
}

;global LastLWinPressTime := 0

; LWin::F24
;LWin::LWin
;LWin up::vkFF
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

;#f::
;{
;    Send "{F23}" ; dec:134 hex:86
;    Send "{Blind}{vkFF}" ; show FS in-window
;}

;#^f::
;{
;    Send "{F22}" ; dec:133 hex:85
;    Send "{Blind}{vkFF}" ; show FS hints
;}