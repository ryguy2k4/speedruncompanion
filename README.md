# Tutorial
## Installation
Download the latest release *here*. Extract the zip file that was downloaded and run *Speedrun Companion.exe*. Make sure that the *options.ini* file stays in the same folder as the exe. 

## The Main GUI
When you first run Speedrun Companion, you will be asked if you have read through this document, and then the main GUI will be displayed. A description of each button is provided below. Whenever you press a button, please do not use the mouse or keyboard until it has finished its actions.

### Start FSG/RSG Practice 
Hitting this button will make sure all required applications are open (Minecraft and LiveSplit) and enable practice hotkeys. This button will be grayed out if no practice map is provided in Practice Settings. See Practice Settings for more information.

### Start SSG Practice
Hitting this button will make sure all required applications are open (Minecraft and LiveSplit) and enable practice hotkeys. This button will be grayed out if no practice map is provided in Practice Settings. See Practice Settings for more information.

### Start RSG
Hitting this button will make sure all required applications are open (Minecraft, LiveSplit, OBS, Reset Tracker) and enable the RSG auto reset hotkey. See Speedrun Settings for more information.

### Start SSG
Hitting this button will make sure all required applications are open (Minecraft, LiveSplit, OBS) and enable the SSG auto reset hotkey. This button will be grayed out if no seed is provided in Speedrun Settings.  See Speedrun Settings for more information.

### Start FSG
Hitting this button will make sure all required applications are open (Minecraft, LiveSplit, OBS, Ubuntu) and enable the FSG auto reset hotkey. See Speedrun Settings for more information.

### Close All Apps
Hitting this button will make sure any applications opened by Speedrun Companion get closed.

### Clear Saves Folder
Hitting this button will delete every "New World" folder in your saves folder. If you were playing FSG with Auto Local generator this will also delete all your FSG seeds/verification codes. This button will be grayed out if no saves path is provided in General Settings.

### Change Settings
Hitting this button will open a separate window where you can customize Speedrun Companion Settings.

### References
Hitting this button will open a website with divine tables, stronghold ring tables, and triangulation tables in your browser.

### Reload
Hitting this button will restart Speedrun Companion.

### Help
Hitting this button will open this ReadMe file on Github in your browser.
 
## The Settings Window

### General Settings

#### Gamemode Switcher Hotkeys
Checking this option will enable custom hotkeys to change your gamemode. Assign the hotkeys below.

#### Minecraft Launcher
Please select the Minecraft launcher you use from this drop down menu. The only supported ones are the Official (default) Launcher and MultiMC. I highly recommend MultiMC as it is great at managing instances. 

In the *Minecraft Launcher Path* field, please put the full file path to your Minecraft launcher (ex. *A:\Minecraft Directory\MultiMC\MultiMC.exe*). This allows Speedrun Companion to open Minecraft.

In the *Minecraft Saves Path* field, please put the full file path to your Minecraft saves folder (ex. *A:\Minecraft Directory\MultiMC\instances\1.16.1\.minecraft\saves*). This allows Speedrun Companion to delete your worlds when you press the *Clear Saves* Folder button

#### Window Mode
Please select which window mode you use from this drop down menu. There are 3 options, windowed, windowed borderless, and fullscreen. This field allows Speedrun Companion to know what your Minecraft window looks like and whether or not to enable its built in windowed borderless functionality.

If you select Windowed Borderless:
* You can provide a hotkey to toggle it in the field below
* You can enable the option to abuse planar fog during RSG. This will stretch your Minecraft window in order to see more on the edges of your field of view
* You can enable the option to auto pause upon reset. This will switch focus to another window after creating a world so that when you load in, the game will start paused.

#### Recording Software
Please select the recording software you use from the drop down menu. The only supported softwares are Streamlabs OBS and OBS Studio. 

In the *Recording Software Path* field please put the full file path to your recording software (ex. *C:\Program Files\Streamlabs OBS\Streamlabs OBS.exe*). This allows Speedrun Companion to open your recording software when you press *Start RSG*, *Start SSG*, or *Start FSG*.

In the *OBS Studio Toggle Record* field, please put the hotkey that you use to toggle recording in OBS Studio. You have to set this up in OBS´s settings. This allows Speedrun Companion to start/stop recording when it opens/closes OBS. Unfortunately, at the moment this is only applicable for OBS studio and if you use Streamlabs OBS you will have to manually start/stop recording.


#### LiveSplit
In the *LiveSplit Path* field, please put the full file path to LiveSplit (ex. *D:\Saved Games\LiveSplit\LiveSplit.exe*). This allows Speedrun Companion to open LiveSplit with no splits open when you press *Start RSG Practice* or *Start SSG Practice*.

In the *LiveSplit Start* field,  please put the hotkey that you use to start LiveSplit. This hotkey is something that should be setup within LiveSplit´s settings. This allows Speedrun Companion to start the timer during bastion practice.

In the *LiveSplit Reset* field, please put the hotkey that you use to reset LiveSplit. This hotkey is something that should be setup within LiveSplit´s settings. This allows Speedrun Companion to reset the timer during bastion practice.

In the *LiveSplit Text Color* field, please put the hexadecimal value of the color of your timer. This allows Speedrun Companion to know when LiveSplit appears on your screen, as often when you first start LiveSplit it can take up to 30 seconds to appear.

### Speedrun Settings

