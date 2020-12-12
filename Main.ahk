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

; Caps lock to ctrl and esc https://gist.github.com/sedm0784/4443120
g_LastCtrlKeyDownTime := 0
g_AbortSendEsc := false
g_ControlRepeatDetected := false

*CapsLock::
    if (g_ControlRepeatDetected)
    {
        return
    }

    send,{Ctrl down}
    g_LastCtrlKeyDownTime := A_TickCount
    g_AbortSendEsc := false
    g_ControlRepeatDetected := true

    return

*CapsLock Up::
    send,{Ctrl up}
    g_ControlRepeatDetected := false
    if (g_AbortSendEsc)
    {
        return
    }
    current_time := A_TickCount
    time_elapsed := current_time - g_LastCtrlKeyDownTime
    if (time_elapsed <= 250)
    {
        SendInput {Esc}
    }
    return

~*^a::
~*^b::
~*^c::
~*^d::
~*^e::
~*^f::
~*^g::
~*^h::
~*^i::
~*^j::
~*^k::
~*^l::
~*^m::
~*^n::
~*^o::
~*^p::
~*^q::
~*^r::
~*^s::
~*^t::
~*^u::
~*^v::
~*^w::
~*^x::
~*^y::
~*^z::
~*^1::
~*^2::
~*^3::
~*^4::
~*^5::
~*^6::
~*^7::
~*^8::
~*^9::
~*^0::
~*^Space::
~*^Backspace::
~*^Delete::
~*^Insert::
~*^Home::
~*^End::
~*^PgUp::
~*^PgDn::
~*^Tab::
~*^Return::
~*^,::
~*^.::
~*^/::
~*^;::
~*^'::
~*^[::
~*^]::
~*^\::
~*^-::
~*^=::
~*^`::
~*^F1::
~*^F2::
~*^F3::
~*^F4::
~*^F5::
~*^F6::
~*^F7::
~*^F8::
~*^F9::
~*^F10::
~*^F11::
~*^F12::
    g_AbortSendEsc := true
    return

; Key / mouse rebindings

; DPI buttons to WheelLeft/Right
#InputLevel, 10
F13::Send, {WheelLeft}
F14::Send, {WheelRight}
#InputLevel, 0

; XButton binds
XButton1 & WheelLeft::Send, ^#{Left}
XButton1 & WheelRight::Send, ^#{Right}
XButton1 & MButton::Send, #{Tab}
XButton1 & WheelUp::ShiftAltTab
XButton1 & WheelDown::AltTab

; Chrome specific mouse aids
#IfWinActive ahk_exe chrome.exe
{
	; Horizontal scroll changes tabs
	WheelLeft::Send ^+{Tab}
	WheelRight::Send ^{Tab}
	; Back + Left/Right closes or restores tabs
	XButton1 & LButton::Send ^w
	XButton1 & RButton::Send ^+t
	; Back + Middle is forward jk mouse has forward now
	; XButton1 & MButton::XButton2
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

::/copyright::©
::/tm::™
::/r::®
::/deg::°
::/root::√
::/sqrt::√
::/inf::∞
::/infinity::∞
::/!=::≠
::/notequal::≠
::/pi::π
::/tau::τ
::/not::¬
::/or::∪
::/union::∪
::/and::∩
::/intersection::∩
::/subset::⊆
::/notsubset::⊄
::/superset::⊇
::/notsuperset::⊅
::/element::∈
::/in::∈
::/notelement::∉
::/empty::∅
::/forall::∀
::/therefore::∴

; Language chareters
:*?:/a``::á
:*?:/e``::é
:*?:/i``::í
:*?:/o``::ó
:*?:/u``::ú
:*?:/n~::ñ
:*?:/a`::::ä
:*?:/e`::::ë
:*?:/i`::::ï
:*?:/o`::::ö
:*?:/u`::::ü
:*?:/ae::æ

:*?:/??::¿
:*?:/!!::¡

#S::
WinMove, A,, 260, 90, 1400, 900
return

#D::
WinMove, A,, 90, 50, 1740, 980
return

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

; Layer ONE
#if layer=1
	; Navigation
	h::Left
	j::Down
	k::Up
	l::Right
	u::Home
	i::End

	; Desktops
	y::Send, ^#{Left}
	o::Send, ^#{Right}
	p::Send, #{Tab}

	; Mouse
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

	; Mouse macros
	a::AllMouse("a")
	z::AllMouse("z")
	x::AllMouse("x")

	.::Winset, Alwaysontop, , A

	BackSpace::Delete

	; F keys
	F1::F13
	F2::F14
	F3::F15
	F4::F16
	F5::F17
	F6::F18
	F7::F19
	F8::F20
	F9::F21
	F10::F22
	F11::F23
	F12::F24

	; Color Picker
	c::
	MouseGetPos, MouseX, MouseY
	PixelGetColor, color, %MouseX%, %MouseY%, RGB
	color := SubStr(color, 3, 6)
	color = #%color%
	ToolTip, %color%
	SetTimer, RemoveToolTip, -2000
	Clipboard := color
	return

	; Applications
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

	+`:: ; Launch / Close Paint
	SetTitleMatchMode, 2
	IfWinExist Untitled - Paint
	{
		WinClose
		IfWinExist Paint
		{
			WinActivate Paint
			Send, {Tab}
			Sleep, 200
			Send, {Enter}
		}
	}
	else
		Run mspaint.exe
	SetTitleMatchMode, 1
	return
return

RemoveToolTip:
	ToolTip
Return

; Make sure you declare all of these variables as global
mposax:=0
mposay:=0
mposzx:=0
mposzy:=0
mposxx:=0
mposxy:=0

AllMouse(keyname) {
	KeyWait, %keyname%, T0.5
		err:=ErrorLevel
		if err { ; Hold
			SetMouse(keyname)
		}
		else {   ; Tap
			LoadMouse(keyname)
		}
}

SetMouse(keyname) { ; This makes my head hurt
	namex=mpos%keyname%x
	namey=mpos%keyname%y
	MouseGetPos, %namex%, %namey%
	varx:=%namex%
	vary:=%namey%
	ToolTip, %varx% %vary%
	SetTimer, RemoveToolTip, -2000
}

LoadMouse(keyname) { ; Makes my head hurt but less
	varx:=mpos%keyname%x
	vary:=mpos%keyname%y	
	MouseMove, %varx%, %vary%
}


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