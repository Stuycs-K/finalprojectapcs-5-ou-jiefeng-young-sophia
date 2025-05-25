int sizeOfTile = 50; // is placeholder value
Grid g;

void setup(){
  size(800, 800);
  g = new Grid(width/sizeOfTile, 10, sizeOfTile);
  g.initialDisplay();
  fill(0);
  square(10, 10, 10);
}

void draw(){
}
void draw(){
}

void mousePressed(){
  int c = mouseX / sizeOfTile;
  int r = mouseY / sizeOfTile;
  if(mouseButton == LEFT){
    revealTile(r, c);
  }
  else if(mouseButton == RIGHT){
    flagTile(r, c);
  }
}
