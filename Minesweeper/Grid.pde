public class Grid{
  private Tile[][] board;
  private int totalBombs;
  private int totalFlags;
  private int totalHidden;
  private boolean firstClick;
  private color GREEN = color(150, 250, 200);
  private color RED = color(250, 150, 150);
  private color YELLOW = color(250, 250, 150);
  private color BLACK = color(0, 0, 0);
  
  public Grid(int size, int numBombs){
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
    
    setBombs(totalBombs);
  }
  
  private void setBombs(int bombs){
    //int currBombs = bombs;
    double density = (double) totalBombs / totalHidden;
    while(bombs > 0){
      for(int r = 0; r < board.length; r++){
        for(int c = 0; c < board[r].length; c++){
          if(Math.random() < density && board[r][c].isBomb == false){
            board[r][c].isBomb = true;
            setNeighbors(r, c);
            bombs--;
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
  
  
  void initialDisplay() {
    fill(250, 220, 150);
    rect(0, 0, width, bannerHeight);
    for(int x = 0; x < width; x = x + sizeOfTile){
      for(int y = bannerHeight; y < height; y = y + sizeOfTile){
        fill(GREEN); 
        stroke(0);
        square(x, y, sizeOfTile);
      }
    }
  }
  
  void revealTile(int r, int c){
    board[r][c].isRevealed = !(board[r][c].isFlagged);
    if(!board[r][c].isBomb && board[r][c].isRevealed){ //if it's not a bomb:
      fill(YELLOW); 
      stroke(0);
      square(c * sizeOfTile, r * sizeOfTile + bannerHeight, sizeOfTile);
      
      fill(BLACK);
      textSize(sizeOfTile/1.5);
      textAlign(CENTER);
      text(board[r][c].neighborBombs, c * sizeOfTile + sizeOfTile/2.0, r * sizeOfTile + sizeOfTile/1.5 + bannerHeight);
      
      textSize(10);
    }
    else if(board[r][c].isRevealed){ //if it is a bomb
      fill(RED); 
      stroke(0);
      square(c * sizeOfTile, r * sizeOfTile + bannerHeight, sizeOfTile);
    }
  }
  
  void flagTile(int r, int c){
    board[r][c].isFlagged = !board[r][c].isFlagged && !board[r][c].isRevealed;
    if(board[r][c].isFlagged == true){
      fill(RED); 
      stroke(0);
      circle(c * sizeOfTile + (sizeOfTile/2), r * sizeOfTile + (sizeOfTile/2) + bannerHeight, sizeOfTile/2);
    }
    else if(!board[r][c].isRevealed){
      fill(GREEN);
      stroke(0);
      square(c * sizeOfTile, r * sizeOfTile + bannerHeight, sizeOfTile);
    }
  }
}
