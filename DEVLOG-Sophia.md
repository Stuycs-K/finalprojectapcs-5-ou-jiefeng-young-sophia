# Dev Log:

This document must be updated daily every time you finish a work session.

## Sophia Young

### 2025-05-23 - initialDisplay
Expanded description including how much time was spent on task.
- 0500 spent 45 minutes doing initialDisplay which makes the green tiles on the screen
- Nested for loop to draw squares, put placeholder value for sizeOfTile so it compiles
### 2025-05-24 - revealTile and Flag debug
- Afternoon set bomb makes the window white for some reason, isFlagged and revealTile is funky and have nullpointer
- Something is wrong with setBomb, commented that out from grid constructor to test other stuff
- Holy crap. We made the double array, but never put tiles in them. They are all null. fuuuuddggeee
- added some debugging text(coordinates of click)
- put for loop in grid constructor to make tiles for every spot in array
- Afternoon 5 reveal and flag work, yay
### 2025-05-25 - Flag and space reset
- made flag only work on not revealed tiles (jeff beat me to the punch, thanks jeff)
- space reset
### 2025-05-27 - Banner
- added a banner
### 2025-05-28 - More banner
- added a banner and didn't break the rest on my code
### 2025-05-29 - More banner and debugging
- 3am, made the banner display words, fixed a bug in flag method because forgot to increment and decrement totalFlag
- class, banner only displays bombs-flags, like google version
### 2025-05-30 - Menu, winScreen, colors
- 3am, made the menu and it works, kind of. we have a custom option that i havent done yet
- todo: merge with main and delete the funky neighbor method on there, make a custom option, first click makes a block so you dont have to gambe when you click on a numbered tile
- 445 am, working on win screen, hidden on banner is for debugging, delete later
- class, finished win banner, deleted hidden counter on banner. editing colors
- 23:54, edited a color
### 2025-06-02 - Custom
- class, working on custom
### 2025-06-03 - More Custom
- work on custom, we going to have a fake slider looking thing, minor winscreen bug
### 2025-06-04 - More Custom
- 5am i have a bar you can click on and will set the scale later to change bomb and sizeOfTile
- class added a scale and labels
### 2025-06-05 - More Custom
- it kind of works. the first click on the new bord trggers the winscreen, which is bad
- okay, the winscreen triggered because the custom set bombs to zero, causing an automatic win.
- bombs were zero because i used percentage, which is a double/float, messing up bomb calulations
- added decimal point and type casted the result
- seems to work now, nice
### 2025-06-07 - More Custom debugging
- class, making bomb should come after every click because you can adjust size after percentage
- adjusting the scale so 1. less insta-kill(anything is possible if you try hard enough though)
- and 2. tile is not size, but rather amount on the board
### 2025-06-07 - More Custom debugging
- bomb percentage caps at 50%
### 2025-06-07 - Final touches
- winscreen cheat code, press 'w' to reveal safe tiles and get winscreen
