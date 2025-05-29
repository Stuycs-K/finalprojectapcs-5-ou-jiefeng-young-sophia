private int sizeOfTile = 50;
private int bombs = 25;
private Grid game;
private int bannerHeight = 100;
private int page = 0;

void setup(){
  size(800, 900);
  mainMenu();
  //game = new Grid(width/sizeOfTile, bombs);
  //game.initialDisplay();
}
void draw(){
}

void mainMenu(){
  textSize(100);
  textAlign(CENTER);
  text("Minesweeper", 400, 200);
  
  textSize(50);
  textAlign(CENTER);
  text("PLAY", 400, 500); 
}

void mousePressed(){
  if(page == 0){
    menuPressed();
  }
  if(page == 2){
    gamePressed();
  }
}

void menuPressed(){
  if(300 < mouseX && mouseX < 500 && 450 < mouseY && mouseY < 550){
    page++;
  }
}

void gamePressed(){
  if(mouseY > bannerHeight){
    int c = mouseX / sizeOfTile;
    int r = (mouseY - bannerHeight)/ sizeOfTile;
    fill(0);
    if(mouseButton == LEFT){
      game.revealTile(r, c);
      if(game.isDead){
        game.deathScreen();
      }
    }
    else if(mouseButton == RIGHT){
      game.flagTile(r, c);
    }
  }
  game.editBanner();
}
  

void keyPressed(){
  if(key == ' '){
    setup();
  }
}
