private int sizeOfTile = 50;
private int bombs = 25;
private Grid game;
private int bannerHeight = 100;
private int page = 0;
private int customPage = 100;

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
  else if(page == customPage){
    customPressed();
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
    bombs = 20;
    buttonClicked = true;
  }
  else if(225 < mouseX && mouseX < 350 && 500 < mouseY && mouseY < 750){
    bombs = 30;
    buttonClicked = true;
  }
  else if(425 < mouseX && mouseX < 550 && 500 < mouseY && mouseY < 750){
    bombs = 40;
    buttonClicked = true;
  }
  else if(625 < mouseX && mouseX < 750 && 500 < mouseY && mouseY < 750){
    customMenu();
    page = customPage;
  }

  if(buttonClicked){
    game = new Grid(width/sizeOfTile, bombs);
    game.initialDisplay();
    page++;
  }
}

void customMenu(){
  fill(255);
  rect(0, 0, width, height);
  fill(250, 250, 150);
  rect(250, 200, 50, 600); //sizeOfTile 
  rect(500, 200, 50, 600); //bombs
  
  textAlign(RIGHT);
  fill(0);
  text("20 ", 250, 230);
  text("25 ", 250, 230 + 60);
  text("32 ", 250, 230 + 120);
  text("40 ", 250, 230 + 180);
  text("50 ", 250, 230 + 240);
  text("80 ", 250, 230 + 300);
  text("100 ", 250, 230 + 360);
  text("160 ", 250, 230 + 420);
  text("200 ", 250, 230 + 480);
  text("400 ", 250, 230 + 540);
  textAlign(LEFT);
  text(" 10%", 550, 200 + 60);
  text(" 20%", 550, 200 + 120);
  text(" 30%", 550, 200 + 180);
  text(" 40%", 550, 200 + 240);
  text(" 50%", 550, 200 + 300);
  text(" 60%", 550, 200 + 360);
  text(" 70%", 550, 200 + 420);
  text(" 80%", 550, 200 + 480);
  text(" 90%", 550, 200 + 540);
  text(" 100%", 550, 200 + 600);
  textSize(30);
  textAlign(CENTER, BOTTOM);
  text("Tile Size", 275, 190); 
  text("Bomb Density", 525, 190); 

}
void customPressed(){
  if(200 < mouseY && mouseY < 800){
    if(250 < mouseX && mouseX < 300){//size
      fill(255);
      noStroke();
      rect(250, 190, 55, 650);
      stroke(0);
      fill(250, 250, 150);
      rect(250, 200, 50, 600); 
      fill(250, 50, 50);
      rect(250, mouseY - 15, 50, 30);
      int ycor = mouseY - 230;
      if()
    }
    else if(500 < mouseX && mouseX < 550){//bombs by percentage
      fill(255);
      noStroke();
      rect(500, 190, 55, 650);
      stroke(0);
      fill(250, 250, 150);
      rect(500, 200, 50, 600); 
      fill(250, 50, 50);
      rect(500, mouseY - 15, 50, 30);
      //1-
    }
  }
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
  if(key == ENTER && page == customPage){
    game = new Grid(width/sizeOfTile, bombs);
    game.initialDisplay();
    page = 2;
  }
}
