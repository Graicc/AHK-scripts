#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force

;Settings
whichAlt:=1
Menu, tray, add
Menu, tray, add, Swap alt, SwapAlt

;Key / mouse rebindings
;For remapping capslock to control and escape I use https://gist.github.com/sedm0784/4443120

XButton1 & WheelLeft::Send ^#{Left}
XButton1 & WheelRight::Send ^#{Right}

;Chrome specific mouse aids
#IfWinActive ahk_exe chrome.exe 
{
	WheelLeft::Send ^+{Tab}
	WheelRight::Send ^{Tab}
	XButton1 & LButton::Send ^w
	XButton1 & RButton::Send ^+t
	XButton1 & MButton::XButton2
	XButton1::XButton1
}
#IfWinActive

#if whichAlt=1
	$LAlt::
			layer:=1
	return
	$LAlt up::
		#if layer=1
    	layer:=0
	return
return

#if whichAlt=2
	$RAlt::
    layer:=1
	return
	$RAlt up::
		#if layer=1
    	layer:=0
	return
return

;Layer ONE
#if layer=1

;Navigation
h::Left
j::Up
k::Down
l::Right
u::Home
i::End
^j::Send, {WheelUp}
^k::Send, {WheelDown}


BackSpace::Delete

f::
	SetKeyDelay, 200
	Send +{F10}
	Sleep, 200
	Send {DOWN}     
	Sleep, 200
	Send {ENTER}
return

`::
IfWinExist Untitled - Notepad
{
	WinClose
	IfWinExist Notepad
    {
		Send, {Tab}
		Sleep, 200
		Send, {Enter}
    }
}
else
	Run notepad.exe
return

return ;Now we can define subroutines

SwapAlt:
	temp:="Right Alt"
	if whichAlt=1
		whichAlt:=2
	else if whichAlt=2
	{
		whichAlt:=1
		temp:="Left Alt"
	}
	msgbox, %temp%
return
