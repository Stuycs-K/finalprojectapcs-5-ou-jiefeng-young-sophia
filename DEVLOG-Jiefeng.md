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

### 2025-05-25 - Brief description
- Worked on typing up the DEVLOG: 10 minutes
- Fixed a bug in setBombs where density would always be 0.0, thus making an infinite loop: 10 minutes
