; Minecraft Speedrun Companion
; Author:   ryguy2k4

;================================================================================================================================================
;Initialize
;================================================================================================================================================
#NoEnv
#SingleInstance force
SetWorkingDir %A_ScriptDir%
SetKeyDelay, 0
Mode = 0
pMode = 0
lsClosed = 0
n = 0
updateVariables()
Hotkey, %setSurvival%, setSurvival
Hotkey, %setCreative%, setCreative
Hotkey, %setSpectator%, setSpectator
Hotkey, %Borderless%, windowedBorderless
Hotkey, %Reset%, autoResetRSG
Hotkey, %resetBasPractice%, resetBasPractice
Hotkey, %startBasPractice%, startBasPractice
updateHotkeys()

;================================================================================================================================================
;First Time Set Up
;================================================================================================================================================
if (!readMe) {
	MsgBox, 4,, Have you read through the entirety of the ReadMe.md file on Github?
	IfMsgBox No
	{
		Run, https://github.com/ryguy2k4/speedruncompanion#readme
		ExitApp
	}
	else IfMsgBox Yes
	{
		readMe = 1
		saveVariables()
		Reload
	}
}
;================================================================================================================================================
;Main GUI
;================================================================================================================================================
gui, Main:new
gui, margin, 0, 0
gui, font, s8 italic, Comic Sans MS
gui, add, button, x91 y15 h30 w120 gstartRSGPractice vcontrolRSGP, Start RSG Practice
gui, add, button, x+10 h30 w120 gstartSSGPractice vcontrolSSGP, Start SSG Practice
gui, add, button, x31 y+20 h30 w120 gstartRSG, Start RSG
gui, add, button, x+10 h30 w120 gstartSSG vcontrolSSG, Start SSG
gui, add, button, x+10 h30 w120 gstartFSG vcontrolFSG, Start FSG
gui, add, progress, x91 y+20 h10 w250 vsavesProgress cgreen
gui, add, button, x91 y+10 h30 w120 gcloseAll, Close All Applications
gui, add, button, x+10 h30 w120 gclearSaves vcontrolClearSaves, Clear Saves Folder
gui, add, button, x156 y+10 h30 w120 geditSettings, Change Settings
gui, add, button, x5 y220 h20 w80 gReference, Reference
;gui, add, text, x150 y225, Check for updates often!
gui, add, button, x340 y220 h20 w45 greloadApp, Reload
gui, add, button, x390 y220 h20 w40 ghelp, Help
controlGUIMain(PracticeRSG1World, "controlRSGP")
controlGUIMain(PracticeSSG1World, "controlSSGP")
controlGUIMain(Seed, "controlSSG")
controlGUIMain(FSGGen, "controlFSG")
controlGUIMain(SavesPath, "controlClearSaves")
gui, show, w432 h244 x%posX% y%posY%, Speedrunning Companion
return
;================================================================================================================================================
; Main GUI Control Labels
;================================================================================================================================================
mainguiClose:
	WinGetPos, posX, posY,,, Speedrunning Companion
	saveVariables()
	ExitApp
	return
