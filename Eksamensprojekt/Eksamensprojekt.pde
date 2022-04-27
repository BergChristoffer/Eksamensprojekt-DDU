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

Enemy enemy1;

Gun gun;
//LevelController levelcontroller;

boolean playSinglePlayer, playMultiPlayer = false;
boolean start = true;
boolean singlePlayerLoginScreen = false;
boolean multiplayerLoginScreen = false;

Wall[] wall = new Wall[20];
ArrayList<Enemy> enemyList = new ArrayList<Enemy>();


void setup() {
  frameRate(60);
  size(1000, 1000);
  noStroke();
  player1 = new Player(width/2, height/2, new MachineGun());
  player2 = new Player(width/2+100, height/2, new Pistol());
  //enemy1 = new Enemy(width/2, height/2);
  cp5 = new ControlP5(this);
  drawSingleplayerLoginTextBox();
  drawMultiplayerLoginTextBox();
  singleplayerText.setVisible(false);
  multiplayerText.setVisible(false);
  for (int i = 0; i<wall.length; i++) {
    wall[i]=new Wall(random(width), random(height), random(5, 80), color(0, 255, 0));
    player1.speed.x=30;
    player2.speed.x=30;
  }
  for (int i = 0; i < 1; i++) {
    enemyList.add(new Enemy(random(width), random(height)));
  }
}

void draw() {
  background(255);
  updateBullets();
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

    for (int i = 0; i < enemyList.size(); i++) {
      enemyList.get(i).update();
    }

    if (player1.wallcolision()==false)
      updateMovementPlayer1();
    else {
      player1.position.x=player1.position.x-(player1.speed.x*0.5);
      player1.position.y=player1.position.y-(player1.speed.y*0.5);
    }

    if (playMultiPlayer) {
      player2.update();
      player2.display(color(0, 0, 255));
      if (player2.wallcolision()==false)
        updateMovementPlayer2();
      else {
        player2.position.x=player2.position.x-(player2.speed.x*0.5);
        player2.position.y=player2.position.y-(player2.speed.y*0.5);
      }
    }
    for (int i = 0; i<wall.length; i++) {
      wall[i].update();
      wall[i].display();
    }
  }
}
