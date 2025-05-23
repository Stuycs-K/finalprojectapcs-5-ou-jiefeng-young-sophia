public class Grid{
  private Tile[][] board;
  private int totalBombs;
  private int totalFlags;
  private int totalHidden;
  private boolean firstClick;
  private int sizeOfTile;
  
  public Grid(int size, int numBombs, int tileSize){
    board = new Tile[size][size];
    for(int r = 0; r < board.length; r++){
        for(int c = 0; c < board[r].length; c++){
          board[r][c] = new Tile();
        }
    }
    
    totalBombs = numBombs;
    totalFlags = 0;
    totalHidden = size*size;
    firstClick = true;
    sizeOfTile = tileSize;

    setBombs(totalBombs);
    System.out.println("HI");
  }
  
  private void setBombs(int bombs){
    double density = totalBombs / totalHidden;
    while(bombs > 0){
      for(int r = 0; r < board.length; r++){
        for(int c = 0; c < board[r].length; c++){
          if(Math.random() < density && board[r][c].isBomb == false){
            board[r][c].isBomb = true;
            bombs--;
            setNeighbors(r, c);
          }
        }
      }
    }
  }
  
  private void setNeighbors(int r, int c){
    //top left
    if(r - 1 >= 0 && c - 1 >= 0){
      board[r - 1][c - 1].neighborBombs++;
    }
    //top middle
    if(r - 1 >= 0){
      board[r - 1][c].neighborBombs++;
    }
    //top right
    if(r - 1 >= 0 && c + 1 < board[r].length){
      board[r - 1][c + 1].neighborBombs++;
    }
    //middle left
    if(c - 1 >= 0){
      board[r][c - 1].neighborBombs++;
    }
    //middle right
    if(c + 1 < board[r].length){
      board[r][c + 1].neighborBombs++;
    }
    //bottom left
    if(r + 1 < board.length && c - 1 >= 0){
      board[r + 1][c - 1].neighborBombs++;
    }
    //bottom middle
    if(r + 1 < board.length){
      board[r + 1][c].neighborBombs++;
    }
    //bottom right
    if(r + 1 < board.length && c + 1 < board[r].length){
      board[r + 1][c + 1].neighborBombs++;
    }
  }

  public void initialDisplay() {
    text("Width: " + width + " / sizeOfTile: " + sizeOfTile, 20, 20); 
    for(int x = 0; x < width; x = x + sizeOfTile){
      for(int y = 0; y < height; y = y + sizeOfTile){
        fill(150, 250, 200); 
        stroke(0);
        square(x, y, sizeOfTile);
      }
    }
    
  }
  
}
