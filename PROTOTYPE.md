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

Grid uses a Tile[][] board, and each tile has three variables that describe it.  

When Grid is initialized by the main class, it calls setBombs(int n) which will set n amount of tiles to bombs, and each bomb tile will call setNeighbors(), which increments the neighborBombs of all surrounding tiles by one. The constructor will then call initialDisplay(), which displays a board of unrevealed tiles. 

When the player left clicks, revealTile(int x, int y) is called, which will set the corresponding tile's isRevealed to true. Then, the revealed tile will be drawn. An exception is made when the first tile clicked is a bomb. In that case, editFirstBomb() is called, where a different random tile is made into a bomb and the tile clicked becomes a regular tile (and surrounding tiles are decremented). This is so players don't die before revealing a single tile.

When the player right clicks, flagTile(int x, int y) is called, which will set the corresponding tile's isFlagged to true and then display the tile with flag. In this state, if a player calls revealTile, nothing will happen. A flag cannot be set on a 

# Intended pacing:

How you are breaking down the project and who is responsible for which parts.

A timeline with expected completion dates of parts of the project. (CHANGE THIS!!!!!)
