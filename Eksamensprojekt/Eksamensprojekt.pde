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

//LevelController levelcontroller;

boolean playSinglePlayer, playMultiPlayer = false;
boolean start = true;
boolean singlePlayerLoginScreen = false;
boolean multiplayerLoginScreen = false;

Wall wall;

void setup() {
  size(1000, 1000);
  noStroke();
  player1 = new Player(width/2, height/2);
  player2 = new Player(width/2+100, height/2);
  cp5 = new ControlP5(this);
  drawSingleplayerLoginTextBox();
  drawMultiplayerLoginTextBox();
  singleplayerText.setVisible(false);
  multiplayerText.setVisible(false);
  wall = new Wall(100, 100, 50, color(0, 255, 0));
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
    player1.update();
    player1.display(color(255, 0, 0));
    updateMovementPlayer1();

    if (playMultiPlayer) {
      player2.update();
      player2.display(color(0, 0, 255));
      updateMovementPlayer2();
    }
    //wall.update();
    //wall.display();
  }
}
