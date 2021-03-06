#NoEnv
#Warn 

SendMode Input
SetWorkingDir %A_ScriptDir%  

/*
  Melee spam macro while walking forward
  Useful for completing "Carving spike" combo
*/

/*
	Keybinds:
	Go to https://autohotkey.com/docs/KeyList.htm to find the list of controls
	Modifiers are listed here : https://autohotkey.com/docs/Hotkeys.htm#Symbols
*/
spamKey := "e"
meleeKey := "e"
forwardKey := "w"
disableKey := "7"

frequency := 100

;Setup
period  := (1/frequency)*1000
disabled := false

Hotkey, *%spamKey%, startSpam
Hotkey, *%disableKey%, toggleLock

loop:
	if(GetKeyState(spamKey,"P"))
		Send, %meleeKey%
	else{
		SetTimer, loop, Off
		if (not GetKeyState(forwardKey,"P"))
			Send, {%forwardKey% up}
	}
return

startSpam:
	SetTimer, loop, %period%
	Send, {%forwardKey% down}
return

toggleLock:
	if (disabled){
		disabled := false
		SoundBeep, 400, 100
		sleep, 50
		SoundBeep, 440, 100
		Hotkey, *%spamKey%, On
	}
	else{
		disabled := true
		SoundBeep, 440, 100
		sleep, 50
		SoundBeep, 400, 100
		Hotkey, *%spamKey%, Off
	}
return