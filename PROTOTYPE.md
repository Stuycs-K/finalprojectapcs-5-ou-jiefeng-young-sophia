Period 5  
Jiefeng Ou & Sophia Young  
The Minesweepers  

# Technical Details:

A description of your technical design. This should include:

How you will be using the topics covered in class in the project.

Minesweeper consists of a grid of squares. You click on each square to reveal the tile and see whether it's a bomb or not. If it's a bomb, you lose, and if it isn't, it'll reveal how many bombs are next to that tile. We'll make two classes: grid and square. The square objects are the tiles (both bomb and safe), and when hidden, will display as green(?) squares. The grid object will consist of a 2D array in the grid class (kind of like the image array from kernels), and is responsible for the generation of the grid at the start of the game (like treeburning). On the screen the squares are placed directly next to each other into a grid. When you left click on the screen, the coordinates of where you pressed will correspond to a square that'll reveal itself.

Critical features: Board that can randomly place bombs and squares that display the correct number of bomb neighbors. When a bomb is clicked on, the game ends.

Nice to have features: 3x3 bomb areas are not allowed to be generated, tiles with 0 bombs next to it will dig up the area around

# Project Design

UML Diagrams and descriptions of key algorithms, classes, and how things fit together.

![Alt text](UML-Minesweeper-3.jpg?raw=true "Title" )

Grid uses a Tile[][] board, and each tile has four variables that describe it.  

When Grid is initialized by the main class, it will make a Tile[][] and set the total size to totalHidden. Then, setBombs(int n) is called, which will set n amount of tiles to bombs. Each bomb tile will call setNeighbors(), which increments the neighborBombs of all surrounding tiles by one. The constructor will then call initialDisplay(), which displays a board of unrevealed tiles.

When the player left clicks, revealTile(int x, int y) is called, which will set the corresponding tile's isRevealed to true. The revealed tile will be drawn, and totalHidden will decrease by one.  
An exception is made when the first tile clicked is a bomb. In that case, editFirstBomb() is called first, where a different random tile is made into a bomb and the tile clicked becomes a regular tile (and surrounding tiles are decremented). This is so players don't die before revealing a single tile.

When the player right clicks, flagTile(int x, int y) is called, which will set the corresponding tile's isFlagged to true and then display the tile with flag. In this state, if a player calls revealTile, nothing will happen. A flag cannot be set when the totalFlags is the same as the totalBombs.

The game ends when:
1. revealTile sets a bomb tile's isRevealed to true, in which case the screen will display a game over.
2. totalHidden is equal to totalBombs, which means all the remaining tiles are bombs.

Additionally, a bomb counter will be on the screen, which will display the totalBombs - totalFlags.

# Intended pacing:

How you are breaking down the project and who is responsible for which parts.

A timeline with expected completion dates of parts of the project. (CHANGE THIS!!!!!)

Day 1-2:
- Tile & Grid constructors and variables made
- setBombs will randomly set n bombs on the board (Person 1)
- initialDisplay will draw a board of unrevealed tiles (Person 2)

Day 3-4:
- setBombs will use setNeighbors to set the correct number on all tiles (Person 1)
- revealTile will draw a revealed tile with the correct number of bomb neighbors when left clicked (Person 2)

Day 5-6:
- setBombs will use editFirstBomb when the first tile clicked is a bomb (Person 1)
- flagTile will draw a flagged tile when an unrevealed tile is right clicked (Person 2)

Day 7:
- Bomb counter on the screen
- Game reset when pressing space
- revealTile has a death screen when revealing bomb (Person 2)

Day 8+
- Implementation of nice to have features
- Added menu, easy/medium/hard levels, win screen