#### General Speedrun Settings
In the *Reset Hotkey* field, please put the key would like to use to auto reset. This is your reset hotkey for RSG, SSG, and FSG. This hotkey will exit the world (if you are in one), wait for the title screen to appear, and then create a new world, either RSG, SSG, or FSG, depending on which mode you are in. There is a delay so that world creation is visible for verifiers.

The RSG reset macro is based off of [Onvo's reset macro](https://gist.github.com/onvo1/90365dcc00b3fdffc3eeccb57fc705f1) and the SSG reset macro is based off of modifications to Onvo's script made by logwet (I am unable to find where I obtained his script, sorry!)

#### RSG Settings
In the *LiveSplit RSG Splits Path* field,  please put the full file path to your LiveSplit RSG splits file here (ex. *D:\Saved Games\LiveSplit\Splits\Minecraft Java Edition - Any% RSG.lss*). This allows Speedrun Companion to open your splits when you press *Start RSG*

In the *Tracker Path* field, if you use Talking Mime's RSG reset tracker please put the path to a shortcut leading to the tracker here. (ex. *C:\Users\user\Downloads\resetTracker*). I have found that you have to make a shortcut to the resetTracker.exe and then give the path of that shortcut to Speedrun Companion in order for it to work. This allows Speedrun Companion to open your reset tracker when you press *Start RSG*.

#### SSG Settings
In the *LiveSplit SSG Splits Path* field,  please put the full file path to your LiveSplit RSG splits file here (ex. *D:\Saved Games\LiveSplit\Splits\Minecraft Java Edition - Any% SSG.lss*). This allows Speedrun Companion to open your splits when you press *Start SSG*.

In the *SSG Seed* field, please put the seed you would like to use for SSG. 

#### FSG Settings
In the *LiveSplit FSG Splits Path* field,  please put the full file path to your LiveSplit RSG splits file here (ex. *D:\Saved Games\LiveSplit\Splits\Minecraft Java Edition - Any% FSG.lss*). This allows Speedrun Companion to open your splits when you press *Start FSG*.

Please select how you would like to generate FSG seeds in the drop down menu. Manual means that before you reset, you will manually generate a seed and copy it to your clipboard. Auto Local means that when you press reset, Speedrun Companion will automatically start searching for a seed with the Ubuntu terminal. As soon as it finds one, it will create a world with that seed. Speedrun Companion will then copy the seed and verification code generated by Ubuntu to a file called FSGx.txt (x is an incrementing number) in your saves folder in case you need to submit the verification code.

If you selected Auto Local:
* Please provide the path to the folder that contains the *findSeed.sh* file for whichever FSG generator you wish to use (ex. *A:\Minecraft Directory\FSG\fsg-power-village-looting-sword*).
* Please provide the path to your ubuntu installation (ex, *C:\Program Files\WindowsApps\CanonicalGroupLimited.Ubuntu20.04onWindows_2004.2021.222.0_x64__79rhkp1fndgsc\ubuntu2004.exe*).

### Practice Settings

#### General Practice Settings
In the *Cycle Practice Map* field, please provide a hotkey to use for cycling between practice worlds in RSG/FSG Practice Mode or SSG Practice Mode. Pressing this hotkey during a practice mode will exit the world (if you are in one), and then load up the practice map you specify below. It will open practice map 1 the first time it is pressed, and if practice map 2 is provided, it will open that map the next time this hotkey is pressed, and so on until it circles back around to practice map 1.

#### FSG/RSG Practice Settings
If you want to used FSG/RSG Practice Mode, you must at least fill in *FSG/RSG Practice Map 1* with the name of the practice world. To avoid issues, make sure that the world file folder name is identical to the display name of the world within Minecraft. If you would like to use additional practice maps, check the checkbox above them and provide a world name.

As a complement to Speedrun Companion, I have created a modified version of [Sethbling´s Speedrun Practice Datapack](https://www.youtube.com/watch?v=UihtGJhK_-w) which you can find *here*. This modified version is based off of modifications made by Secondairy#1782. This modified version is designed to be used exclusively for with Speedrun Companion for bastion practice, so the chat interface has been completely removed and I have added the ability to create custom loadouts. Check *I Use the Speedrun Companion Bastion Practice Datapack* if you have installed it.

If you use the Speedrun Companion Bastion Practice Datapack, in the *Start Bastion Hotkey* field, choose a hotkey that will start your timer and put you into survival mode. Likewise, the *Reset Bastion Hotkey* field is a hotkey that will reset your loadout and timer and send you to a new bastion during RSG/FSG Practice Mode.

As a complement to Speedrun Companion, I have also created a modified version of [Jojo's Perch Practice Map](https://github.com/jojoe77777/PerchPractice/releases/tag/1.2) which you can find *here*. These are just some quality of life improvements including instantly resetting after the dragon dies and easily customizable loadouts. Jojo's map does have custom loadouts, however you cannot choose what items go to what slots, but with this version you can choose which items go to which slots. Check *I Use the Speedrun Companion Perch Practice Map* if you have installed it.

If you have installed either of those things, the *Edit Bastion Practice Loadouts* and *Edit Perch Practice Loadouts* buttons will open a text file where you can customize your loadouts. I have faith that based on the default loadouts you are smart enough to figure out how to customize it.

#### SSG Practice Settings
If you want to used SSG Practice Mode, you must at least fill in *SSG Practice Map 1* with the name of the practice world. To avoid issues, make sure that the world file folder name is identical to the display name of the world within Minecraft. If you would like to use additional practice maps, check the checkbox above them and provide a world name.
