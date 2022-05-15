//metode til startskærm
void drawStartScreen() {
  background(50);
  singlePlayerButton = new Button(width * 1/4, height/2-100, width/2, height-200, color(255, 0, 0), "SINGLEPLAYER", 50);
  if (singlePlayerButton.isClicked()) {
    start = false;
    singlePlayerLoginScreen = true;
    singleplayerName = "";
    multiplayerName = "";
  }
  multiPlayerButton = new Button(width * 3/4, height/2-100, width/2, height-200, color(0, 0, 255), "MULTIPLAYER", 50);
  if (multiPlayerButton.isClicked()) {
    start = false;
    multiplayerLoginScreen = true;
    singleplayerName = "";
    multiplayerName = "";
  }
  highScorePageButton = new Button(width/2, height-100, width, 200, color(125), "HIGHSCORES", 50);
  if (highScorePageButton.isClicked()) {
    start = false;
    highScoreScreen = true;
    getSingleplayerResults();
    getMultiplayerResults();
  }
}

//singePlayerLoginScreen metoder
Textfield singleplayerText;
void drawSingleplayerLoginTextBox() {
  singleplayerText = cp5.addTextfield("create player")
    .setPosition(width/2-250, height/2-150)
    .setSize(500, 100)
    .setFont(createFont("arial", 50))
    .setColorCaptionLabel(color(0))
    .setColorActive(color(255, 0, 0))
    .setColorBackground(color(255, 0, 0))
    .setColorForeground(color(150, 0, 0));
}
void drawSinglePlayerLoginButtons() {
  playButton = new Button(width/2, height/2+75, 500, 75, color(125), "PLAY", 35);
  if (playButton.isClicked()) {
    singleplayerName = cp5.get(Textfield.class, "create player").getText();
    playSinglePlayer = true;
    singlePlayerLoginScreen = false;
    singleplayerText.setVisible(false);
    //createSingleplayer();
    startLevel1 = true;
    highscoreTimer = 0;
    highscoreTimerCounter = 0;
  }
  backButton = new Button(150, 100, 200, 100, color(125), "BACK", 30);
  if (backButton.isClicked()) {
    start = true;
    singlePlayerLoginScreen = false;
    singleplayerText.setVisible(false);
  }
}

//multiplayerLoginScreen metoder
Textfield multiplayerText;
void drawMultiplayerLoginTextBox() {
  multiplayerText = cp5.addTextfield("create team")
    .setPosition(width/2-250, height/2-150)
    .setSize(500, 100)
    .setFont(createFont("arial", 50))
    .setColorCaptionLabel(color(0))
    .setColorActive(color(0, 0, 255))
    .setColorBackground(color(0, 0, 255))
    .setColorForeground(color(0, 0, 150));
}
void drawMultiplayerLoginButtons() {
  playButton = new Button(width/2, height/2+75, 500, 75, color(125), "PLAY", 35);
  if (playButton.isClicked()) {
    multiplayerName = cp5.get(Textfield.class, "create team").getText();
    playSinglePlayer = true;
    playMultiPlayer = true;
    multiplayerLoginScreen = false;
    multiplayerText.setVisible(false);
    //createMultiplayer();
    startLevel1 = true;
    highscoreTimer = 0;
    highscoreTimerCounter = 0;
  }
  backButton = new Button(150, 100, 200, 100, color(125), "BACK", 30);
  if (backButton.isClicked()) {
    start = true;
    multiplayerLoginScreen = false;
    multiplayerText.setVisible(false);
  }
}
int rifleCost = 50;
int machineGunCost = 120;
int sniperCost = 200;
int rocketLauncherCost = 250;
int healthCost = 100;
boolean extraHealthBuffP1;
boolean extraHealthBuffP2;

