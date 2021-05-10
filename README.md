# Overview
Thanks you for checking out Speedrun Companion! Speedrun Companion is a lot more than your average reset macro. It is an over-the-top automation tool for your speedrunning sessions because I know you are very lazy and it is hard to push a lot of buttons :D. Speedrun Companion can open all apps relevant to your speedrunning session, close them when you are done, clear your saves folder, it has customizable practice routines, macros for RSG, SSG, FSG, and bastion practice. I am quite proud of the efficient FSG reset macro that uses the locally run FSG generator. To give you a better understanding of what this program is capable of, check out this [demo video](https://www.youtube.com/watch?v=f-1cHzKHYbA).

Before we go any further, this is designed for Windows and I have no plans of supporting any other OS. Also at the moment I have only made it for the 1.16.1 category but I hope to support more versions/categories in the future.

Currently it is in a kind of public beta because it is not very well tested outside of my desktop and my laptop, and there are bound to be many many bugs in it right now. I am very inexperienced with programming, but this has been a very fun side project for me. It is programmed in autohotkey, I know not the best, but it is very accessible and easy to learn and is capable of everything I need at this point in time. Since this is just a side project like I mentioned, it is quite possible that I abandon this project in the future, so be warned.

A quick disclaimer about stability/reliability. My PC specs are as follows: i7-8700k, 1660 Ti, 16 GB RAM. This program may have difficulties running on older/slower systems. I have thoroughly tested it in my own speedruns for the past few weeks on my PC and it is quite stable and reliable, no major issues. I have tried to test this on my Surface Pro Laptop and it has trouble functioning (but that laptop take 2 minutes to generate a world soo....).

If you have any questions, comments, or concerns, DM me at ryguy2k4#9371

# Tutorial
## Installation
Download the latest release *here*. Extract the zip file that was downloaded and run *Speedrun Companion.exe*. Make sure that the *options.ini* file stays in the same folder as the exe. 

## The Main GUI
When you first run Speedrun Companion, you will be asked if you have read through this document, and then the main GUI will be displayed. A description of each button is provided below. Whenever you press a button, please do not use the mouse or keyboard until it has finished its actions.

![image](https://user-images.githubusercontent.com/50433837/116632587-241da380-a91d-11eb-9490-133273ac4722.png)

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
![image](https://user-images.githubusercontent.com/50433837/116632675-5b8c5000-a91d-11eb-9e39-9838eb33b5bd.png)
#### Gamemode Switcher Hotkeys
Checking this option will enable custom hotkeys to change your gamemode. Assign the hotkeys below.

#### Minecraft Launcher
Please select the Minecraft launcher you use from this drop down menu. The only supported ones are the Official (default) Launcher and MultiMC. I highly recommend MultiMC as it is great at managing instances. 

In the *Minecraft Launcher Path* field, please put the full file path to your Minecraft launcher (ex. *A:\Minecraft Directory\MultiMC\MultiMC.exe*). This allows Speedrun Companion to open Minecraft.

In the *Minecraft Saves Path* field, please put the full file path to your Minecraft saves folder (ex. *A:\Minecraft Directory\MultiMC\instances\1.16.1\.minecraft\saves*). This allows Speedrun Companion to delete your worlds when you press the *Clear Saves* Folder button

#### Window Mode
Please select which window mode you use from this drop down menu. There are 3 options, windowed, windowed borderless, and fullscreen. This field allows Speedrun Companion to know what your Minecraft window looks like and whether or not to enable its built in windowed borderless functionality. There many different pros and cons between windowed borderless/windowed and fullscreen that are explained below.

Windowed Borderless Pros (and things you miss out on with fullscreen):
* You can provide a hotkey to toggle windowed borderless in the *Toggle Windowed Borderless* field
* You can enable the option to abuse planar fog during RSG. This will stretch your Minecraft window in order to see more on the edges of your field of view
* You can enable the option to auto pause upon reset. This will switch focus to another window after creating a world so that when you load in, the game will start paused.
* You can tab out whenever
* You can put your timer on top of the Minecraft window

Fullscreen Pros (and things you miss out on with windowed borderless/windowed):
* Less input delay
* A smoother, less laggy experience

Fullscreen Cons:
* Tabbing out will hide Minecraft
* You will have to press the reset (and cycle practice) hotkey twice, first to exit the world, and once again to create a new one

#### Recording Software
Please select the recording software you use from the drop down menu. The only supported softwares are Streamlabs OBS and OBS Studio. 

In the *Recording Software Path* field please put the full file path to your recording software (ex. *C:\Program Files\Streamlabs OBS\Streamlabs OBS.exe*). This allows Speedrun Companion to open your recording software when you press *Start RSG*, *Start SSG*, or *Start FSG*.

In the *OBS Studio Toggle Record* field, please put the hotkey that you use to toggle recording in OBS Studio. You have to set this up in OBS´s settings. This allows Speedrun Companion to start/stop recording when it opens/closes OBS. Unfortunately, at the moment this is only applicable for OBS studio and if you use Streamlabs OBS you will have to manually start/stop recording.

#### LiveSplit
**Livesplit is a requierment** for this program to work, all the below fields must be filled in. (if you never plan to play ssg for example though you can leave it blank)

In the *LiveSplit Path* field, please put the full file path to LiveSplit (ex. *D:\Saved Games\LiveSplit\LiveSplit.exe*). This allows Speedrun Companion to open LiveSplit with no splits open when you press *Start RSG Practice* or *Start SSG Practice*.

In the *LiveSplit Start* field,  please put the hotkey that you use to start LiveSplit. This hotkey is something that should be setup within LiveSplit´s settings. This allows Speedrun Companion to start the timer during bastion practice.

In the *LiveSplit Reset* field, please put the hotkey that you use to reset LiveSplit. This hotkey is something that should be setup within LiveSplit´s settings. This allows Speedrun Companion to reset the timer during bastion practice.

In the *LiveSplit Text Color* field, please put the hexadecimal value of the color of your timer. This allows Speedrun Companion to know when LiveSplit appears on your screen, as often when you first start LiveSplit it can take up to 30 seconds to appear.

### Speedrun Settings
![image](https://user-images.githubusercontent.com/50433837/116632690-63e48b00-a91d-11eb-8976-2bd24e110e64.png)

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
* [Here](https://www.youtube.com/watch?v=Gl7zOn2lLo4) is a tutorial on how to set up FSG locally
* Please provide the path to the folder that contains the *findSeed.sh* file for whichever FSG generator you wish to use (ex. *A:\Minecraft Directory\FSG\fsg-power-village-looting-sword*).
* Please provide the path to your ubuntu installation (ex, *C:\Program Files\WindowsApps\CanonicalGroupLimited.Ubuntu20.04onWindows_2004.2021.222.0_x64__79rhkp1fndgsc\ubuntu2004.exe*).

### Practice Settings
![image](https://user-images.githubusercontent.com/50433837/116632703-69da6c00-a91d-11eb-8df4-53a38f08e2d3.png)

#### General Practice Settings
In the *Cycle Practice Map* field, please provide a hotkey to use for cycling between practice worlds in RSG/FSG Practice Mode or SSG Practice Mode. Pressing this hotkey during a practice mode will exit the world (if you are in one), and then load up the practice map you specify below. It will open practice map 1 the first time it is pressed, and if practice map 2 is provided, it will open that map the next time this hotkey is pressed, and so on until it circles back around to practice map 1.

#### FSG/RSG Practice Settings
If you want to used FSG/RSG Practice Mode, you must at least fill in *FSG/RSG Practice Map 1* with the name of the practice world. To avoid issues, make sure that the world file folder name is identical to the display name of the world within Minecraft. If you would like to use additional practice maps, check the checkbox above them and provide a world name.

As a complement to Speedrun Companion, I have created a modified version of [Sethbling´s Speedrun Practice Datapack](https://www.youtube.com/watch?v=UihtGJhK_-w) which is included in the folder when you download Speedrun Companion. This modified version is based off of modifications made by Secondairy#1782. This modified version is designed to be used exclusively with Speedrun Companion for bastion practice, so the chat interface has been completely removed and I have added the ability to create custom loadouts. Check *I Use the Speedrun Companion Bastion Practice Datapack* if you have installed it, and make sure that the name of the world you put it into is named "Bastion Practice".

If you use the Speedrun Companion Bastion Practice Datapack, the *Edit Bastion Practice Loadouts* button will open a text file where you can customize your loadouts. I have faith that based on the default loadouts you are smart enough to figure out how to customize it :).

If you use the Speedrun Companion Bastion Practice Datapack, in the *Start Bastion Hotkey* field, choose a hotkey that will start your timer and put you into survival mode. Likewise, the *Reset Bastion Hotkey* field is a hotkey that will reset your loadout and timer and send you to a new bastion during RSG/FSG Practice Mode.

I am planning on developing my own practice map that will combine the major features of both Emma's End Practice Map and Jojos Perch Practice Map as well as some new features, optimizations, and quality of life improvements of my own. Stay tuned for more information about this!

#### SSG Practice Settings
If you want to used SSG Practice Mode, you must at least fill in *SSG Practice Map 1* with the name of the practice world. To avoid issues, make sure that the world file folder name is identical to the display name of the world within Minecraft. If you would like to use additional practice maps, check the checkbox above them and provide a world name.

## Other Information
When assigning hotkeys the following modifiers may be added (without quotes)
"#" = Windows Key
"+" = Shift
"^" = Control
"!" = Alt

When providing a path to an application, please include the entire path from the drive letter all the way to the .exe
