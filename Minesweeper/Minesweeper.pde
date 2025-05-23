private int sizeOfTile = 50; // is placeholder value

void setup(){
  size(800, 800);
  initialDisplay();
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
