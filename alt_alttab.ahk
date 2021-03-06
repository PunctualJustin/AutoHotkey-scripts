﻿/*
 *	When you're running Remote Desktop and want most of the functions to be passed to 
 *	the remote computer, but still want to keep some for the local machine. 
 *	i.e. Virtual Desktop switching shortcuts.
 *	
 *	NOTE 1: Run this on the local machine with "Apply Windows key combinations" set to 
 *	"On this computer".
 *	
 *	NOTE 2: Win + D will only work when in full screen
 *
 *	@author: Justin Gaudet
 */

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force
SetTitleMatchMode, RegEx

#IfWinActive ahk_class TscShellContainerClass

	;ALT+TAB
		
		<!Tab::
			SendInput, {LAlt Down}{PgUp}
			Return

		<!+Tab::
			SendInput, {LAlt Down}{PgDn}
			Return

	;WinKey+D ;show desktop
	Fired:=0
	LWin & d::
		Fired:=1
		MouseGetPos, x, y
		WinGetPos, , , ScrWdth, ScrHght
		;MouseClick, L, (ScrWdth-12), (ScrHght-12),, 0
		MouseClick, L, ScrWdth, ScrHght,, 0
		MouseMove, x, y, 0
		Return
		
	;WinKey+R ;open run
	#r::
		Fired = 1
		send {LAlt Down}{Home Down}run{Home Up}{LAlt up}
		Return
		
	;Windows key
	LWin Up::
	RWin Up::
		if Fired = 0
		{
			sendInput, {LAlt Down}{Home}{LAlt up}
		}
		else
		{
			Fired:=0
		}
		Return
	
	;when switching virtual desktops, don't trigger startmenu via WinKey
	~#^Left::
	~#^Right::
		Fired:=1
		Return

#IfWinActive