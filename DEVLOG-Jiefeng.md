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