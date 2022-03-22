Button singlePlayerButton;
Button multiPlayerButton;
Button highScorePageButton;
Button backButton;

Player player1;
Player player2;

boolean playSinglePlayer, playMultiPlayer = false;
boolean start = true;
void setup() {
  size(1000, 1000);
  noStroke();
  player1 = new Player(width/2-100, height/2);
  player2 = new Player(width/2+100, height/2);
}

void draw() {
  background(255);

  if (start) {
    drawStartScreen();
    singlePlayerButton.update();
    multiPlayerButton.update();
    highScorePageButton.update();
  }

  if (playSinglePlayer) {
    player1.display(color(255, 0, 0));  
    if (playMultiPlayer) {
      player2.display(color(0, 0, 255));
    }
    
      backButton = new Button(100, 100, 100, 100, color(255, 0, 255), "back", 30);
      if(backButton.buttonClicked()){
        start = true;
        playSinglePlayer = false;
        playMultiPlayer = false;   
      }    
    backButton.update();
  }
}

void drawStartScreen() {
  singlePlayerButton = new Button(width * 1/4, height/2-100, width/2, height-200, color(255, 0, 0), "SINGLEPLAYER", 50);
  if (singlePlayerButton.buttonClicked()) {
    playSinglePlayer = true;
    start = false;
  }

  multiPlayerButton = new Button(width * 3/4, height/2-100, width/2, height-200, color(0, 0, 255), "MULTIPLAYER", 50);
  if (multiPlayerButton.buttonClicked()) {
    playSinglePlayer = true;
    playMultiPlayer = true;
    start = false;
  }

  highScorePageButton = new Button(width/2, height-100, width, 200, color(125), "HIGHSCORES", 50);
  if (highScorePageButton.buttonClicked())
    println("highscores");
}