void openShopP1() {
  fill(50);
  rect(width/4, height/2, width/2-60, height-60);
  fill(255);
  rect(width/4, 190, width/2-90, 280);
  image(red, width/4, 190);

  buyRifleButtonP1 = new Button(width/4, 400, width/2-90, 90, color(255, 0, 0), "BUY RIFLE : 50$", 30);
  if (buyRifleButtonP1.isClicked()) {
    if (money >= rifleCost) {
      player1 = new Player(player1.position.x, player1.position.y, "Rifle", color(255, 0, 0));
      money -= rifleCost;
    }
  }
  buyMachineGunButtonP1 = new Button(width/4, 500, width/2-90, 90, color(255, 0, 0), "BUY MACHINEGUN : 120$", 30);
  if (buyMachineGunButtonP1.isClicked()) {
    if (money >= machineGunCost) {
      player1 = new Player(player1.position.x, player1.position.y, "MachineGun", color(255, 0, 0));
      money -= machineGunCost;
    }
  }

  buySniperButtonP1 = new Button(width/4, 600, width/2-90, 90, color(255, 0, 0), "BUY SNIPER : 200$", 30);
  if (buySniperButtonP1.isClicked()) {
    if (money >= sniperCost) {
      player1 = new Player(player1.position.x, player1.position.y, "Sniper", color(255, 0, 0));
      money -= sniperCost;
    }
  }

  buyRocketLauncherButtonP1 = new Button(width/4, 700, width/2-90, 90, color(255, 0, 0), "BUY ROCKET LAUNCHER : 250$", 30);
  if (buyRocketLauncherButtonP1.isClicked()) {
    if (money >= rocketLauncherCost) {
      player1 = new Player(player1.position.x, player1.position.y, "RocketLauncher", color(255, 0, 0));
      money -= rocketLauncherCost;
    }
  }

  buyHealthButtonP1 = new Button(width/4, 800, width/2-90, 90, color(255, 0, 0), "BUY extra health + 200: 100$", 30);
  if (buyHealthButtonP1.isClicked()) {
    if (money >= healthCost) {
      money -= healthCost;
      extraHealthBuffP1 = true;
    }
  }
}

void openShopP2() {
  fill(50);
  rect(width-width/4, height/2, width/2-60, height-60);
  fill(255);
  rect(width-width/4, 190, width/2-90, 280);
  image(blue, width-width/4, 190);
  buyRifleButtonP2 = new Button(width-width/4, 400, width/2-90, 90, color(0, 0, 255), "BUY RIFLE : 50$", 30);
  if (buyRifleButtonP2.isClicked()) {
    if (money >= rifleCost) {
      player2 = new Player(player2.position.x, player2.position.y, "Rifle", color(0, 0, 255));
      money -= rifleCost;
    }
  }
  buyMachineGunButtonP2 = new Button(width-width/4, 500, width/2-90, 90, color(0, 0, 255), "BUY MACHINEGUN : 120$", 30);
  if (buyMachineGunButtonP2.isClicked()) {
    if (money >= machineGunCost) {
      player2 = new Player(player2.position.x, player2.position.y, "MachineGun", color(0, 0, 255));
      money -= machineGunCost;
    }
  }
  buySniperButtonP2 = new Button(width-width/4, 600, width/2-90, 90, color(0, 0, 255), "BUY SNIPER : 200$", 30);
  if (buySniperButtonP2.isClicked()) {
    if (money >= sniperCost) {
      player2 = new Player(player2.position.x, player2.position.y, "Sniper", color(0, 0, 255));
      money -= sniperCost;
    }
  }

  buyRocketLauncherButtonP2 = new Button(width-width/4, 700, width/2-90, 90, color(0, 0, 255), "BUY ROCKET LAUNCHER : 250$", 30);
  if (buyRocketLauncherButtonP2.isClicked()) {
    if (money >= rocketLauncherCost) {
      player2 = new Player(player2.position.x, player2.position.y, "RocketLauncher", color(0, 0, 255));
      money -= rocketLauncherCost;
    }
  }

  buyHealthButtonP2 = new Button(width-width/4, 800, width/2-90, 90, color(0, 0, 255), "BUY extra health + 200: 100$", 30);
  if (buyHealthButtonP2.isClicked()) {
    if (money >= healthCost) {
      money -= healthCost;
      extraHealthBuffP2 = true;
    }
  }
}

