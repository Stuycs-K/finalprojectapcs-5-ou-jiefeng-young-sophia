# Dev Log:

This document must be updated daily every time you finish a work session.

## Jiefeng Ou

### 2025-05-22 - setBombs and setNeighbors
- Added Tile and Grid constructors and instance variables: 15 minutes
- Added setBombs that loops through the board until all bombs are placed (untested and algorithm could be improved upon): 10 minutes
- Added setNeighbors that will edit the 8 surrounding tiles around the bomb, helper method for setBombs (untested): 15 minutes

### 2025-05-23 - Bug fixing for initialDisplay
- Fixed a bug in setBombs where a bomb could be set on a tile that was already a bomb, and therefore having less bombs on the board than expected: 2 minutes
- Worked on fixing a bug where initialDisplay, when moved from the Main to the Grid class, would not... display (unfinished): 35 minutes

### 2025-05-25 - Bug fixing, finishing revealTile and flagTile, and added editFirstBomb
- Worked on typing up the DEVLOG: 10 minutes
- Fixed a bug in setBombs where density would always be 0.0, thus making an infinite loop: 10 minutes
- Fixed a bug in flagTile where revealed tiles could also be flagged: 5 minutes
- The tiles revealed in revealTile now display the correct tile info and displays whether or not they're a bomb: 15 minutes
- Added bomb instance variable to Main because the number of bombs is one of the game setups: 5 minutes
- revealTile no longer reveals flagged tiles, and flagTile unflags a flagged tile: 10 minutes
- Added editFirstBomb that correctly sets a different tile to a bomb while setting the tile clicked to a safe tile: 20-30 minutes

### 2025-05-27 - revealNeighbors
- Added revealNeighbors, a helper method that automatically reveals all tiles around (c, r) that is called whenever the tile at (c, r) has no bomb neighbors: 15 minutes

### 2025-05-28 - deathScreen
- Added deathScreen that reveals all bombs when dead, will later be used for making a more fancy death animation: 10 minutes

### 2025-05-29 - Menu
- Added a page variable to main for different menus
- Added a main menu, where the game initially begins (internally page 0): 10 minutes
- Added a selection menu, where the game will allow you to select between easy, medium, hard, and custom modes (internally page 1): 25 minutes
- mousePressed now has different behaviors depending on which page is currently on screen

### 2025-05-30 - editFirstBomb
- Edited editFirstBomb to edit the tiles around the first tile, effectively making a 3x3 area of safe tiles: 20 minutes
- Fixed a bug in selectionPressed where the game is initialized even if the button is not clicked: 20 minutes

### 2025-06-02 - Small changes & bug fixes
- deathScreen displays incorrect flags by marking them as black: 5 minutes
- Fixed a bug in revealTile where when revealing the 3x3 tiles on first click, it didn't check if the 3x3 was within bounds of the grid: 20 minutes
- Added editNeighborBombs, a helper method to revealTile that checks if the tiles in the 3x3 are within bounds

### 2025-06-03 - Playtesting
- Changed difficulty of easy, medium, and hard modes: 2 minutes
- Fixed the same bug in selectionPressed that occured on 5/30: 5 minutes

### 2025-06-04 - Shapes for flags
- Incorrect flags are now displayed with a red X: 10 minutes
- Flags are now displayed with a red flag (and not an ugly red circle): 15 minutes

### 2025-06-06 - Nothing pushed to main
- Helped debug a bug in customPressed where changing the sizeOfTile would not update the amount of bombs, causing too many bombs with too few tiles for those bombs: 10 minutes
- Worked on editing draw, deathScreen, and revealTile in order to allow bombs to appear one at a time: 30 minutes

### 2025-06-08 - Drawings and Bug Fixes
- Finished editing draw and deathScreen. Bombs now appear one a time over a span of 3 seconds: 30 minutes
- Added a dark red circle to the sprite of the bomb: 5 minutes
- Fixed a bug with frameRate where the frameRate is not reset to the default value after a game, causing scenarios where the game appears to be lagging: 2 minutes 
- Added a sunflower to the main menu (this was not worth the effort required): 1 hour
- Fixed a bug with draw and keyPressed where if the bombs are drawing when resetting the board, the bombs continue drawing on the main menu, added isDrawing varible to fix this: 10 minutes
- Added a lose banner: 10 minutes
- Fixed a bug with the frameRate where when there were less than 3 bombs left on the board, would cause the frameRate to become 0 and thus freeze the game: 20 minutes
- Fixed a bug with revealTile where when the last tile clicked is a bomb and not a safe tile, would cause the win screen to show up because the condition was technically met: 2 minutes
- Fixed a bug with revealTile where totalHidden is decremented even though the tile is flagged and therefore still hidden: 10 minutes