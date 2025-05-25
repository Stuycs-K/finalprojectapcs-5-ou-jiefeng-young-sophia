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
 /* void setIsRevealed(){
    this.isRevealed = !isRevealed;
  }
  void setFlgged(){
    this.isFlagged = !isFlagged;
  }
  void setBomb(){
    this.isBomb = !isBomb;
  }*/
}