;================================================================================================================================================
;Settings GUI
;================================================================================================================================================
editSettings:
	gui, Settings:new
	gui, margin, 0, 0
	gui, add, tab3, w432 h650, General Settings|Speedrun Settings|Practice Settings
	gui, tab, 1
	gui, add, checkbox, x10 y25 gcontrolGSH vgmHotkeys Checked%gmHotkeys%, Gamemode Switcher Hotkeys
	gui, add, text, x10 y+5 w100 vsetSurvivalText, Set Survival
	gui, add, text, x+10 w100 vsetSpectatorText, Set Spectator
	gui, add, text, x+10 vsetCreativeText, Set Creative
	gui, add, edit, x10 y+2 w100 vsetSurvival, %setSurvival%
	gui, add, edit, x+10 w100 vsetSpectator, %setSpectator%
	gui, add, edit, x+10 w100 vsetCreative, %setCreative%
	gui, add, text, x10 y+0, ---------------------------------------------------------------------------------------------------------------------																	
	gui, add, text, x10 y+2, Choose Minecraft Launcher
	gui, add, dropdownlist, x10 Y+2 w201 vLauncher choose%Launcher% altsubmit, Official Launcher|MultiMC
	gui, add, text, x10 y+5, Minecraft Launcher Path
	gui, add, edit, x10 y+2 w412 vmcPath, %mcPath%
	gui, add, text, x10 y+5, Minecraft Saves Path
	gui, add, edit, x10 y+2 w412 vsavesPath, %savesPath%
	gui, add, text, x10 y+0, ---------------------------------------------------------------------------------------------------------------------																	
	gui, add, text, x10 y+2, Choose Window Mode
	gui, add, dropdownlist, x10 y+2 w201 gcontrolBorderless vwindowMode choose%windowMode% altsubmit, Windowed|Fullscreen
	gui, add, text, x10 y+5 vborderlessText, Toggle Windowed Borderless
	gui, add, edit, x10 y+2 w100 vBorderless, %Borderless%
	gui, add, checkbox, x10 y+5 vabusePlanar Checked%abusePlanar%, Abuse Planar in RSG
	gui, add, checkbox, x10 y+5 vautoPause Checked%autoPause%, Auto Pause Upon Reset
	gui, add, text, x10 y+0, ---------------------------------------------------------------------------------------------------------------------														
	gui, add, text, x10 y+2, Choose Recording Software
	gui, add, dropdownlist, x10 y+2 w201 gcontrolOBSSoftware vobsSoftware choose%obsSoftware% altsubmit, OBS Studio|Streamlabs OBS
	gui, add, text, x10 y+10, Recording Software Path
	gui, add, edit, x10 y+2 w412 vobsPath, %obsPath%
	gui, add, text, x10 y+5 vobsRecordText, Start/Stop Recording
	gui, add, edit, x10 y+2 w100 vobsRecord, %obsRecord%
	gui, add, text, x10 y+0, ---------------------------------------------------------------------------------------------------------------------														
	gui, add, text, x10 y+5, Livesplit Path
	gui, add, edit, x10 y+2 w412 vlsPath, %lsPath%
	gui, add, text, x10 y+5 w201, Start Timer
	gui, add, text, x+10, Reset Timer
	gui, add, edit, x10 y+2 w201 vlsStart, %lsStart%
	gui, add, edit, x+10 w201 vlsReset, %lsReset%
	gui, add, text, x10 y+5, LiveSplit Text Color
	gui, add, edit, x10 y+2 w201 vlsColor, %lsColor%
	gui, tab, 2
	gui, font, s10 bold
	gui, add, text, x10 y35, General Speedrun Settings
	gui, font,
	gui, add, text, x10 y+5 w201, Reset Hotkey
	gui, add, edit, x10 y+2 w100 vReset, %Reset%
	gui, font, s10 bold
	gui, add, text, x10 y+10, RSG Settings
	gui, font,
	gui, add, text, x10 y+5, Livesplit RSG Splits Path
	gui, add, edit, x10 y+2 w412 vlsRSGPath, %lsRSGPath%
	gui, add, text, x10 y+5, RSG Reset Tracker Path
	gui, add, edit, x10 y+2 w412 vtrPath, %trPath%
	gui, font, s10 bold
	gui, add, text, x10 y+10, SSG Settings
	gui, font,
	gui, add, text, x10 y+5, Livesplit SSG Splits Path
	gui, add, edit, x10 y+2 w412 vlsSSGPath, %lsSSGPath%
	gui, add, text, x10 y+5, SSG Seed
	gui, add, edit, x10 y+2 w201 vSeed, %Seed%
	gui, font, s10 bold
	gui, add, text, x10 y+10, FSG Settings
	gui, font,
	gui, add, text, x10 y+5, Livesplit FSG Splits Path
	gui, add, edit, x10 y+2 w412 vlsFSGPath, %lsFSGPath%
	gui, add, text, x10 y+5, Choose FSG Generator
	gui, add, dropdownlist, x10 y+2 vFSGGen gcontrolFSGGen choose%FSGGen% altsubmit, Auto Local|Manual
	gui, add, text, x10 y+5 vFSGPathText, Local FSG Generator Path
	gui, add, edit, x10 y+2 w412 vFSGPath, %FSGPath%
	gui, add, text, x10 y+5 vubuntuPathText, Ubuntu Path
	gui, add, edit, x10 y+2 w412 vubuntuPath, %ubuntuPath%
	gui, tab, 3
	gui, font, s10 bold
	gui, add, text, x10 y35, General Practice Settings
	gui, font,
	gui, add, text, x10 y+5, Cycle Practice Map
	gui, add, edit, x10 y+2 w110 vcyclePractice, %cyclePractice%
	gui, font, s10 bold
	gui, add, text, x10 y+10, FSG/RSG Practice Settings
	gui, font,
	gui, add, text, x10 y+5 w201, FSG/RSG Practice Map 1
	gui, add, checkbox, x+10 gcontrolRSGPM2 vpracticeRSG2 checked%practiceRSG2%, FSG/RSG Practice Map 2
	gui, add, edit, x10 y+2 w201 vpracticeRSG1World, %practiceRSG1World%
	gui, add, edit, x+10 w201 vpracticeRSG2World, %practiceRSG2World%
	gui, add, checkbox, x10 y+5 w201 gcontrolRSGPM3 vpracticeRSG3 checked%practiceRSG3%, FSG/RSG Practice Map 3
	gui, add, checkbox, x+10 gcontrolRSGPM4 vpracticeRSG4 checked%practiceRSG4%, FSG/RSG Practice Map 4
	gui, add, edit, x10 y+2 w201 vpracticeRSG3World, %practiceRSG3World%
	gui, add, edit, x+10 w201 vpracticeRSG4World, %practiceRSG4World%
	gui, add, text, x10 y+0, ---------------------------------------------------------------------------------------------------------------------														
	gui, add, checkbox, x10 y+5 gcontrolBPL vbastionPractice checked%bastionPractice%, I use the Speedrun Companion Bastion Practice Datapack
	gui, add, button, x10 y+10 h20 w201 geditBastionLoadouts vcontrolBPL, Edit Bastion Practice Loadouts
	gui, add, text, x10 y+5 w110 vstartBasPracticeText, Start Bastion Hotkey
	gui, add, text, x+10 vresetBasPracticeText, Reset Bastion Hotkey
	gui, add, edit, x10 y+2 w110 vstartBasPractice, %startBasPractice%
	gui, add, edit, x+10 w110 vresetBasPractice, %resetBasPractice%
	gui, add, text, x10 y+0, ---------------------------------------------------------------------------------------------------------------------														
	;gui, add, checkbox, x10 y+5 gcontrolPPL vperchPractice checked%perchPractice%, I use the Speedrun Companion Perch Practice Map
	;gui, add, button, x10 y+10 h20 w201 geditPerchLoadouts vcontrolPPL, Edit Perch Practice Loadouts
	;gui, add, text, x10 y+0, ---------------------------------------------------------------------------------------------------------------------														
	gui, font, s10 bold
	gui, add, text, x10 y+10, SSG Practice Settings
	gui, font,
	gui, add, text, x10 y+10 w201, SSG Practice Map 1
	gui, add, checkbox, x+10 gcontrolSSGPM2 vpracticeSSG2 checked%practiceSSG2%, SSG Practice Map 2
	gui, add, edit, x10 y+2 w201 vpracticeSSG1World, %practiceSSG1World%
	gui, add, edit, x+10 w201 vpracticeSSG2World, %practiceSSG2World%
	controlGUI(practiceRSG2, "practiceRSG2World")
	controlGUI(practiceRSG3, "practiceRSG3World")
	controlGUI(practiceRSG4, "practiceRSG4World")
	controlGUI(perchPractice, "controlPPL")
	controlGUI(bastionPractice, "controlBPL")
	controlGUI(bastionPractice, "startBasPractice")
	controlGUI(bastionPractice, "startBasPracticeText")
	controlGUI(bastionPractice, "resetBasPractice")
	controlGUI(bastionPractice, "resetBasPracticeText")
	controlGUI(practiceSSG2, "practiceSSG2World")
	controlGUI(gmHotkeys, "setSurvival")
	controlGUI(gmHotkeys, "setSurvivalText")
	controlGUI(gmHotkeys, "setCreative")
	controlGUI(gmHotkeys, "setCreativeText")
	controlGUI(gmHotkeys, "setSpectator")
	controlGUI(gmHotkeys, "setSpectatorText")
	controlGUI(windowMode, "abusePlanar")
	controlGUI(windowMode, "autoPause")
	controlGUI(windowMode, "Borderless")
	controlGUI(windowMode, "borderlessText")
	controlGUI(obsSoftware, "obsRecord")
	controlGUI(obsSoftware, "obsRecordText")
	controlGUI(FSGGen, "FSGPath")
	controlGUI(FSGGen, "FSGPathText")
	controlGUI(FSGGen, "ubuntuPath")
	controlGUI(FSGGen, "ubuntuPathText")
	gui, show, w432 h650, Settings
	return
