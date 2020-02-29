; AHK Settings
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
#MaxHotkeysPerInterval 200
#SingleInstance force

; Custom tray menu
Menu, tray, Icon, icon.png
Menu, tray, NoStandard
Menu, tray, add, Reload, Reload
Menu, tray, Default, Reload
Menu, tray, add, Exit, Exit

Menu, tray, add

global whichAlt:=2
Menu, tray, add, Right Alt, SwapAlt

Load() ; Load Settings

; Save on exit
OnExit("Save")

; Setting togglable keys
SetNumLockState, On
SetCapsLockState, Off

; Key / mouse rebindings
; For remapping capslock to control and escape I use https://gist.github.com/sedm0784/4443120

; Switching desktops
XButton1 & WheelLeft::Send, ^#{Left}
XButton1 & WheelRight::Send, ^#{Right}

; Chrome specific mouse aids
#IfWinActive ahk_exe chrome.exe
{
	; Horizontal scroll changes tabs
	WheelLeft::Send ^+{Tab}
	WheelRight::Send ^{Tab}
	; Back + Left/Right closes or restores tabs
	XButton1 & LButton::Send ^w
	XButton1 & RButton::Send ^+t
	; Back + Middle is forward
	XButton1 & MButton::XButton2
	XButton1::XButton1
}
#IfWinActive

; Media controls
; New keyboard so these aren't necessary
; ^Volume_Mute::Media_Play_Pause
; ^Volume_Down::Media_Prev
; ^Volume_Up::Media_Next

; I figured this out on my own im literally einstien
!Volume_Up::+Tab
^Volume_Up::+Tab

!Volume_Down::Tab
^Volume_Down::Tab

; <!Volume_Up::ShiftAltTab ; Works but isn't as cool
; <!Volume_Down::AltTab

; don't have a sleep key rip
Media_Stop::DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)
^Media_Stop::Media_Stop

; Hotstrings
::/ahk date::
	FormatTime, CurrentDateTime,, M/d/yy
	SendInput %CurrentDateTime%
return

::/ahk time::
	FormatTime, CurrentDateTime,, h:mm tt
	SendInput %CurrentDateTime%
return

::/shrug::¯\_(ツ)_/¯
::/lenny::( ͡° ͜ʖ ͡°)
::/table::(╯°□°）╯︵ ┻━┻
::/untable::┬──┬◡ﾉ(° -°ﾉ)

::/c::©
::/tm::™
::/r::®
::/root::√
::/sqrt::√
::/inf::∞
::/infinity::∞
::/!=::≠

; Spanish chareters
:*?:/a``::á
:*?:/e``::é
:*?:/i``::í
:*?:/o``::ó
:*?:/u``::ú
:*?:/n~::ñ
:*?:/uu::ü
:*?:/??::¿
:*?:/!!::¡

; Layer switching
#if whichAlt=1
	$LAlt::layer:=1
	$LAlt up::
		#if layer=1
			layer:=0
		return
	return
return

#if whichAlt=2
	$RAlt::layer:=1
	$RAlt up::
		#if layer=1
			layer:=0
		return
	return
return

#if
$AppsKey::
	layer:=2
return
$AppsKey up::
	#if layer=2
		layer:=0
	return
return

; Menu key app shortcuts
#if layer=2
	c::Run chrome
	v::Run code
	u::Run ubuntu
	f::Run explorer
	s::Run spotify
return

; Scroll Lock Toggles Workman Layout
#if GetKeyState("ScrollLock", "T")
	;`::`
	;1::1
	;2::2
	;3::3
	;4::4
	;5::5
	;6::6
	;7::7
	;8::8
	;9::9
	;0::0
	;-::-
	;=::=

	;q::q
	w::d
	e::r
	r::w
	t::b
	y::j
	u::f
	i::u
	o::p
	p::`;
	;[::[
	;]::]
	;\::\

	;a::a
	;s::s
	d::h
	f::t
	;g::g
	h::y
	j::n
	k::e
	l::o
	`;::i
	;'::'

	;z::z
	;x::x
	c::m
	v::c
	b::v
	n::k
	m::l
	;,::,
	;.::.
	;/::/
return

; ; Num Lock Toggles emojis and settings
; #if !GetKeyState("NumLock", "T")
; 	;NumpadIns:: ; 0
; 	NumpadEnd::Send, ¯\_(ツ)_/¯ ; 1
; 	NumpadDown::Send, (╯°□°）╯︵ ┻━┻ ; 2
; 	+NumpadDown::Send, ┬──┬◡ﾉ(° -°ﾉ) ; #2
; 	NumpadPgdn::Send, ( ͡° ͜ʖ ͡°) ; 3
; 	;NumpadLeft:: ; 4
; 	;NumpadClear:: ; 5
; 	;NumpadRight:: ; 6
; 	;NumpadHome:: ; 7
; 	;NumpadUp:: ; 8
; 	;NumpadPgup:: ; 9
; 	;NumpadDiv::Reload ; /
; 	;NumpadMult::Suspend ; *
; 	;NumpadSub:: ; -
; 	;NumpadAdd:: ; +
; 	;NumpadEnter:: ; Enter
; 	;NumpadDel:: ; Del
; return

; Layer ONE
#if layer=1
	; Navigation
	h::Left
	j::Down
	k::Up
	l::Right
	u::Home
	i::End

	SetDefaultMouseSpeed, 0 ; Sets the delay of mouse speed to instant
	e::MouseMove, 0, -25, 100, R
	d::MouseMove, 0, 25, 100, R
	s::MouseMove, -25, 0, 100, R
	f::MouseMove, 25, 0, 100, R
	+e::MouseMove, 0, -5, 100, R
	+d::MouseMove, 0, 5, 100, R
	+s::MouseMove, -5, 0, 100, R
	+f::MouseMove, 5, 0, 100, R
	^e::MouseMove, 0, -100, 100, R
	^d::MouseMove, 0, 100, 100, R
	^s::MouseMove, -100, 0, 100, R
	^f::MouseMove, 100, 0, 100, R
	r::LButton
	w::RButton
	q::MButton
	t::WheelUp
	g::WheelDown

	BackSpace::Delete

	`:: ; Launch / Close NotePad
	SetTitleMatchMode, 2
	IfWinExist Untitled - Notepad
	{
		WinClose
		IfWinExist Notepad
		{
			WinActivate Notepad
			Send, {Tab}
			Sleep, 200
			Send, {Enter}
		}
	}
	else
		Run notepad.exe
	SetTitleMatchMode, 1


return

SwapAlt() {
	if (whichAlt = 1) {
		whichAlt:=2
	}
	else if (whichAlt = 2)
	{
		whichAlt:=1
	}
	Menu, tray, ToggleCheck, Right alt
}

Reload() {
	Reload
}

Exit() {
	ExitApp
}

Save() {
	; Save settings
	global whichAlt
	IniWrite, %whichAlt%, %A_ScriptDir%\settings.ini, settings, whichAlt
}

Load() {
	; Loading settings
	IniRead, whichAlt, settings.ini, settings, whichAlt, 2
	; Setting Checkboxes
	if (whichAlt==2) {
		Menu, tray, ToggleCheck, Right Alt
	}
}