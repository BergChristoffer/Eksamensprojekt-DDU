import controlP5.*;
import de.bezier.data.sql.*;
import de.bezier.data.sql.mapper.*;


ControlP5 cp5;
SQLite db;

Button singlePlayerButton;
Button multiPlayerButton;
Button highScorePageButton;
Button backButton;
Button playButton;

Player player1;
Player player2;

boolean playSinglePlayer, playMultiPlayer = false;
boolean start = true;
boolean singlePlayerLoginScreen = false;
boolean multiplayerLoginScreen = false;


void setup() {
  size(1000, 1000);
  noStroke();
  player1 = new Player(width/2-100, height/2);
  player2 = new Player(width/2+100, height/2);
  cp5 = new ControlP5(this);
  drawSingleplayerLoginTextBox();
  drawMultiplayerLoginTextBox();
  singleplayerText.setVisible(false);
  multiplayerText.setVisible(false);
}

void draw() {
  background(255);

  if (start) {
    drawStartScreen();
    singlePlayerButton.update();
    multiPlayerButton.update();
    highScorePageButton.update();
  }

  if (singlePlayerLoginScreen) {
    singleplayerText.setVisible(true);
    drawSinglePlayerLoginButtons();
    playButton.update();
    backButton.update();
  }

  if (multiplayerLoginScreen) {
    multiplayerText.setVisible(true);
    drawMultiplayerLoginButtons();
    playButton.update();
    backButton.update();
  }
  
  if (playSinglePlayer) {
    player1.display(color(255, 0, 0));  
    if (playMultiPlayer) {
      player2.display(color(0, 0, 255));
    }
  }
}