;================================================================================================================================================
; Settings GUI Control Labels
;================================================================================================================================================
settingsGuiClose:
	gui, submit
	controlGUIMain(PracticeRSG1World, "controlRSGP")
	controlGUIMain(PracticeSSG1World, "controlSSGP")
	controlGUIMain(Seed, "controlSSG")
	controlGUIMain(SavesPath, "controlClearSaves")
	controlGUIMain(FSGGen, "controlFSG")
	saveVariables()
	updateHotkeys()
	return
controlPPL:
	gui, submit, NoHide
	controlGUI(perchPractice, "controlPPL")
	return
controlBPL:
	gui, submit, NoHide
	controlGUI(bastionPractice, "controlBPL")
	controlGUI(bastionPractice, "startBasPractice")
	controlGUI(bastionPractice, "startBasPracticeText")
	controlGUI(bastionPractice, "resetBasPractice")
	controlGUI(bastionPractice, "resetBasPracticeText")
	return
controlRSGPM2:
	gui, submit, NoHide
	controlGUI(practiceRSG2, "practiceRSG2World")
	return
controlRSGPM3:
	gui, submit, NoHide
	controlGUI(practiceRSG3, "practiceRSG3World")
	return
controlRSGPM4:
	gui, submit, NoHide
	controlGUI(practiceRSG4, "practiceRSG4World")
	return
