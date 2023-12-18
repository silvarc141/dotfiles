~`; & h::Left
~`; & j::Down
~`; & k::Up
~`; & l::Right
~`; & m::PgUp
~`; & n::PgDn
~`; & u::Home
~`; & o::End
~`; & i::Enter
~`; & ,::BackSpace
~`; & .::Delete

*;::
{
	static pressed
	pressed := True
	SetTimer Expire() => pressed := false, -ReleaseDuration
	KeyWait ";"

	if (A_ThisHotkey = "*;" and pressed = True)
	{
		SetTimer Expire, 0
		SendInput "{Blind}{;}"
		Return
	}

	Return
}