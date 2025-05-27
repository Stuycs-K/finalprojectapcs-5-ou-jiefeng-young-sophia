private int sizeOfTile = 50;
private int bombs = 50;
private Grid game;
private int bannerHeight = 100;

void setup(){
  size(800, 900);
  game = new Grid(width/sizeOfTile, bombs);
  game.initialDisplay();
}
void draw(){
}

void mousePressed(){
  if(mouseY > bannerHeight){
    int c = mouseX / sizeOfTile;
    int r = (mouseY - bannerHeight)/ sizeOfTile;
    fill(0);
    if(mouseButton == LEFT){
      game.revealTile(r, c);
    }
    else if(mouseButton == RIGHT){
      game.flagTile(r, c);
    }
  }
}

void keyPressed(){
  if(key == ' '){
    setup();
  }
}