controlSSGPM2:
	gui, submit, NoHide
	controlGUI(practiceSSG2, "practiceSSG2World")
	return
controlGSH:
	gui, submit, NoHide
	controlGUI(gmHotkeys, "setSurvival")
	controlGUI(gmHotkeys, "setSurvivalText")
	controlGUI(gmHotkeys, "setCreative")
	controlGUI(gmHotkeys, "setCreativeText")
	controlGUI(gmHotkeys, "setSpectator")
	controlGUI(gmHotkeys, "setSpectatorText")
	return
controlBorderless:
	gui, submit, NoHide
	controlGUI(windowMode, "abusePlanar")
	controlGUI(windowMode, "autoPause")
	controlGUI(windowMode, "Borderless")
	controlGUI(windowMode, "borderlessText")
	return
controlOBSSoftware:
	gui, submit, NoHide
	controlGUI(obsSoftware, "obsRecord")
	controlGUI(obsSoftware, "obsRecordText")
	return
controlFSGGen:
	gui, submit, NoHide
	controlGUI(FSGGen, "FSGPath")
	controlGUI(FSGGen, "FSGPathText")
	controlGUI(FSGGen, "ubuntuPath")
	controlGUI(FSGGen, "ubuntuPathText")
	return
;================================================================================================================================================
; GUI Button Labels
;================================================================================================================================================
closeAll:
	openMC(0)
	openLS(0)
	openTR(0)
	openOBS(0)
	openUbuntu(0)
	return
clearSaves:
	newWorlds = 0
	Loop, Files, %savesPath%\New World*, D
		newWorlds++
	GuiControl, +Range0-%newWorlds%, savesProgress
	Loop, Files, %savesPath%\New World*, D
	{
		FileRemoveDir, %A_LoopFilePath%, 1
		GuiControl,, savesProgress, +1
	}
	Sleep, 100
	GuiControl,, savesProgress, 0
	return
startRSGPractice:
	openAll(-1, -1, 1, -1, -1, 1)
	return
startSSGPractice:
	openAll(-2, -1, 0, -1, -1, 1)
	return
startRSG:
	openAll(1, 1, lsRSGPath, 1, 0, 1)
	return
startSSG:
	openAll(2, 1, lsSSGPath, 0, 0, 1)
	return
startFSG:
	openAll(3, 1, lsFSGPath, 0, 1, 1)
	return
editPerchLoadouts:
	Run, Explorer %savesPath%\Perch Practice\datapacks\speedrunner-addons\data\hc\functions\bed_loadout.mcfunction
	Run, Explorer %savesPath%\Perch Practice\datapacks\speedrunner-addons\data\hc\functions\anchor_loadout.mcfunction
	return
editBastionLoadouts:
	Run, Explorer %savesPath%\Bastion Practice\datapacks\customized_sethbling_speedrun_practice\data\speedrun_practice\functions\bastion_hotbar.mcfunction
	return
help:
	Run, https://github.com/ryguy2k4/speedruncompanion#readme
	return
reloadApp:
	gui, submit, nohide
	WinGetPos, posX, posY,,, Speedrunning Companion
	saveVariables()
	Reload
	return
Reference:
	Run, https://cdn.discordapp.com/attachments/405839885509984256/821127246198210580/png1920divinemdpi.png
	return
;================================================================================================================================================
;Hotkey Labels
;================================================================================================================================================
cyclePractice:
	if (pMode < 4 && Mode = -1) {
		pMode++
		updatePMode()
	}
	if (pMode < 2 && Mode = -2) {
		pMode++
		updatePMode()
	}
	return
resetBasPractice:
	Send, %lsReset%
	sendCommand("gamemode spectator")
	sendCommand("trigger Practice set 22")
	sendCommand("trigger Practice set 19")
	return
startBasPractice:
	sendCommand("gamemode survival")
	Send, %lsStart%
	return
autoResetRSG:
	autoReset(0)
	return
autoResetSSG:
	autoReset(1)
	return
autoResetFSG:
	autoReset(2)
	return
SetSpectator:
	sendCommand("gamemode spectator")
	return
SetCreative:
	sendCommand("gamemode creative")
	return
SetSurvival:
	sendCommand("gamemode survival")
	return
windowedBorderless:
	WinGet, TempWindowID, ID, Minecraft
	If (WindowID != TempWindowID) {
		WindowID:=TempWindowID
		WindowState:=0
	}
	If (WindowState != 1) {
		WinGetPos,,,,, ahk_id %WindowID%
		WinSet, Style, -0xC40000, ahk_id %WindowID%
		WinMove, ahk_id %WindowID%, , 0, 0, A_ScreenWidth, A_ScreenHeight
	}
	Else {
		If (abusePlanar = 1 && Mode = 1) {
			WinSet, Style, +0xC40000, ahk_id %WindowID%
			WinMove, ahk_id %WindowID%, , 0, A_ScreenHeight/2 - 260, A_ScreenWidth, 520
		}
		Else {
			WinSet, Style, +0xC40000, ahk_id %WindowID%
			WinMove, ahk_id %WindowID%,, A_ScreenWidth/2 - 435, A_ScreenHeight/2 - 260, 870, 520
		}
	}
	WindowState:=!WindowState
	WinActivate, Minecraft
	return
