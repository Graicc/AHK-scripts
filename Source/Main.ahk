#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force

;Key / mouse rebindings
$CapsLock::Escape
WheelLeft::Send ^+{Tab}
WheelRight::Send ^{Tab}
XButton1 & LButton::Send ^w
XButton1 & RButton::Send ^+t
XButton1 & WheelLeft::Send ^#{Left}
XButton1 & WheelRight::Send ^#{Right}
XButton1 & MButton::XButton2
XButton1::XButton1

layer:=0

$LAlt::
    layer:=1
return

$LAlt up::
	#if layer=1
    	layer:=0
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

BackSpace::Delete

f::
	SetKeyDelay, 200
	Send +{F10}
	Send {DOWN}     
	Sleep, 400
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
