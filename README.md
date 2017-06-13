# block-map
Map number keys to [CQ](https://play.google.com/store/apps/details?id=com.nhnent.SKQUEST) blocks.

![](https://github.com/Johj/block-map/raw/master/examples/demo.gif)

Substituting a mouseclick as a proxy for a finger on an emulator often times feels awkward and delayed. This script attempts to alleviate this disconnect in a responsible, safe, and tactile manner.

### Goals
1. Macro is emulator and resolution independent.
2. Map number keys to block positions.
3. Click position coordinates follow a [Gaussian distribution](https://en.wikipedia.org/wiki/Normal_distribution) and should be safer than built-in macros found in emulators.

![](https://github.com/Johj/block-map/raw/master/examples/gaussian.gif)
4. One physical, human keyboard input results in one emulator input (a strict 1:1 ratio). In other words, there is no automation.

### How To Use
1. Download and install [AutoHotkey](https://autohotkey.com/).
2. Download [BlockMap.ahk]().
3. Open the script in a text editor and modify the following variables to your preference (don't forget to save afterwards!):
```ahk
block_displacement := 115 ; distance between blocks
speed := 2 ; mouse movement speed
reverse_map := false ; false/true: 1 key clicks the rightmost/leftmost block
```
4. Run script.
5. Move your mouse cursor to the center position of the first block and press F1 to save its coordinates.

![](https://github.com/Johj/block-map/raw/master/examples/save.gif)

Now you're ready to use the script!

### Disclaimer
While this script was designed with safety in mind, the author is not responsible for any loss or damage that results, either directly or indirectly, from the usage of this script. Use at your own risk, as is the case with using any macro in most games.
