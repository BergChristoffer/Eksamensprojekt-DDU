//metode til startskærm
void drawStartScreen() {
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
  singleplayerText = cp5.addTextfield("create player").setPosition(300, 200).setSize(200, 40).setFont(createFont("arial", 20)).setColorCaptionLabel(color(0));
}
void drawSinglePlayerLoginButtons() {
  playButton = new Button(400, 300, 200, 40, color(125), "PLAY", 25);
  if (playButton.isClicked()) {
    singleplayerName = cp5.get(Textfield.class, "create player").getText();
    playSinglePlayer = true;
    singlePlayerLoginScreen = false;
    singleplayerText.setVisible(false);
    createSingleplayer();
  }
  backButton = new Button(100, 100, 100, 100, color(255, 0, 255), "BACK", 30);
  if (backButton.isClicked()) {
    start = true;
    singlePlayerLoginScreen = false;
    singleplayerText.setVisible(false);
  }
}

//multiplayerLoginScreen metoder
Textfield multiplayerText;
void drawMultiplayerLoginTextBox() {
  multiplayerText = cp5.addTextfield("create team").setPosition(300, 200).setSize(200, 40).setFont(createFont("arial", 20)).setColorCaptionLabel(color(0));
}
void drawMultiplayerLoginButtons() {
  playButton = new Button(400, 300, 200, 40, color(125), "PLAY", 25);
  if (playButton.isClicked()) {
    multiplayerName = cp5.get(Textfield.class, "create team").getText();
    playSinglePlayer = true;
    playMultiPlayer = true;
    multiplayerLoginScreen = false;
    multiplayerText.setVisible(false);
    createMultiplayer();
  }
  backButton = new Button(100, 100, 100, 100, color(255, 0, 255), "BACK", 30);
  if (backButton.isClicked()) {
    start = true;
    multiplayerLoginScreen = false;
    multiplayerText.setVisible(false);
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
      createSingleplayer();
    }

    //multiplayer
    if (theEvent.getName() == "create team") {
      multiplayerName = theEvent.getStringValue();
      playSinglePlayer = true;
      playMultiPlayer = true;
      multiplayerLoginScreen = false;
      multiplayerText.setVisible(false);
      createMultiplayer();
    }
  }
}

String sql;
void createSingleplayer() {
  db = new SQLite( this, "database.sqlite" );
  // Connect to database
  if ( db.connect() )
  {
    try {

      if (singleplayerName != "") {
        // Insert username & hashed password into database
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

void createMultiplayer() {
  db = new SQLite( this, "database.sqlite" );
  // Connect to database
  if ( db.connect() )
  {
    try {

      if (singleplayerName != "") {
        // Insert username & hashed password into database
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
