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
Button placeholderP1a;
Button placeholderP1b;
Button placeholderP1c;

Button buyRifleButtonP2;
Button buyMachineGunButtonP2;
Button placeholderP2a;
Button placeholderP2b;
Button placeholderP2c;
PImage background, red, blue;

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
int totaltime;
void setup() {
  red = loadImage("red.png");
  blue = loadImage("blue.png");
  red.resize(250, 250);
  blue.resize(250, 250);
  imageMode(CENTER);
  frameRate(60);
  size(1500, 900, P2D);
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

    if (startLevel3) {
      player1.position = new PVector(100, 100);
      player2.position = new PVector(width-100, 100);
      wallList.clear();
      levelOver = false;
      startLevel3 = false;
      level3IsRunning = true;
      createLevel3();
      wave1 = true;
      spawnLevel3Enemies();
    }

    if (startLevel4) {
      player1.position = new PVector(100, 70);
      player2.position = new PVector(width-100, 70);
      wallList.clear();
      levelOver = false;
      startLevel4 = false;
      level4IsRunning = true;
      wave1 = true;
      createLevel4();
      spawnLevel4Enemies();
    }

    if (startLevel5) {
      player1.position = new PVector(100, 70);
      player2.position = new PVector(width-100, 70);
      wallList.clear();
      levelOver = false;
      startLevel5 = false;
      level5IsRunning = true;
      wave1 = true;
      createLevel5();
      spawnLevel5Enemies();
    }

    //kontroler bølger af fjender
    if (level1IsRunning && wave1 && enemyList.size() == 0) {
      wave1 = false;
      wave2 = true;
      spawnLevel1Enemies();
    }
    if (level1IsRunning && wave2 && enemyList.size() == 0) {
      wave2 = false;
      wave3 = true;
      spawnLevel1Enemies();
    }
    if (level1IsRunning && wave3 && enemyList.size() == 0)
      levelOver = true;



    if (level2IsRunning && wave1 && enemyList.size() == 0) {
      wave1 = false;
      wave2 = true;
      spawnLevel2Enemies();
    }
    if (level2IsRunning && wave2 && enemyList.size() == 0) 
      levelOver = true;



    if (level3IsRunning && wave1 && enemyList.size() == 0) {
      wave1 = false;
      wave2 = true;
      spawnLevel3Enemies();
    }
    if (level3IsRunning && wave2 && enemyList.size() == 0) {
      wave2 = false;
      wave3 = true;
      spawnLevel3Enemies();
    }
    if (level3IsRunning && wave3 && enemyList.size() == 0)
      levelOver = true;



    if (level4IsRunning && wave1 && enemyList.size() == 0) {
      wave1 = false;
      wave2 = true;
      spawnLevel4Enemies();
      wallList.clear();
      createLevel4();
    }
    if (level4IsRunning && wave2 && enemyList.size() == 0) {
      wave2 = false;
      wave3 = true;
      spawnLevel4Enemies();
      wallList.clear();
      createLevel4();
    }
    if (level4IsRunning && wave3 && enemyList.size() == 0) {
      wave3 = false;
      wave4 = true;
      spawnLevel4Enemies();
    }
    if (level4IsRunning && wave4 && enemyList.size() == 0)
      levelOver = true;


    if (level5IsRunning && wave1 && enemyList.size() == 0) {
      wave1 = false;
      wave2 = true;
      spawnLevel5Enemies();
    }
    if (level5IsRunning && wave2 && enemyList.size() == 0) {
      wave2 = false;
      wave3 = true;
      spawnLevel5Enemies();
      wallList.clear();
      createLevel5();
    }
    if (level5IsRunning && wave3 && enemyList.size() == 0)
      levelOver = true;


    if (levelOver) {
      totaltime = 360;
      fill(0, 255, 0);
      rect(width/2, height-10, width-(time*(width/totaltime))-50, 20);
      time ++;
      if (time == totaltime) {
        newLevel = true;
        time = 0;
      }
    }

    if (newLevel) {
      if (level1IsRunning) {
        level1IsRunning = false;
        startLevel2 = true;
        newLevel = false;
      }
      if (level2IsRunning) {
        level2IsRunning = false;
        startLevel3 = true;
        newLevel = false;
      }
      if (level3IsRunning) {
        level3IsRunning = false;
        startLevel4 = true;
        newLevel = false;
      }
      if (level4IsRunning) {
        level4IsRunning = false;
        startLevel5 = true;
        newLevel = false;   
      }
    }

    if (levelOver) {
      openShopP1();
      buyRifleButtonP1.update();
      buyMachineGunButtonP1.update();
      placeholderP1a.update();
      placeholderP1b.update();
      placeholderP1c.update();
      wave1=false;
      wave2=false;
      wave3=false;
      wave4=false;
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
        placeholderP2a.update();
        placeholderP2b.update();
        placeholderP2c.update();
      }

      updateMovementPlayer2();
      if (player2.wallcolision()) {
        player2.position = new PVector(player2.tempPos.x, player2.tempPos.y);
        player2.colide = false;
      }
    }


    displayScore();
    //for (int i = 0; i<wall.length; i++) {
    //  wall[i].update();
    //  wall[i].display();
    //}
  }
}

long money = 0;
long totalMoney = 0;

void displayScore() {
  fill(255);
  strokeWeight(5);
  stroke(50);
  rect(width/2, 30, 250, 100);
  noStroke();
  fill(0);
  textSize(40);
  text("Money: " + money, width/2, 25);
}
