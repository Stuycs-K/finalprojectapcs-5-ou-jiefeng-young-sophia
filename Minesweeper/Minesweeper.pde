private int sizeOfTile = 50;
private int bombs = 25;
private Grid game;
private int bannerHeight = 100;
private int page = 0;

void setup(){
  size(800, 900);
  page = 0;
  menuSetup();
}
void draw(){
}

void mousePressed(){
  if(page == 0){
    menuPressed();
  }
  else if(page == 1){
    selectionPressed();
  }
  else if(page == 2){
    gamePressed();
  }
}

void menuSetup(){
  fill(100);
  rect(0, 0, width, height);

  fill(255);
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
  text("Easy", 80, 625);
  text("Medium", 280, 625);
  text("Hard", 480, 625);
  text("Custom", 680, 625);
}

void selectionPressed(){
  boolean buttonClicked = false;
  if(25 < mouseX && mouseX < 150 && 500 < mouseY && mouseY < 750){
    bombs = 1;
    sizeOfTile = 200;
    buttonClicked = true;
  }
  else if(225 < mouseX && mouseX < 350 && 500 < mouseY && mouseY < 750){
    bombs = 40;
    sizeOfTile = 50;
    buttonClicked = true;
  }
  else if(425 < mouseX && mouseX < 550 && 500 < mouseY && mouseY < 750){
    bombs = 100;
    sizeOfTile = 32;
    buttonClicked = true;
  }
  else if(625 < mouseX && mouseX < 750 && 500 < mouseY && mouseY < 750){
    customMenu();
  }

  if(buttonClicked){
    game = new Grid(width/sizeOfTile, bombs);
    game.initialDisplay();
    page++;
  }
}

void customMenu(){
  //new menu, page 1.5
  //type numbers for bombs and/or sizeOfTile or choose from a list
  
  page++;
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
  if(game.totalHidden == game.totalBombs){
    game.winScreen();
  }

}



void keyPressed(){
  if(key == ' '){
    setup();
  }
}
