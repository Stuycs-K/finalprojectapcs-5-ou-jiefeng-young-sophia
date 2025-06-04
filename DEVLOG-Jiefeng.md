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
