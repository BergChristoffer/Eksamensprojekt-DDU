//metode til startskærm
void drawStartScreen() {
  background(50);
  singlePlayerButton = new Button(width * 1/4, height/2-100, width/2, height-200, color(255, 0, 0), "SINGLEPLAYER", 50);
  if (singlePlayerButton.isClicked()) {
    start = false;
    singlePlayerLoginScreen = true;
  }
  multiPlayerButton = new Button(width * 3/4, height/2-100, width/2, height-200, color(0, 0, 255), "MULTIPLAYER", 50);
  if (multiPlayerButton.isClicked()) {
    start = false;
    multiplayerLoginScreen = true;
  }
  highScorePageButton = new Button(width/2, height-100, width, 200, color(125), "HIGHSCORES", 50);
  if (highScorePageButton.isClicked())
    println("highscores");
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
  }
  backButton = new Button(150, 100, 200, 100, color(125), "BACK", 30);
  if (backButton.isClicked()) {
    start = true;
    multiplayerLoginScreen = false;
    multiplayerText.setVisible(false);
  }
}

void openShopP1() {
  fill(50);
  rect(width/4, height/2, width/2-60, height-60);
  fill(255);
  rect(width/4,190,width/2-90,280);
  image(red,width/4,190);
  int rifleCost = 10;
  int machineGunCost = 10;
  buyRifleButtonP1 = new Button(width/4, 400, width/2-90, 90, color(255, 0, 0), "BUY RIFLE : 50$", 30);
  if (buyRifleButtonP1.isClicked()) {
    if (money >= 10) {
      player1 = new Player(player1.position.x, player1.position.y, "Rifle", color(255, 0, 0));
      money -= rifleCost;
    }
  }
  buyMachineGunButtonP1 = new Button(width/4, 500, width/2-90, 90, color(255, 0, 0), "BUY MACHINEGUN : 100$", 30);
  if (buyMachineGunButtonP1.isClicked()) {
    if (money >= 10) {
      player1 = new Player(player1.position.x, player1.position.y, "MachineGun", color(255, 0, 0));
      money -= machineGunCost;
    }
  }
  placeholderP1a = new Button(width/4, 600, width/2-90, 90, color(255, 0, 0), "BUY placeholder : xx$", 30);
  placeholderP1b = new Button(width/4, 700, width/2-90, 90, color(255, 0, 0), "BUY placeholder : xx$", 30);
  placeholderP1c = new Button(width/4, 800, width/2-90, 90, color(255, 0, 0), "BUY placeholder : xx$", 30);
}

void openShopP2() {
  fill(50);
  rect(width-width/4, height/2, width/2-60, height-60);
  fill(255);
  rect(width-width/4,190,width/2-90,280);
  image(blue, width-width/4, 190);
  int rifleCost = 10;
  int machineGunCost = 10;
  buyRifleButtonP2 = new Button(width-width/4, 400, width/2-90, 90, color(0, 0, 255), "BUY RIFLE : 50$", 30);
  if (buyRifleButtonP2.isClicked()) {
    if (money >= 10) {
      player2 = new Player(player2.position.x, player2.position.y, "Rifle", color(0, 0, 255));
      money -= rifleCost;
    }
  }
  buyMachineGunButtonP2 = new Button(width-width/4,500, width/2-90, 90, color(0, 0, 255), "BUY MACHINEGUN : 100$", 30);
  if (buyMachineGunButtonP2.isClicked()) {
    if (money >= 10) {
      player2 = new Player(player2.position.x, player2.position.y, "MachineGun", color(0, 0, 255));
      money -= machineGunCost;
    }
  }
  placeholderP2a = new Button(width-width/4, 600, width/2-90, 90, color(0, 0, 255), "BUY placeholder : xx$", 30);
  placeholderP2b = new Button(width-width/4, 700, width/2-90, 90, color(0, 0, 255), "BUY placeholder : xx$", 30);
  placeholderP2c = new Button(width-width/4, 800, width/2-90, 90, color(0, 0, 255), "BUY placeholder : xx$", 30);
}

void drawEndScreen() {
  rect(width/2, height/2, 100, 100);
  text("total score: " + totalMoney, width/2, height/2);
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
    }
  }
}

String sql;
//indsæt singleplayer navn i database
void createSingleplayer() {
  db = new SQLite( this, "database.sqlite" );
  // Connect to database
  if ( db.connect() )
  {
    try {

      if (singleplayerName != "") {
        // Insert username into database
        sql = "INSERT INTO singleplayer (name,score) VALUES ('" + singleplayerName + "', '" + 0 + "');";
        db.execute(sql);

        //singleplayerName = "";

        db.close();
      }
    }
    catch (Exception e) {
      System.out.println("Exception: "+e);
    }
  }
}

//indsæt multiplayer navn i database
void createMultiplayer() {
  db = new SQLite( this, "database.sqlite" );
  // Connect to database
  if ( db.connect() )
  {
    try {

      if (singleplayerName != "") {
        // Insert username into database
        sql = "INSERT INTO multiplayer (name,score) VALUES ('" + multiplayerName + "', '" + 0 + "');";
        db.execute(sql);

        //multiplayerName = "";

        db.close();
      }
    }
    catch (Exception e) {
      System.out.println("Exception: "+e);
    }
  }
}
