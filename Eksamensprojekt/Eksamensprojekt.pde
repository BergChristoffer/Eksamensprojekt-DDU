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
Button buyRifleButtonP1;
Button buyMachineGunButtonP1;
Button buyRifleButtonP2;
Button buyMachineGunButtonP2;
PImage background;

Player player1;
Player player2;

Gun gun;
//LevelController levelController;

boolean playSinglePlayer, playMultiPlayer, multiplayerLoginScreen, singlePlayerLoginScreen, newLevel, levelOver;
boolean start = true;


Wall[] wall = new Wall[20];
ArrayList<Enemy> enemyList = new ArrayList<Enemy>();
ArrayList<Wall> wallList = new ArrayList<Wall>();

int time = 0;
void setup() {
  imageMode(CENTER);
  frameRate(60);
  size(1500, 900);
  background = loadImage("background.png");
  noStroke();
  //enemy1 = new Enemy(width/2, height/2);
  cp5 = new ControlP5(this);
  drawSingleplayerLoginTextBox();
  drawMultiplayerLoginTextBox();
  singleplayerText.setVisible(false);
  multiplayerText.setVisible(false);

  //for (int i = 0; i<wall.length; i++) {
  //  wall[i]=new Wall(random(width), random(height), random(5, 80), color(0, 255, 0));
  //}
  //for (int i = 0; i < 5; i++) {
  //  enemyList.add(new Enemy(new PVector(random(width), random(height)), new Pistol()));
  //}
}

void draw() {
  background(255);
  image(background, width/2, height/2);
  updateBullets();
  updateEnemy();
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

    updateEnemyShooting();
    for (int i = 0; i < wallList.size(); i++) {
      wallList.get(i).update();
    }

    //kontroller levels
    if (startLevel1) {
      player1 = new Player(width/2-200, height-100, "Pistol", color(255, 0, 0));
      player2 = new Player(width/2+200, height-100, "Pistol", color(0, 0, 255));
      startLevel1 = false;
      level1IsRunning = true;
      createLevel1();
      wave1 = true;
      spawnLevel1Enemies();
    }
    player1.update();




    if (startLevel2) {
      player1.position = new PVector(100, 100);
      player2.position = new PVector(100, 100);
      wallList.clear();
      levelOver = false;
      startLevel2 = false;
      level2IsRunning = true;
      createLevel2();
      wave1 = true;
      spawnLevel2Enemies();
    }

    //kontroler bølger af fjender
    if (level1IsRunning && wave1 && enemyList.size() == 0) {
      wave1 = false;
      wave2 = true;
      spawnLevel1Enemies();
    }
    if (level1IsRunning && wave2 && enemyList.size() == 0)
      levelOver = true;


    if (level2IsRunning && wave1 && enemyList.size() == 0) {
      wave1 = false;
      wave2 = true;
      spawnLevel2Enemies();
    }
    if (level2IsRunning && wave2 && enemyList.size() == 0)
      levelOver = true;





    //vis mængden af penge på skærmen
    displayScore();


    if (levelOver) {     
      if (time == 360)
        newLevel = true;

      time ++;
    }

    if (newLevel) {
      if (level1IsRunning) {
        level1IsRunning = false;
        startLevel2 = true;
      }
    }

    if (levelOver) {
      openShopP1();
      buyRifleButtonP1.update();
      buyMachineGunButtonP1.update();
      wave2=false;
    }

    //opdater alle arrayliste af enemy objekter
    for (int i = 0; i < enemyList.size(); i++) {
      enemyList.get(i).update();
    }

    //if (player1.wallcolision() == false)
    updateMovementPlayer1();
    if (player1.wallcolision()) {
      player1.position = new PVector(player1.tempPos.x, player1.tempPos.y);
      player1.colide = false;
    }


    if (playMultiPlayer) {
      player2.update();

      if (levelOver) {
        openShopP2();
        buyRifleButtonP2.update();
        buyMachineGunButtonP2.update();
      }

      updateMovementPlayer2();
      if (player2.wallcolision()) {
        player2.position = new PVector(player2.tempPos.x, player2.tempPos.y);
        player2.colide = false;
      }
    }



    //for (int i = 0; i<wall.length; i++) {
    //  wall[i].update();
    //  wall[i].display();
    //}
  }
}

long money = 0;
long totalMoney = 0;

void displayScore() {
  fill(0);
  textSize(25);
  text("Money: " + money, width/2, 20);
}
