public class Grid{
  private Tile[][] board;
  private int totalBombs;
  private int totalFlags;
  private int totalHidden;
  private boolean firstClick;
  private boolean isDead;
  private color GREEN = color(150, 250, 200);
  private color RED = color(250, 150, 150);
  private color TAN = color(255, 220, 150);
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
          double rand = Math.random();
          if(rand < density && board[r][c].isBomb == false && bombs > 0){
            board[r][c].isBomb = true;
            setNeighbors(r, c, 1);
            bombs--;
          }
        }
      }
    }
  }

  private void setNeighbors(int r, int c, int increment){
    //top left
    if(r - 1 >= 0 && c - 1 >= 0){
      board[r - 1][c - 1].neighborBombs += increment;
    }
    //top middle
    if(r - 1 >= 0){
      board[r - 1][c].neighborBombs += increment;
    }
    //top right
    if(r - 1 >= 0 && c + 1 < board[r].length){
      board[r - 1][c + 1].neighborBombs += increment;
    }
    //middle left
    if(c - 1 >= 0){
      board[r][c - 1].neighborBombs += increment;
    }
    //middle right
    if(c + 1 < board[r].length){
      board[r][c + 1].neighborBombs += increment;
    }
    //bottom left
    if(r + 1 < board.length && c - 1 >= 0){
      board[r + 1][c - 1].neighborBombs += increment;
    }
    //bottom middle
    if(r + 1 < board.length){
      board[r + 1][c].neighborBombs += increment;
    }
    //bottom right
    if(r + 1 < board.length && c + 1 < board[r].length){
      board[r + 1][c + 1].neighborBombs += increment;
    }
  }

  private void editFirstBomb(int r, int c){
    //if there's a bomb, it'll be moved
    //if there's no bomb, nothing will happen
    while(board[r][c].isBomb){
      setNeighbors(r, c, -1);
      setBombs(1);
      board[r][c].isBomb = false;
    }
  }

  void initialDisplay() {
    fill(250, 190, 120);
    rect(0, 0, width, bannerHeight);
    for(int x = 0; x < width; x = x + sizeOfTile){
      for(int y = bannerHeight; y < height; y = y + sizeOfTile){
        fill(GREEN);
        stroke(0);
        square(x, y, sizeOfTile);
      }
    }
  }

  void editBanner(){
    fill(250, 190, 120);
    rect(0, 0, width, bannerHeight);
    fill(0);
    textAlign(CENTER);
    textSize(30);
    text("Flags: " + (totalBombs-totalFlags), width*0.5, bannerHeight/2);
  }

  void revealTile(int r, int c){
    board[r][c].isRevealed = !(board[r][c].isFlagged);
    if(board[r][c].isRevealed && firstClick){ //if it's the first click
      editFirstBomb(r,c);
      editNeighborBombs(r,c);
      firstClick = false;
    }

    if(!board[r][c].isBomb && board[r][c].isRevealed && board[r][c].neighborBombs == 0){ //if its a tile with 0 bomb neighbors
      fill(TAN);
      stroke(0);
      square(c * sizeOfTile, r * sizeOfTile + bannerHeight, sizeOfTile);
      revealNeighbors(r,c);
    }
    else if(!board[r][c].isBomb && board[r][c].isRevealed){ //if it's not a bomb:
      fill(TAN);
      stroke(0);
      square(c * sizeOfTile, r * sizeOfTile + bannerHeight, sizeOfTile);

      int num = board[r][c].neighborBombs;
      if(num == 1) fill(50, 100, 250);
      else if(num == 1) fill(0, 30, 150); // blue
      else if(num == 2) fill(0, 150, 50); // green
      else if(num == 3) fill(200, 0, 0); // red
      else if(num == 4) fill(150, 0, 200); // purble
      else if(num == 5) fill(255, 200, 25); // orage-yellow
      else if(num == 6) fill(0, 220, 220); // light blue/teal
      else if(num == 7) fill(100); //dark gray
      else if(num == 8) fill(150); //light gray
      textSize(sizeOfTile/1.5);
      textAlign(CENTER);
      text(board[r][c].neighborBombs, c * sizeOfTile + sizeOfTile/2.0, r * sizeOfTile + sizeOfTile/1.5 + bannerHeight);

      textSize(10);
    }
    else if(board[r][c].isRevealed){ //if it is a bomb
      fill(RED);
      stroke(0);
      square(c * sizeOfTile, r * sizeOfTile + bannerHeight, sizeOfTile);
      isDead = true;
    }
    totalHidden--;
  }

  private void revealNeighbors(int r, int c){ //only nonrevealed neighbors are affected
    //top left
    if(r - 1 >= 0 && c - 1 >= 0 && !board[r-1][c-1].isRevealed){
      revealTile(r - 1, c - 1);
    }
    //top middle
    if(r - 1 >= 0 && !board[r-1][c].isRevealed){
      revealTile(r - 1, c);
    }
    //top right
    if(r - 1 >= 0 && c + 1 < board[r].length && !board[r-1][c+1].isRevealed){
      revealTile(r - 1, c + 1);
    }
    //middle left
    if(c - 1 >= 0 && !board[r][c-1].isRevealed){
      revealTile(r, c - 1);
    }
    //middle right
    if(c + 1 < board[r].length && !board[r][c+1].isRevealed){
      revealTile(r, c + 1);
    }
    //bottom left
    if(r + 1 < board.length && c - 1 >= 0 && !board[r+1][c-1].isRevealed){
      revealTile(r + 1, c - 1);
    }
    //bottom middle
    if(r + 1 < board.length && !board[r+1][c].isRevealed){
      revealTile(r + 1, c);
    }
    //bottom right
    if(r + 1 < board.length && c + 1 < board[r].length && !board[r+1][c+1].isRevealed){
      revealTile(r + 1, c + 1);
    }
  }
  
  private void editNeighborBombs(int r, int c){
    //top left
    if(r - 1 >= 0 && c - 1 >= 0){
      editFirstBomb(r-1,c-1);
    }
    //top middle
    if(r - 1 >= 0){
      editFirstBomb(r-1,c);
    }
    //top right
    if(r - 1 >= 0 && c + 1 < board[r].length){
      editFirstBomb(r-1,c+1);
    }
    //middle left
    if(c - 1 >= 0){
      editFirstBomb(r,c-1);
    }
    //middle right
    if(c + 1 < board[r].length){
      editFirstBomb(r,c+1);
    }
    //bottom left
    if(r + 1 < board.length && c - 1 >= 0){
      editFirstBomb(r+1,c-1);
    }
    //bottom middle
    if(r + 1 < board.length){
      editFirstBomb(r+1,c);
    }
    //bottom right
    if(r + 1 < board.length && c + 1 < board[r].length){
      editFirstBomb(r+1,c+1);
    }
  }

  
  void flagTile(int r, int c){
    board[r][c].isFlagged = !board[r][c].isFlagged && !board[r][c].isRevealed;
    if(board[r][c].isFlagged == true){
      fill(RED);
      stroke(0);
      circle(c * sizeOfTile + (sizeOfTile/2), r * sizeOfTile + (sizeOfTile/2) + bannerHeight, sizeOfTile/2);
      totalFlags++;
    }
    else if(!board[r][c].isRevealed){
      fill(GREEN);
      stroke(0);
      square(c * sizeOfTile, r * sizeOfTile + bannerHeight, sizeOfTile);
      totalFlags--;
    }
  }

  public void deathScreen(){
    for(int r = 0; r < board.length; r++){
      for(int c = 0; c < board[r].length; c++){
        if(!board[r][c].isBomb && board[r][c].isFlagged){ //incorrect flags
          fill(GREEN);
          stroke(0);
          square(c * sizeOfTile, r * sizeOfTile + bannerHeight, sizeOfTile); //refills the square
          
          stroke(RED);
          line(c * sizeOfTile + (sizeOfTile/2) - sizeOfTile/2, r * sizeOfTile + (sizeOfTile/2) + bannerHeight - sizeOfTile/2, //bottom left
               c * sizeOfTile + (sizeOfTile/2) + sizeOfTile/2, r * sizeOfTile + (sizeOfTile/2) + bannerHeight + sizeOfTile/2); // to top right
          line(c * sizeOfTile + (sizeOfTile/2) + sizeOfTile/2, r * sizeOfTile + (sizeOfTile/2) + bannerHeight - sizeOfTile/2, //bottom right
               c * sizeOfTile + (sizeOfTile/2) - sizeOfTile/2, r * sizeOfTile + (sizeOfTile/2) + bannerHeight + sizeOfTile/2); //to top left
          
        }
        else if(board[r][c].isBomb){
          revealTile(r, c);
        }
      }
    }
    page = 4; //unless you want to keep pressing, in which case delete
  }
  public void winScreen(){
    fill(200, 255, 200);
    rect(0, 0, width, bannerHeight);
    fill(255, 200, 200);
    textSize(80);
    textAlign(CENTER);
    text("WIN >:D", width/2, bannerHeight*.8);
  }
}
