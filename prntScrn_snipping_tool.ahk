/*
 *	Opens the Snipping Tool when you hit the print screen key.
 *
 *	@author: Justin Gaudet
 */

#SingleInstance force

PrintScreen::
	Run %windir%\system32\SnippingTool.exe
	Return