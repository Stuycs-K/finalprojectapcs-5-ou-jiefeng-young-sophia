private int sizeOfTile = 50;
private int bombs = 25;
private Grid game;
private int bannerHeight = 100;
private int page = 0;
private int customPage = 100;
private int customPercentage = 20;

void setup(){
  size(800, 900);
  page = 0;
  menuSetup();
  sizeOfTile = 50;
  bombs = 25;
  frameRate(30); //default
}
void draw(){
  if(game != null && game.isDead && game.hiddenBombs.size() > 0){
    int randIndex = (int) (Math.random() * game.hiddenBombs.size());
    Tile t = game.hiddenBombs.remove(randIndex);
    game.revealTile(t.r, t.c);
  }
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
  fill(#82C8E5); //sky blue
  rect(0, 0, 800, 900); //sky
  
  fill(#D1FFBD); //light green
  rect(0, 750, 800, 900); //grass
  
  stroke(#a9fb4c); //green
  strokeWeight(10);
  noFill();
  arc((float) (Math.random() * 500) + 300, 800, 200, 500, PI/2 + PI, 2* PI);
  
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
    bombs = 10;
    sizeOfTile = 80;
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
  text("4 ", 250, 230);
  text("16 ", 250, 230 + 60);
  text("25 ", 250, 230 + 120);
  text("64 ", 250, 230 + 180);
  text("100", 250, 230 + 240);
  text("256 ", 250, 230 + 300);
  text("400 ", 250, 230 + 360);
  text("625", 250, 230 + 420);
  text("1024 ", 250, 230 + 480);
  text("1600 ", 250, 230 + 540);
  textAlign(LEFT);
  text("  5%", 550, 200 + 60);
  text(" 10%", 550, 200 + 120);
  text(" 15%", 550, 200 + 180);
  text(" 20%", 550, 200 + 240);
  text(" 25%", 550, 200 + 300);
  text(" 30%", 550, 200 + 360);
  text(" 35%", 550, 200 + 420);
  text(" 40%", 550, 200 + 480);
  text(" 45%", 550, 200 + 540);
  text(" 50%", 550, 200 + 600);
  textSize(30);
  textAlign(CENTER, BOTTOM);
  text("Tiles", 275, 190); 
  text("Bomb Density", 525, 190); 

}
void customPressed(){
  if(200 < mouseY && mouseY < 800){
    if(250 < mouseX && mouseX < 300){//size
      fill(255);
      noStroke();
      rect(250, 185, 55, 650);
      stroke(0);
      fill(250, 250, 150);
      rect(250, 200, 50, 600); 
      fill(250, 50, 50);
      rect(250, mouseY - 15, 50, 30);
      int ycor = mouseY - 200;
      if(ycor <= 60) sizeOfTile = 400;
      else if(ycor <= 120) sizeOfTile = 200;
      else if(ycor <= 180) sizeOfTile = 160;
      else if(ycor <= 240) sizeOfTile = 100;
      else if(ycor <= 300) sizeOfTile = 80 ;
      else if(ycor <= 360) sizeOfTile = 50;
      else if(ycor <= 420) sizeOfTile = 40;
      else if(ycor <= 480) sizeOfTile = 32;
      else if(ycor <= 540) sizeOfTile = 25;
      else if(ycor <= 600) sizeOfTile = 20;
      
    }
    else if(500 < mouseX && mouseX < 550){//bombs by percentage
      fill(255);
      noStroke();
      rect(500, 185, 55, 650);
      stroke(0);
      fill(250, 250, 150);
      rect(500, 200, 50, 600); 
      fill(250, 50, 50);
      rect(500, mouseY - 15, 50, 30);
      customPercentage = (mouseY - 200)/12;
      
    }
     bombs =(int)((800.0/sizeOfTile)*(800.0/sizeOfTile)*(customPercentage/100.0));
  }
}


void gamePressed(){
  if(mouseY > bannerHeight){
    int c = mouseX / sizeOfTile;
    int r = (mouseY - bannerHeight)/ sizeOfTile;
    
    if(mouseButton == LEFT){ //reveals tile
      game.revealTile(r, c);
      if(game.isDead){
        game.deathScreen();
      }
    }
    
    else if(mouseButton == RIGHT){ //flags tile
      game.flagTile(r, c);
    }
  }
  
  game.editBanner(); //updates flags
  
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
