;set so that you can find windows with only partial window names
SetTitleMatchMode, 2
;Ensure Scroll Lock key is off.  Ran into an issue once where it was on and I didnt know why the script wasnt running correctly.
SetScrollLockState, Off

FolderPath := "C:\STORAGE\TRADING\Chart Pictures"	;Main folder path for saving images

; GUI for user to input Month, Day, Year, Number of Symbols, and Symbols
Gui, Add, Text, x40 y1 w200 h100, 
Gui, Add, Text, x40 y40 w200 h100, 'Print Screen' button to capture image
Gui, Add, Text, x40 y60 w200 h100, 
Gui, Add, Text, x40 y152 w60 h20, Month (mm):
Gui, Add, Edit, x102 y150 w60 h20 +Number vmonth, %A_MM%
Gui, Add, Text, x40 y182 w60 h20, Day (dd):
Gui, Add, Edit, x102 y180 w60 h20 +Number vday, %A_DD%
Gui, Add, Text, x40 y212 w60 h20, Year (yyyy):
Gui, Add, Edit, x102 y210 w60 h20 +Number vyear, %A_YYYY%

Gui, Add, Button, x40 y350 w120 h20 gContinue, Do It
Gui, Show
return

Continue:
Gui, submit, hide



;PREPARATION
Gosub, ReminderOnLaptop
Gosub, CreateFolderForFiles

	PrintScreen::

		Gosub, GetTickerSymbol
		Gosub, CopyChart2

	return


	^PrintScreen::

		Gosub, GetTickerSymbol
		Gosub, CopyChart3

	return
	
	
	!PrintScreen::

		Gosub, GetTickerSymbol
		Gosub, CopyChart4

	return

ExitApp
esc::exitapp







;------------------------------------------------------------------------------------------------------------------------
CopyChart2:

;Open window, find TradingView tab
;~ winactivate, Mozilla Firefox
;~ Sleep, 200

if (computername = "PAULYB-PC") {
	
	;Save Screenshot
	StringUpper, UpTicker, A_LoopField	;converts the variable to upper case 
	;~ file1 := "\\PAULYB-PC\Chart Pictures\" Year "\" Month "\" Month "." Day "." Year "\" Month "." Day "." Year " " Ticker " Chart 2.png"
	file1 := FolderPath "\" Year "\" Month "\" Month "." Day "." Year "\" Month "." Day "." Year " " Ticker " Chart 2.png"
	Screenshot1(file1)
	return


	
} else if (computername = "PAULD_LAPTOP-PC") {

	;Save Screenshot
	StringUpper, UpTicker, A_LoopField	;converts the variable to upper case 
	file2 := "\\PAULYB-PC\Chart Pictures\" Year "\" Month "\" Month "." Day "." Year "\" Month "." Day "." Year " " Ticker " Chart 2.png"
	Screenshot2(file2)
	return

}

return




;------------------------------------------------------------------------------------------------------------------------
CreateFolderForFiles:

;~ Folder for Chart Pictures
If( InStr( FileExist(FolderPath year "\" month "\" month "." day "." year), "D") ) {

} else {
	FileCreateDir, %FolderPath%\%year%\%month%\%month%.%day%.%year%
}

return







;------------------------------------------------------------------------------------------------------------------------
GetTickerSymbol:

	;Get open ticker
	CoordMode, Mouse, Screen

	WinGetTitle,Title,A
	title_array := StrSplit(Title, A_Space)
	Ticker := title_array[1]
	
	;MsgBox, %  title_array[1]

return






;------------------------------------------------------------------------------------------------------------------------
ReminderOnLaptop:

	if (computername = "PAULD_LAPTOP-PC") {
		MsgBox Remember to make browser full screen.
	}
	
return






;------------------------------------------------------------------------------------------------------------------------
CopyChart3:

;Open window, find TradingView tab
;~ winactivate, Mozilla Firefox
;~ Sleep, 200

if (computername = "PAULYB-PC") {
	
	;Save Screenshot
	StringUpper, UpTicker, A_LoopField	;converts the variable to upper case 
	file3 := FolderPath "\" Year "\" Month "\" Month "." Day "." Year "\" Month "." Day "." Year " " Ticker " Chart 3.png"
	Screenshot1(file3)
	return
	
} else if (computername = "PAULD_LAPTOP-PC") {

	;Save Screenshot
	StringUpper, UpTicker, A_LoopField	;converts the variable to upper case 
	file4 := "\\PAULYB-PC\Chart Pictures\" Year "\" Month "\" Month "." Day "." Year "\" Month "." Day "." Year " " Ticker " Chart 3.png"
	Screenshot2(file4)
	return

}

return






;------------------------------------------------------------------------------------------------------------------------
CopyChart4:

;Open window, find TradingView tab
;~ winactivate, Mozilla Firefox
;~ Sleep, 200

if (computername = "PAULYB-PC") {
	
	;Save Screenshot
	StringUpper, UpTicker, A_LoopField	;converts the variable to upper case 
	file5 := FolderPath "\" Year "\" Month "\" Month "." Day "." Year "\" Month "." Day "." Year " " Ticker " Chart 4.png"
	Screenshot1(file5)
	return
	
} else if (computername = "PAULD_LAPTOP-PC") {

	;Save Screenshot
	StringUpper, UpTicker, A_LoopField	;converts the variable to upper case 
	file6 := "\\PAULYB-PC\Chart Pictures\" Year "\" Month "\" Month "." Day "." Year "\" Month "." Day "." Year " " Ticker " Chart 4.png"
	Screenshot2(file6)
	return
	
}

return





Screenshot1(outfile1)
{
	pToken := Gdip_Startup()

	;~ screen=0|0|%A_ScreenWidth%|%A_ScreenHeight%

	screen=588|125|1839|1219
	pBitmap := Gdip_BitmapFromScreen(screen)

	Gdip_SaveBitmapToFile(pBitmap, outfile1, 100)
	Gdip_DisposeImage(pBitmap)
	Gdip_Shutdown(pToken)
}



Screenshot2(outfile2)
{
	pToken := Gdip_Startup()

	;~ screen=0|0|%A_ScreenWidth%|%A_ScreenHeight%

	screen=58|40|1332|775
	pBitmap := Gdip_BitmapFromScreen(screen)

	Gdip_SaveBitmapToFile(pBitmap, outfile2, 100)
	Gdip_DisposeImage(pBitmap)
	Gdip_Shutdown(pToken)
}