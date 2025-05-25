private int sizeOfTile = 50;
private int bombs = 50;
private Grid game;

void setup(){
  size(800, 800);
  game = new Grid(width/sizeOfTile, bombs);
  game.initialDisplay();
}
void draw(){
}

void mousePressed(){
  int c = mouseX / sizeOfTile;
  int r = mouseY / sizeOfTile;
  fill(0);
  text(r + ", " + c, 10, 10);
  if(mouseButton == LEFT){
    game.revealTile(r, c);
  }
  else if(mouseButton == RIGHT){
    game.flagTile(r, c);
  }
}
