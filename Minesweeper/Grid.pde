public class Grid{
  private Tile[][] board;
  private int totalBombs;
  private int totalFlags;
  private int totalHidden;
  private boolean firstClick;
  
  public Grid(int size, int numBombs){
    board = new Tile[size][size];
    totalBombs = numBombs;
    totalFlags = 0;
    totalHidden = size*size;
    firstClick = true;
  }
  
  private void setBombs(int bombs){
    double density = totalBombs / totalHidden;
    while(bombs > 0){
      for(int r = 0; r < board.length; r++){
        for(int c = 0; c < board[r].length; c++){
          if(Math.random() < density){
            board[r][c].isBomb = true;
            bombs--;
          }
        }
      }
    }
  }
}
