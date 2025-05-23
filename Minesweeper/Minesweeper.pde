private int sizeOfTile = 50; // is placeholder value

void setup(){
  size(800, 800);
  initialDisplay();
}
void initialDisplay() {
  for(int x = 0; x < width; x = x + sizeOfTile){
    for(int y = 0; y < height; y = y + sizeOfTile){
      fill(150, 250, 200); 
      stroke(0);
      square(x, y, sizeOfTile);
    }
  }
}