void drawEndScreen() {
  fill(150);
  strokeWeight(20);
  stroke(50);
  rect(width/2, height/2, width/2, height/2);
  noStroke();
  fill(0);
  textSize(50);
  text("GAME OVER", width/2, height/2);

  gameOverButton = new Button(width/2, height/2+120, 450, 90, color(255, 0, 0), "BACK TO MENU", 30);
  if (gameOverButton.isClicked()) {
    start = true;
    playSinglePlayer= false; 
    playMultiPlayer = false; 
    level1IsRunning = false; 
    level2IsRunning = false; 
    level3IsRunning = false; 
    level4IsRunning = false; 
    level5IsRunning = false;
    wave1 = false; 
    wave2 = false; 
    wave3 = false; 
    wave4 = false;
    gameOverScreen = false;



    startLevel1 = false; 
    startLevel2 = false; 
    startLevel3 = false; 
    startLevel4 = false; 
    startLevel5 = false;
    enemyList.clear();
    wallList.clear();
  }
} 

void gameCompleteScreen() {
  fill(150);
  strokeWeight(20);
  stroke(50);
  rect(width/2, height/2, width/2, height/2);
  noStroke();
  fill(0);
  textSize(50);
  text("GAME COMPLETE", width/2, height/2);
  text("TOTAL TIME: " + highscoreTimer, width/2, height/2-50);

  gameOverButton = new Button(width/2, height/2+120, 450, 90, color(255, 0, 0), "BACK TO MENU", 30);
  if (gameOverButton.isClicked()) {
    start = true;

    if (playMultiPlayer) {
      createMultiplayer();
      insertMultiplayerScore();
    } else {
      createSingleplayer();
      insertSingleplayerScore();
    }



    playSinglePlayer= false; 
    playMultiPlayer = false; 
    level1IsRunning = false; 
    level2IsRunning = false; 
    level3IsRunning = false; 
    level4IsRunning = false; 
    level5IsRunning = false;
    wave1 = false; 
    wave2 = false; 
    wave3 = false; 
    wave4 = false;
    gameComplete = false;
    startLevel1 = false; 
    startLevel2 = false; 
    startLevel3 = false; 
    startLevel4 = false; 
    startLevel5 = false;
    enemyList.clear();
    wallList.clear();
  }
}

void drawHighscoreScreen() {
  fill(0);
  textSize(30);
  text("PLACING", width * 1/6, 200);
  rect(width * 1/6 + 85, height/2, 2, height);


  text("TOP SINGLEPLAYERS", width * 2/6, 200);
  text("TIME", width * 3/6, 200);
  rect(width * 3/6 + 80, height/2, 2, height);


  text("TOP MULTIPLAYERS", width * 4/6, 200);
  text("TIME", width * 5/6, 200);

  rect(width/2, 250, width, 2);
  int y1 = 300;
  int y2 = 300;
  int y3 = 300;
  int y4 = 300;

  int placing = 1;
  for (String line : topSingleplayers) {
    text("# " + placing, width * 1/6, y1);
    text(line, width * 2/6, y1);
    y1 += 40;
    placing++;
  }
  for (String line : topSingleplayerScores) {
    text(line, width * 3/6, y2);
    y2 += 40;
  }

  for (String line : topMultiplayers) {
    text(line, width * 4/6, y3);
    y3 += 40;
  }
  for (String line : topMultiplayerScores) {
    text(line, width * 5/6, y4);
    y4 += 40;
  }

  backButton = new Button(150, 100, 200, 100, color(125), "BACK", 30);
  if (backButton.isClicked()) {
    start = true;
    highScoreScreen = false;

    topSingleplayers.clear();
    topSingleplayerScores.clear();
    topMultiplayers.clear();
    topMultiplayerScores.clear();
  }
}

//string variable til navn på spiller(ne)
String singleplayerName;
String multiplayerName;

//kontroller tekstfelt
void controlEvent(ControlEvent theEvent) {
  if (theEvent.isAssignableFrom(Textfield.class)) {

    //singleplayer
    if (theEvent.getName() == "create player") {
      singleplayerName = theEvent.getStringValue();
      playSinglePlayer = true;
      singlePlayerLoginScreen = false;
      singleplayerText.setVisible(false);
      //createSingleplayer();
      startLevel1 = true;
      highscoreTimer = 0;
      highscoreTimerCounter = 0;
    }

    //multiplayer
    if (theEvent.getName() == "create team") {
      multiplayerName = theEvent.getStringValue();
      playSinglePlayer = true;
      playMultiPlayer = true;
      multiplayerLoginScreen = false;
      multiplayerText.setVisible(false);
      //createMultiplayer();
      startLevel1 = true;
      highscoreTimer = 0;
      highscoreTimerCounter = 0;
    }
  }
}
