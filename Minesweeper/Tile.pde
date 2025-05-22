public class Tile{
  private boolean isBomb;
  private int neighborBombs;
  private boolean isRevealed;
  private boolean isFlagged;
  
  public Tile(){
    isBomb = false;
    neighborBombs = 0;
    isRevealed = false;
    isFlagged = false;
  }
}
