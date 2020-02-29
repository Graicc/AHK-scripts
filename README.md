# AHK-scripts
A collection of the AHK scripts that I use. Feel free use them.

Licensed under the MIT License.

## Changes to your normal input devices
This script is based around the idea of layers. The main layer used right now is a alt layer opened by holding the right alt key (*Note: This may affect keyboard shortcuts already mapped to the alt layer*). There are also a few general and application specific rebindings.

## Windows Keybinds
| Keybind                         | Result                                                  |
| ------------------------------- | ------------------------------------------------------- |
| Mouse Back + Left / Right Click | Swaps desktops (ctrl + win + left / ctrl + win + right) |

## Music Keybinds
| Keybind               | Result        |
| --------------------- | ------------- |
| Control + Mute        | Play / Pause  |
| Control + Volume down | Previous Song |
| Control + Volume up   | Next song     |

## Chrome Keybinds
| Keybind                          | Result                                                     |
| -------------------------------- | ---------------------------------------------------------- |
| Mouse Wheel Left / Right         | Swap tabs left and right (ctrl + tab / ctrl + shift + tab) |
| Mouse Back + Left / Right Click  | Close and restore tabs (ctrl + w / ctrl + shift + t)       |
| Mouse Back + Middle Mouse Button | Mouse Forward                                              |

(*Note: I also use https://gist.github.com/sedm0784/4443120 for remapping capslock to escape if tapped and control if held down*)

## Layers
There are also layers contained in the script.

### Layer 1: Alt Layer
(*Note: You can change what alt key triggers this by selecting the swap alt option from the context menu on the system tray icon*)
| Keybind         | Result                            |
| --------------- | --------------------------------- |
| HJKL            | Left, Down, Up, Left (vim layout) |
| U / I           | Home / End                        |
| Control + J / K | Mouse Wheel Up / Mouse Wheel Down |
| Backspace       | Del                               |
| Backtick        | Opens or closes a notepad window  |

### Layer 2: Application Layer
| Keybind | Result        |
| ------- | ------------- |
| c       | Open Chrome   |
| v       | Open Code     |
| u       | Open Ubuntu   |
| f       | Open Explorer |
| s       | Open Spotify  |