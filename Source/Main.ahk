﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
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

;Arrow keys
h::Left
j::Up
k::Down
l::Right

;Function keys
q::F1
w::F2
e::F3
r::F4
t::F5
y::F6
u::F7
i::F8
o::F9
p::F10
[::F11
]::F12

BackSpace::Delete

f::
	SetKeyDelay, 200 ; can't be too low, 200 might be lowest, 
				    ; to accommodate lifting both hands from keys, 
				 ; otherwise it passes {ENTER}
	Send +{F10}
	Send {DOWN}     
	Sleep, 400     ; slow enough to see the menu, fast enough to not take too long
	Send {ENTER}
return  

d::Backspace

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