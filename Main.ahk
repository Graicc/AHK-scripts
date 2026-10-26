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

; Switching desktops
XButton1 & WheelLeft::Send, ^#{Left}
XButton1 & WheelRight::Send, ^#{Right}
XButton1 & p::Winset, Alwaysontop, , A

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

; Layer ONE
#if layer=1
	; Navigation
	h::Left
	j::Down
	k::Up
	l::Right
	u::Home
	i::End
	y::StepDesktop(-1)
	o::StepDesktop(1)

	; Jump to desktop N
	1::GoToDesktop(1)
	2::GoToDesktop(2)
	3::GoToDesktop(3)
	4::GoToDesktop(4)
	5::GoToDesktop(5)

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

	; Focus window by screen quadrant
	z::FocusQuadrant(0, 0)
	x::FocusQuadrant(1, 0)
	c::FocusQuadrant(0, 1)
	v::FocusQuadrant(1, 1)

	; Snap active window to quadrant
	^z::SnapActiveToQuadrant(0, 0)
	^x::SnapActiveToQuadrant(1, 0)
	^c::SnapActiveToQuadrant(0, 1)
	^v::SnapActiveToQuadrant(1, 1)

	BackSpace::Delete

	; Color Picker
	b::
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


; Uses VirtualDesktopAccessor.dll (instant switch) if it sits next to this script,
; otherwise steps there with Ctrl+Win+Left/Right (animated)
HasVda() {
	static vda := ""
	if (vda = "") {
		vda := DllCall("LoadLibrary", "Str", A_ScriptDir "\VirtualDesktopAccessor.dll", "Ptr")
	}
	return vda
}

StepDesktop(delta) {
	if (!HasVda()) {
		dir := delta > 0 ? "Right" : "Left"
		Send, ^#{%dir%}
		return
	}

	target := DllCall("VirtualDesktopAccessor\GetCurrentDesktopNumber", "Int") + delta
	count := DllCall("VirtualDesktopAccessor\GetDesktopCount", "Int")
	if (target >= 0 && target < count) {
		VdaGoTo(target)
	}
}

; Focusing the desktop (present on every desktop) first stops windows on the target
; desktop flashing; the taskbar would also work but pops up when auto-hidden
VdaGoTo(index) {
	WinActivate, ahk_class Progman
	DllCall("VirtualDesktopAccessor\GoToDesktopNumber", "Int", index)
	Sleep, 50
	FocusTopWindowOnDesktop(index)
}

FocusTopWindowOnDesktop(index) {
	; WinGet list is in z-order, topmost first
	WinGet, wins, List
	Loop, %wins% {
		hwnd := wins%A_Index%
		if (!IsFocusableWindow(hwnd)) {
			continue
		}
		if (DllCall("VirtualDesktopAccessor\IsWindowOnDesktopNumber", "Ptr", hwnd, "Int", index, "Int") = 1) {
			WinActivate, ahk_id %hwnd%
			return
		}
	}
}

IsFocusableWindow(hwnd) {
	WinGetTitle, title, ahk_id %hwnd%
	WinGetClass, cls, ahk_id %hwnd%
	WinGet, exStyle, ExStyle, ahk_id %hwnd%
	WinGet, minMax, MinMax, ahk_id %hwnd%
	return !(title = "" || minMax = -1 || (exStyle & 0x80) || cls = "Shell_TrayWnd" || cls = "Progman" || cls = "WorkerW")
}

; Windows on other virtual desktops are cloaked
IsCloaked(hwnd) {
	VarSetCapacity(cloaked, 4, 0)
	DllCall("dwmapi\DwmGetWindowAttribute", "Ptr", hwnd, "UInt", 14, "Ptr", &cloaked, "UInt", 4)
	return NumGet(cloaked, 0, "UInt") != 0
}

IsFullscreen(hwnd) {
	WinGet, minMax, MinMax, ahk_id %hwnd%
	if (minMax = 1) {
		return true
	}
	WinGetPos, x, y, w, h, ahk_id %hwnd%
	SysGet, monitors, MonitorCount
	Loop, %monitors% {
		SysGet, m, Monitor, %A_Index%
		if (x <= mLeft && y <= mTop && x + w >= mRight && y + h >= mBottom) {
			return true
		}
	}
	return false
}

; Windows on this desktop that are (or aren't) fullscreen, sorted by exe name then title
GetSortedWindows(fullscreen) {
	list := ""
	WinGet, wins, List
	Loop, %wins% {
		hwnd := wins%A_Index%
		if (!IsFocusableWindow(hwnd) || IsCloaked(hwnd) || IsFullscreen(hwnd) != fullscreen) {
			continue
		}
		WinGet, exe, ProcessName, ahk_id %hwnd%
		WinGetTitle, title, ahk_id %hwnd%
		list .= exe " " title "`t" hwnd "`n"
	}
	list := RTrim(list, "`n")
	Sort, list
	result := []
	Loop, Parse, list, `n
	{
		result.Push(SubStr(A_LoopField, InStr(A_LoopField, "`t", false, 0) + 1))
	}
	return result
}

