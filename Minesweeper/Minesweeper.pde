private int sizeOfTile = 50;
private int bombs = 25;
private Grid game;
private int bannerHeight = 100;
private int page = 0;

void setup(){
  size(800, 900);
  menuSetup();
  //game = new Grid(width/sizeOfTile, bombs);
  //game.initialDisplay();
}
void draw(){
}

void mousePressed(){
  if(page == 0){
    menuPressed();
  }
  if(page == 1){
    selectionPressed();
  }
  if(page == 2){
    gamePressed();
  }
}

void menuSetup(){
  textSize(100);
  textAlign(CENTER);
  text("Minesweeper", 400, 200);
  
  textSize(50);
  textAlign(CENTER);
  text("PLAY", 400, 500); 
}

void menuPressed(){
  if(300 < mouseX && mouseX < 500 && 450 < mouseY && mouseY < 550){
    selectionMenu();
    page++;
  }
}

void selectionMenu(){
  fill(255);
  rect(0, 0, width, height);
  
  fill(0);
  textSize(100);
  textAlign(CENTER);
  text("Selection", 400, 200); 
  
  fill(250, 250, 150);
  rect(25, 500, 125, 250); //easy
  rect(225, 500, 125, 250); //medium
  rect(425, 500, 125, 250); //hard
  rect(625, 500, 125, 250); //custom
  
  fill(0);
  textSize(25);
  textAlign(CENTER);
  text("Easy", 25, 500); 
}

void selectionPressed(){
  
}

void gamePressed(){
  if(mouseY > bannerHeight){
    int c = mouseX / sizeOfTile;
    int r = (mouseY - bannerHeight)/ sizeOfTile;
   // fill(0);
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
