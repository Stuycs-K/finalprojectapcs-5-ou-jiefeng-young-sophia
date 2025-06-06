public class Tile{
  private boolean isBomb;
  private int neighborBombs;
  private boolean isRevealed;
  private boolean isFlagged;
  private int r;
  private int c;
  
  public Tile(){
    isBomb = false;
    neighborBombs = 0;
    isRevealed = false;
    isFlagged = false;
  }
  
  public Tile(int row, int column){
    super();
    r = row;
    c = column;
  }
}
