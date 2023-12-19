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
	Run 'explorer.exe C:\Users\Marta'
}

#b::
{
	RunDeelevatedDefault AppsDir '\firefox\current\firefox.exe'
	ActivateWindowWhenExists "ahk_exe firefox.exe"
}
