#Requires AutoHotkey v2.0
#SingleInstance
#UseHook
ProcessSetPriority "High"
A_MenuMaskKey := "vkFF"

global HomeDir := EnvGet("HomeDrive") EnvGet("HomePath")
global AppsDir := HomeDir "\scoop\apps"
global ShimsDir := HomeDir "\scoop\shims"
global ReleaseDuration := 200

#Include base.ahk
#Include home-row-navigation.ahk
; #Include glazewm.ahk
; #Include komorebi.ahk