;================================================================================================================================================
;Functions
;================================================================================================================================================
saveVariables() {
	global
	gui, submit, NoHide
	IniWrite, %mcPath%, options.ini, Paths, mcPath
	IniWrite, %savesPath%, options.ini, Paths, savesPath
	IniWrite, %lsPath%, options.ini, Paths, lsPath
	IniWrite, %obsPath%, options.ini, Paths, obsPath
	IniWrite, %trPath%, options.ini, Paths, trPath
	IniWrite, %lsRSGPath%, options.ini, Paths, lsRSGPath
	IniWrite, %lsSSGPath%, options.ini, Paths, lsSSGPath
	IniWrite, %lsFSGPath%, options.ini, Paths, lsFSGPath
	IniWrite, %FSGPath%, options.ini, Paths, FSGPath
	IniWrite, %ubuntuPath%, options.ini, Paths, ubuntuPath
	IniWrite, %readMe%, options.ini, Options, readMe
	IniWrite, %gmHotkeys%, options.ini, Options, gmHotkeys
	IniWrite, %abusePlanar%, options.ini, Options, abusePlanar
	IniWrite, %autoPause%, options.ini, Options, autoPause
	IniWrite, %Launcher%, options.ini, Options, Launcher
	IniWrite, %windowMode%, options.ini, Options, windowMode
	IniWrite, %obsSoftware%, options.ini, Options, obsSoftware
	IniWrite, %FSGGen%, options.ini, Options, FSGGen
	IniWrite, %posX%, options.ini, Options, posX
	IniWrite, %posY%, options.ini, Options, posY
	IniWrite, %Seed%, options.ini, Options, Seed
	IniWrite, %lsColor%, options.ini, Options, lsColor
	IniWrite, %Borderless%, options.ini, Hotkeys, Borderless
	IniWrite, %cyclePractice%, options.ini, Hotkeys, cyclePractice
	IniWrite, %setSurvival%, options.ini, Hotkeys, setSurvival
	IniWrite, %setCreative%, options.ini, Hotkeys, setCreative
	IniWrite, %setSpectator%, options.ini, Hotkeys, setSpectator
	IniWrite, %resetBasPractice%, options.ini, Hotkeys, resetBasPractice
	IniWrite, %startBasPractice%, options.ini, Hotkeys, startBasPractice
	IniWrite, %Reset%, options.ini, Hotkeys, Reset
	IniWrite, %lsStart%, options.ini, Hotkeys, lsStart
	IniWrite, %lsReset%, options.ini, Hotkeys, lsReset
	IniWrite, %obsRecord%, options.ini, Hotkeys, obsRecord
	IniWrite, %practiceRSG1World%, options.ini, PracticeMaps, practiceRSG1World
	IniWrite, %practiceRSG2%, options.ini, PracticeMaps, practiceRSG2
	IniWrite, %practiceRSG2World%, options.ini, PracticeMaps, practiceRSG2World
	IniWrite, %practiceRSG3%, options.ini, PracticeMaps, practiceRSG3
	IniWrite, %practiceRSG3World%, options.ini, PracticeMaps, practiceRSG3World
	IniWrite, %practiceRSG4%, options.ini, PracticeMaps, practiceRSG4
	IniWrite, %practiceRSG4World%, options.ini, PracticeMaps, practiceRSG4World
	IniWrite, %practiceSSG1World%, options.ini, PracticeMaps, practiceSSG1World
	IniWrite, %practiceSSG2%, options.ini, PracticeMaps, practiceSSG2
	IniWrite, %practiceSSG2World%, options.ini, PracticeMaps, practiceSSG2World
	IniWrite, %perchPractice%, options.ini, PracticeMaps, perchPractice
	IniWrite, %bastionPractice%, options.ini, PracticeMaps, bastionPractice
}
updateVariables() {
	global
	IniRead, mcPath, options.ini, Paths, mcPath
	IniRead, savesPath, options.ini, Paths, savesPath	
	IniRead, lsPath, options.ini, Paths, lsPath
	IniRead, obsPath, options.ini, Paths, obsPath
	IniRead, trPath, options.ini, Paths, trPath
	IniRead, lsRSGPath, options.ini, Paths, lsRSGPath
	IniRead, lsSSGPath, options.ini, Paths, lsSSGPath
	IniRead, lsFSGPath, options.ini, Paths, lsFSGPath	
	IniRead, FSGPath, options.ini, Paths, FSGPath	
	IniRead, ubuntuPath, options.ini, Paths, ubuntuPath
	IniRead, readMe, options.ini, Options, readMe
	IniRead, gmHotkeys, options.ini, Options, gmHotkeys
	IniRead, abusePlanar, options.ini, Options, abusePlanar
	IniRead, autoPause, options.ini, Options, autoPause
	IniRead, Launcher, options.ini, Options, Launcher
	IniRead, windowMode, options.ini, Options, windowMode
	IniRead, obsSoftware, options.ini, Options, obsSoftware
	IniRead, FSGGen, options.ini, Options, FSGGen
	IniRead, posX, options.ini, Options, posX
	IniRead, posY, options.ini, Options, posY
	IniRead, Seed, options.ini, Options, Seed
	IniRead, lsColor, options.ini, Options, lsColor
	IniRead, Borderless, options.ini, Hotkeys, Borderless
	IniRead, cyclePractice, options.ini, Hotkeys, cyclePractice
	IniRead, setSurvival, options.ini, Hotkeys, setSurvival
	IniRead, setCreative, options.ini, Hotkeys, setCreative
	IniRead, setSpectator, options.ini, Hotkeys, setSpectator
	IniRead, resetBasPractice, options.ini, Hotkeys, resetBasPractice
	IniRead, startBasPractice, options.ini, Hotkeys, startBasPractice
	IniRead, Reset, options.ini, Hotkeys, Reset
	IniRead, lsStart, options.ini, Hotkeys, lsStart
	IniRead, lsReset, options.ini, Hotkeys, lsReset
	IniRead, obsRecord, options.ini, Hotkeys, obsRecord
	IniRead, practiceRSG1World, options.ini, PracticeMaps, practiceRSG1World
	IniRead, practiceRSG2, options.ini, PracticeMaps, practiceRSG2
	IniRead, practiceRSG2World, options.ini, PracticeMaps, practiceRSG2World
	IniRead, practiceRSG3, options.ini, PracticeMaps, practiceRSG3
	IniRead, practiceRSG3World, options.ini, PracticeMaps, practiceRSG3World
	IniRead, practiceRSG4, options.ini, PracticeMaps, practiceRSG4
	IniRead, practiceRSG4World, options.ini, PracticeMaps, practiceRSG4World
	IniRead, practiceSSG1World, options.ini, PracticeMaps, practiceSSG1World
	IniRead, practiceSSG2, options.ini, PracticeMaps, practiceSSG2
	IniRead, practiceSSG2World, options.ini, PracticeMaps, practiceSSG2World
	IniRead, perchPractice, options.ini, PracticeMaps, perchPractice
	IniRead, bastionPractice, options.ini, PracticeMaps, bastionPractice
	FSGPathUnix := Format("{:L}", SubStr(FSGPath, 1, 1)) . SubStr(StrReplace(StrReplace(FSGPath, ":", ""), "\", "/"), 2)
}
openAll(M, OBS, LS, TR, U, MC) {
	global Mode
	Mode = %M%
	if (M < 0) {
		pMode = 1
	}
	updateHotkeys()
	openOBS(OBS)
	openUbuntu(U)
	openTR(TR)
	openMC(MC)
	WinGetTitle, Title, Minecraft
	if (InStr(Title, "player") != 0) {
		WinActivate, Minecraft
		Send, {Escape}
		exitWorld()
		Sleep, 500
	}
	openLS(LS)
	WinActivate, Minecraft
}
openLS(path) {
	global lsClosed
	global lsPath
	if (WinExist("LiveSplit") != 0) {
		if (path != 0 && path != 1) {
			if (lsClosed = 0) {
				; if livesplit is open, splits need to be opened, and splits are already open
				saveLS()
				Process, Close, LiveSplit.exe
				Run, %path%
			}
			else {
				; if livesplit is open, splits need to be open, and splits are closed
				Process, Close, LiveSplit.exe
				Run, %path%
				lsClosed = 0
			}
		}
		else if (path = 1) {
			if (lsClosed = 0) {
				; if livesplit is open, splits need to be closed, and splits are already open
				saveLS()
				Process, Close, LiveSplit.exe
				Run, %lsPath%
				closeLS()
				lsClosed = 1
			}
		}
		else if (path = 0) {
			saveLS()
			Process, Close, LiveSplit.exe
		}
	}
	else {
		if (path != 0 && path != 1) {
			; if livesplit is closed, and splits need to be opened
			Run, %path%
		}
		else if (path = 1) {
			; if livesplit is closed, and splits need to be closed
			Run, %lsPath%
			closeLS()
			lsClosed = 1
		}
	}
}
saveLS() {
	WinActivate, LiveSplit
	Send, %lsReset%
	MouseMove, 10, 10
	Click, Right
	MouseMove, 60, 60
	Click
	Sleep, 500
}
closeLS() {
	Sleep, 1000
	waitLiveSplit()
	WinActivate, LiveSplit
	MouseMove, 10, 10
	Click, Right
	MouseMove, 60, 100
	Click
}
openOBS(x) {
	global obsPath
	global obsSoftware
	global obsRecord
	if (x = 1) {
		if (obsSoftware = 2) {
			if (WinExist("Streamlabs OBS") = 0) {
				; if Streamlabs needs to be started and is currently closed
				Run, %obsPath%
			}
		}
		else {
			if (WinExist("OBS") = 0) {
				; if OBS needs to be started and is currently closed
				Run, %obsPath%
				waitOBS()
				WinActivate, OBS
				Sleep, 500
				Send, %obsRecord%
			}
		}
	}
	else if (x = 0) {
		if (obsSoftware = 1 && WinExist("OBS") != 0) {
			; if OBS needs to be closed and is currently open
			WinActivate, OBS
			Sleep, 500
			Send, %obsRecord%
			Sleep, 1500
			Process, Close, obs64.exe
		}
	}
}
openTR(x) {
	global trPath
	if (x = 1 && WinExist("resetTracker") = 0) {
		Run, %trPath%
	}
	else if (x = 0 && WinExist("resetTracker") != 0) {
		WinActivate, resetTracker
		Send, quit{Enter}
	}
}
openMC(w) {
	global
	if (WinExist("Minecraft") = 0 && w = 1) {
		Run %mcPath%
		waitMC()
		if (Launcher = 1) {
			Send, {Tab}{Tab}{Tab}{Tab}{Tab}{Tab}{Tab}{Tab}{Tab}{Tab}{Tab}{Enter}
		}
		else {
			Send, {Enter}
			Sleep, 3000
			Process, Close, MultiMC.exe
		}
	}
	else if (WinExist("Minecraft") != 0 && w = 0) {
		Process, Close, javaw.exe
	}
}
openUbuntu(x) {
	global ubuntuPath
	global FSGPathUnix
	if (x = 1) {
		Run, %ubuntuPath%
		Sleep, 1000
		WinActivate, ahk_exe ubuntu2004.exe
		Sleep, 3000
		Send, cd "/mnt/%FSGPathUnix%" {Enter}
	}
	else if (x = 0) {
		WinActivate, ahk_exe ubuntu2004.exe
		Sleep, 1000
		Send, exit{Enter}
	}
}
openWorld(x) {
	Send, {Tab}{Enter}
	Sleep, 1000
	Send, %x%
	Sleep, 1000
	Send, {Tab}{Tab}{Enter}
}
sendCommand(x) {
	Send, /
	Sleep, 100
	Send, %x%
	Send, {Enter}
}
waitMenuScreen() {
	start := A_TickCount
	Loop {
		WinGetPos, X, Y, W, H, Minecraft	
		PixelSearch,,, 0, 0, W, H, 0x00FCFC, 1, Fast
		if (!ErrorLevel) {
			Sleep, 300
			return
		}
		now := A_TickCount-start
		if (now > 15000) {
			Reload
		}
	}
}
waitLiveSplit() {
	global lsColor
	start := A_TickCount
	Process, Wait, LiveSplit.exe
	Loop {
		WinActivate, LiveSplit
		WinGetPos, X, Y, W, H, LiveSplit
		PixelSearch,,, X, Y, W, H, 0x%lsColor%, 1, Fast
		if (!ErrorLevel) {
			Sleep, 100
			return
		}
		now := A_TickCount-start
		if (now > 20000) {
			Reload
			Sleep 1000
		}
	}
}
waitOBS() {
	global obsSoftware
	start := A_TickCount
	Loop {
		if (obsSoftware = 1) {
			WinActivate, OBS
			WinGetPos, X, Y, W, H, OBS
			PixelSearch,,, X, Y, W, H, 0x7f2626, 1, Fast RGB ; look for red microphone bar
		}
		if (!ErrorLevel) {
			Sleep, 500
			return
		}
		now := A_TickCount-start
		if (now > 20000) {
			Reload
			Sleep 1000
		}
	}
}
waitMC() {
	global Launcher
	start := A_TickCount
	Loop {
		if (Launcher = 2) {
			WinActivate, MultiMC
			WinGetPos, X, Y, W, H, MultiMC
			PixelSearch,,, X, Y, W, H, 0xFFFFFF, 6, Fast RGB ; look for blue highlight on instance
		}
		else {
			WinActivate, Minecraft Launcher
			WinGetPos, X, Y, W, H, Minecraft Launcher
			PixelSearch,,, X, Y, W, H, 0xFFFFFF, 4, Fast RGB ; look for green play button
		}
		if (!ErrorLevel) {
			Sleep, 1000
			return
		}
		now := A_TickCount-start
		if (now > 20000) {
			Reload
			Sleep 1000
		}
	}
}
updatePMode() {
	global
	WinGetTitle, Title, Minecraft
	if (InStr(Title, "player") != 0 && windowMode != 2) {
		exitWorld()
		waitMenuScreen()
	}
	else if (InStr(Title, "player") != 0 && windowMode = 2) {
		exitWorld()
		return
	}
	if (Mode = -1) {
		if (pMode = 1) {
			openWorld(practiceRSG1World)
		}
		else if (pMode = 2 && practiceRSG2) {
			openWorld(practiceRSG2World)
		}
		else if (pMode = 3 && practiceRSG3) {
			openWorld(practiceRSG3World)
		}
		else if (pMode = 4 && practiceRSG4) {
			openWorld(practiceRSG4World)
		}
		else {
			pMode = 1
			updatePMode()
		}
	}
	else if (Mode = -2) {
		if (pMode = 1) {
			openWorld(practiceSSG1World)
		}
		else if (pMode = 2 && practiceSSG2) {
			openWorld(practiceSSG2World)
		}
		else {
			pMode = 1
			updatePMode()
		}		
	}
	updateHotkeys()
}
createWorld(x) {
	global Seed
	global autoPause
	global FSGSeed
	global windowMode
	SetKeyDelay, 50
	WinActivate, Minecraft
	send {Tab}{Enter}{Tab}{Tab}{Tab}{Enter}{Tab}{Tab}{Enter}{Enter}{Enter}{Tab}{Tab}{Tab}{Tab}
	if (x=0) {
		send, {Tab}
	}
	else if (x=1) {
		SetKeyDelay, 10
		send {Enter}{Tab}{Tab}{Tab}%Seed%+{Tab}+{Tab}
	}
	else if (x=2) {
		SetKeyDelay, 10
		send {Enter}{Tab}{Tab}{Tab}%FSGSeed%{Tab}+{Tab}
	}
	send, {Enter}
	if (autoPause && windowMode = 1) {
		WinActivate, LiveSplit
	}
}
exitWorld() {
	send {Esc}+{Tab}{Enter} 
}
autoReset(z) {
global windowMode
	WinGetActiveTitle, Title
	if (InStr(Title, "player") = 0) {
		if (z = 2) {
			getFSGSeed()
		}
		CreateWorld(z)
	}
	else {
		exitWorld()
		if (windowMode = 1) {
			waitMenuScreen()
			if (z = 2) {
				getFSGSeed()
			}
			WinActivate, Minecraft
			CreateWorld(z)
		}
	}
}
getFSGSeed() {
	global FSGPath
	global FSGSeed
	global savesPath
	global n
	WinActivate, ahk_exe ubuntu2004.exe
	Sleep, 100
	Send, ./findSeed.sh {Enter}
	Sleep, 500
	Send, ^c^c
	Loop ; loop through output files looking for a seed to copy
	{
		Loop, Files, %FSGPath%\output*
		{
			FileReadLine, seedTemp, %FSGPath%\%A_LoopFileName%, 3
			Sleep, 10
			if (seedTemp != "") {
				seedTempStr := StrSplit(seedTemp, ":", " `t")
				FSGSeed := seedTempStr[2]
				n++
				FileMove, %FSGPath%\%A_LoopFileName%, %savesPath%\FSG%n%.*
				WinActivate, ahk_exe ubuntu2004.exe
				Send, ^c
				Sleep, 20
				Send, ./stopAll.sh{Enter}
				return
			}
		}
	}
}
updateHotkeys() {
	global
	if (gmHotkeys = 1) {
		Hotkey, %setSurvival%, setSurvival, on
		Hotkey, %setCreative%, setCreative, on
		Hotkey, %setCreative%, setCreative, on
	}
	else {
		Hotkey, %setSurvival%, off
		Hotkey, %setCreative%, off
		Hotkey, %setSpectator%, off
	}
	if (windowMode = 1) {
		Hotkey, %Borderless%, windowedBorderless, on
	}
	else {
		Hotkey, %Borderless%, off
	}
	if (Mode = 1) {
		Hotkey, %Reset%, autoResetRSG, on
	}
	else if (Mode = 2) {
		Hotkey, %Reset%, autoResetSSG, on
	}
	else if (Mode = 3) {
		Hotkey, %Reset%, autoResetFSG, on
	}
	else {
		Hotkey, %Reset%, off
	}
	if (Mode = -1 && bastionPractice) {
		Hotkey, %resetBasPractice%, resetBasPractice, on
		Hotkey, %startBasPractice%, startBasPractice, on
	}
	else {
		Hotkey, %resetBasPractice%, off
		Hotkey, %startBasPractice%, off	
	}
	Hotkey, %cyclePractice%, cyclePractice
}
controlGUI(v1, v2) {
	if (v1 != 1) {
		GuiControl, Disable, %v2%
	}
	else {
		GuiControl, Enable, %v2%
	}
}
controlGUIMain(v1, v2) {
	gui, Main:default
	if (v1 = "") {
		GuiControl, Disable, %v2%
	}
	else {
		GuiControl, Enable, %v2%
	}
}
