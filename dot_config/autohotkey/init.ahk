#Requires AutoHotkey v2.0
#SingleInstance
#UseHook
ProcessSetPriority "High"
A_MenuMaskKey := "vkFF"

^+!r:: Reload
^+!e:: Edit
^+!d:: KeyHistory
#SuspendExempt
^+!s:: Suspend
#SuspendExempt False

global HomeDir := EnvGet("HomeDrive") EnvGet("HomePath")
global AppsDir := HomeDir "\scoop\apps"
global ShimsDir := HomeDir "\scoop\shims"
global ReleaseDuration := 200

#Include de-elevated-run.lib.ahk

SetCapsLockState("AlwaysOff")
CapsLock::Ctrl

#Include launch-apps.ahk
#Include home-row-navigation.ahk
; #Include glazewm.ahk
; #Include komorebi.ahk