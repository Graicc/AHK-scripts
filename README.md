# AHK-scripts
A collection of the AHK scripts that I use. Feel free use them.

Licensed under the MIT License.

# ProductivityScript

## Changes to your normal input devices
This script is based on the idea of layers. The main layer used right now is an alt layer opened by holding the right alt key (*Note: This may affect keyboard shortcuts already mapped to the alt layer*). There are also a few general rebindings, such as capslock to escape.

### Normal Keybindings
* Capslock -> Escape
* Mouse Wheel Left / Right -> Swap tabs left and right (^tab / ^+tab)
* Mouse Back + Left / Right Click -> Close and restore tabs (^w / ^+t)
* Mouse Back + Left / Right Click -> Swaps desktops (^#{left} / ^#{right})
* Mouse Back + Middle Muouse Button -> Mouse Forward

### Other Layers
There are also layers contained in the script

#### Alt Layer (*Activated by holding Alt*)
* HJKL -> Left, Up, Down, Left respectively (This is different from the standard LDUR convention)
* Q - ] -> F1 - F12
* Backspace -> Del
* F -> Appskey, down, enter (Autocorrects a word in Google Drive)
* D -> Backspace (Very useful in word editing with one hand on the mouse)

(*Note: This list is complete :)*)

# OculusAudio

## What is this?
OculusAudio is a script that causes your computer to switch audio sources to your Oculus Rift when it is plugged in. This is useful because some programs, like Steam VR, will come out of your speakers, forcing you to close it, switch audio sources, and reopen it, which is a large hassle. This script swaps your audio source as soon as you launch the Oculus program, and then closes itself, as to not take up any extra resources.

## How do I get this?
To use OculusAudio, follow the following steps:

* Install nircmd, which can be found [here](http://www.nirsoft.net/utils/nircmd.html) (look all the way at the bottom)
* Grab a copy of the executable, under OculusAudio/Build/OculusAudio.exe. Alternatively, you can use the source (OculusAudio/Source/OculusAudio.ahk) if you have AHK installed or don't trust random people on the internet.
* On Windows, press Windows+R to bring up the run box. Type `shell:startup` to open the startup folder. If you want this to work on all accounts, run `shell:common startup` instead.
* With the folder that opened, move the file you downloaded into the folder.
* Now the program will automatically open whenever you log on to your computer, so you no longer have to worry about what audio device your computer is using.
