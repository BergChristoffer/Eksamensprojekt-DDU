Button singlePlayerButton;
Button multiPlayerButton;
Button highScorePageButton;

Player player1;
Player player2;


void setup() {
  size(1000, 1000);
  noStroke();
  player1 = new Player(width/2-100,height/2);
  player2 = new Player(width/2+100,height/2);

}

void draw() {
  drawStartScreen();

  singlePlayerButton.update();
  multiPlayerButton.update();
  highScorePageButton.update();

  //player1.display(color(255,0,0));
  //player2.display(color(0,0,255));
}

void drawStartScreen() {
  
  singlePlayerButton = new Button(width * 1/4, height/2-100, width/2, height-200, color(255, 0, 0), "SINGLEPLAYER", 50);
  if (singlePlayerButton.buttonClicked())
    println("singlePlayer");

  multiPlayerButton = new Button(width * 3/4, height/2-100, width/2, height-200, color(0, 0, 255), "MULTIPLAYER", 50);
  if (multiPlayerButton.buttonClicked())
    println("multiplayer");

  highScorePageButton = new Button(width/2, height-100, width, 200, color(125), "HIGHSCORES", 50);
    if (highScorePageButton.buttonClicked())
    println("highscores");
}