; If this desktop has fullscreen windows, focus the Nth window (Z/X/C/V = 1-4),
; counting fullscreen windows first, then the rest. Otherwise focus the topmost
; window whose centre is in the given quadrant of the monitor holding the active
; window (or the mouse, if nothing is active)
FocusQuadrant(right, bottom) {
	ordered := GetSortedWindows(true)
	if (ordered.Length()) {
		for i, hwnd in GetSortedWindows(false) {
			ordered.Push(hwnd)
		}
		hwnd := ordered[1 + right + 2 * bottom]
		if (hwnd) {
			FocusAndCenterMouse(hwnd)
		}
		return
	}

	CoordMode, Mouse, Screen
	WinGetPos, ax, ay, aw, ah, A
	if (aw = "") {
		MouseGetPos, px, py
	}
	else {
		px := ax + aw // 2
		py := ay + ah // 2
	}

	SysGet, monitors, MonitorCount
	Loop, %monitors% {
		SysGet, m, MonitorWorkArea, %A_Index%
		if (px >= mLeft && px < mRight && py >= mTop && py < mBottom) {
			break
		}
	}
	midX := (mLeft + mRight) // 2
	midY := (mTop + mBottom) // 2

	WinGet, wins, List
	Loop, %wins% {
		hwnd := wins%A_Index%
		if (!IsFocusableWindow(hwnd) || IsCloaked(hwnd)) {
			continue
		}
		WinGetPos, x, y, w, h, ahk_id %hwnd%
		cx := x + w // 2
		cy := y + h // 2
		if (cx < mLeft || cx >= mRight || cy < mTop || cy >= mBottom) {
			continue
		}
		if ((cx >= midX) = right && (cy >= midY) = bottom) {
			FocusAndCenterMouse(hwnd)
			return
		}
	}
}

; Resize the active window to a quarter of its monitor's work area
SnapActiveToQuadrant(right, bottom) {
	WinGet, hwnd, ID, A
	if (!hwnd) {
		return
	}
	WinGet, minMax, MinMax, ahk_id %hwnd%
	if (minMax != 0) {
		WinRestore, ahk_id %hwnd%
	}

	WinGetPos, x, y, w, h, ahk_id %hwnd%
	cx := x + w // 2
	cy := y + h // 2
	SysGet, monitors, MonitorCount
	Loop, %monitors% {
		SysGet, m, MonitorWorkArea, %A_Index%
		if (cx >= mLeft && cx < mRight && cy >= mTop && cy < mBottom) {
			break
		}
	}

	; Windows have invisible resize borders; size so the visible frame fills the quadrant
	VarSetCapacity(rect, 16, 0)
	DllCall("dwmapi\DwmGetWindowAttribute", "Ptr", hwnd, "UInt", 9, "Ptr", &rect, "UInt", 16)
	padL := NumGet(rect, 0, "Int") - x
	padT := NumGet(rect, 4, "Int") - y
	padR := x + w - NumGet(rect, 8, "Int")
	padB := y + h - NumGet(rect, 12, "Int")

	halfW := (mRight - mLeft) // 2
	halfH := (mBottom - mTop) // 2
	qx := mLeft + right * halfW
	qy := mTop + bottom * halfH
	WinMove, ahk_id %hwnd%, , qx - padL, qy - padT, halfW + padL + padR, halfH + padT + padB
}

FocusAndCenterMouse(hwnd) {
	WinActivate, ahk_id %hwnd%
	CoordMode, Mouse, Screen
	WinGetPos, x, y, w, h, ahk_id %hwnd%
	MouseMove, x + w // 2, y + h // 2, 0
}

GoToDesktop(n) {
	if (HasVda()) {
		VdaGoTo(n - 1)
		return
	}

	key := "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VirtualDesktops"
	RegRead, ids, %key%, VirtualDesktopIDs
	RegRead, cur, %key%, CurrentVirtualDesktop
	count := StrLen(ids) // 32
	if (n > count || cur = "") {
		return
	}

	current := 1
	Loop, %count% {
		if (SubStr(ids, (A_Index - 1) * 32 + 1, 32) = cur) {
			current := A_Index
			break
		}
	}

	delta := n - current
	dir := delta > 0 ? "Right" : "Left"
	Loop, % Abs(delta) {
		Send, ^#{%dir%}
		Sleep, 50
	}
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