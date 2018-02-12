#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force

;key rebindings
CapsLock::Escape

layer:=0

LAlt::
    layer:=1
return

LAlt up::
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

AppsKey::
	SetKeyDelay, 200 ; can't be too low, 200 might be lowest, 
				    ; to accommodate lifting both hands from keys, 
				 ; otherwise it passes {ENTER}
	Send +{F10}
	Send {DOWN}     
	Sleep, 400     ; slow enough to see the menu, fast enough to not take too long
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