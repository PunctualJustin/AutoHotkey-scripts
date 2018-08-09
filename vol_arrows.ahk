/*
 *	For those who don't have multimedia keys on their keyboard or just don't want 
 *	to find them. Since most apps will have their own simple multimedia controls such
 *	as space to play/pause, volume is the only thing left
 *
 *	@author: Justin Gaudet
 */

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#SingleInstance force

^Up::
	Send {Volume_Up}
Return

^Down::
	Send {Volume_Down}
Return