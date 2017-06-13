#NoEnv
#SingleInstance, Force
SetBatchLines, -1

; script hotkey definitions
;   f1  : set starting block coordinates
;   1-8 : move and click
;   `   : toggle enable/disable hotkeys
;   esc : close script

; edit parameters in this section to your preference
block_displacement := 115 ; distance between blocks
speed := 2 ; mouse movement speed
reverse_map := false ; false/true: 1 key clicks the rightmost/leftmost block

; changing any code below this line may alter script behavior
spread := Round(block_displacement / 3)

; starting block coordinates initialized to the center of the screen
x_initial := Round(A_ScreenWidth / 2)
y_initial := Round(A_ScreenHeight / 2)

; dynamically create hotkeys
Loop, 8
  Hotkey, %A_Index%, MapNumberToBlock, On
return

; labels
MapNumberToBlock:
  ; determine mapping orientation
  key := reverse_map ? 8 - A_ThisHotkey + 1 : A_ThisHotkey

  ; get delta
  x_delta := Round(Gaussian(-spread, spread))
  y_delta := Round(Gaussian(-spread, spread))

  ; get exact block position
  x_final := x_initial - ((key - 1) * block_displacement)
  y_final := y_initial

  ; used for debugging, can comment out
  ; ShowTooltip(A_ThisHotkey . ": (" . x_final + x_delta . ", " . y_final + y_delta . ")")

  ; move and click
  MouseClick, Left, x_final + x_delta, y_final + y_delta, 1, %speed%
return

RemoveTooltip:
  Tooltip ; hides tooltip
return

; functions
Gaussian(lower = 0.0, upper = 1.0) {
  Static x := 0x7FFFFFF
  return lower + (upper - lower)
  * (Random(-x, x) + Random(-x, x) + Random(-x, x) + Random(-x, x)
  + Random(-x, x) + Random(-x, x) + Random(-x, x) + Random(-x, x)
  + Random(-x, x) + Random(-x, x) + Random(-x, x) + Random(-x, x)
  + 12 * x) / (24 * x)
}

Random(lower = 0.0, upper = 1.0) { ; helper function
  Random, r, lower, upper
  return r
}

ShowTooltip(message, delay = -500) {
  Tooltip, % message
  SetTimer, RemoveTooltip, % delay
}

; hotkeys
F1::
  ; reassign starting block coordinates
  MouseGetPos, x_new, y_new
  x_initial := x_new
  y_initial := y_new
  ShowTooltip("New position saved!", -1000)
return

`::
  Suspend ; toggle enable/disable hotkeys
return

Escape::
  ExitApp ; close script
return
