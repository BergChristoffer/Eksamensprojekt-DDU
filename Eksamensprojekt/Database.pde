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

      if (multiplayerName != "") {
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

void insertScore() {
  db = new SQLite( this, "database.sqlite" );
  // Connect to database
  if ( db.connect() )
  {
    try {
      if (playMultiPlayer == false) {
        db.query( "SELECT ID_singleplayer FROM singleplayer WHERE name = '" + singleplayerName + "'" );
        sql = "UPDATE singleplayer SET score = " + highscoreTimer + " WHERE ID_singeplayer = " + db.getInt("ID_singleplayer");
      }

      if (playMultiPlayer) {
        db.query( "SELECT ID_multiplayer FROM multiplayer WHERE name = '" + multiplayerName + "'" );
        sql = "UPDATE multiplayer SET score = " + highscoreTimer + " WHERE ID_multiplayer = " + db.getInt("ID_multiplayer");
      }

      db.execute(sql);

      //luk database
      db.close();
    }
    catch (Exception e) {
      System.out.println("Exception: "+e);
    }
  }
}

ArrayList<String> topSingleplayers = new ArrayList<String>();
ArrayList<String> topSingleplayerScores = new ArrayList<String>();
ArrayList<String> multiplayers = new ArrayList<String>();
ArrayList<String> multiplayerScores = new ArrayList<String>();
void getSingeplayerResults() {
  db = new SQLite( this, "database.sqlite" );
  // Connect to database
  if ( db.connect() )
  {
    try {
      db.query("select name, score from (select name, score from singleplayer order by score asc) limit 10");
      while (db.next()) {
        topSingleplayers.add(db.getString("name"));
        topSingleplayerScores.add(db.getString("score"));
      }

      //luk database
      db.close();
    }
    catch (Exception e) {
      System.out.println("Exception: "+e);
    }
  }
}
void getMultiplayerResults() {
  db = new SQLite( this, "database.sqlite" );
  // Connect to database
  if ( db.connect() )
  {
    try {
      db.query("select name, score from (select name, score from multiplayer order by score asc) limit 10");
      while (db.next()) {
        topSingleplayers.add(db.getString("name"));
        topSingleplayerScores.add(db.getString("score"));
      }

      //luk database
      db.close();
    }
    catch (Exception e) {
      System.out.println("Exception: "+e);
    }
  }
} 
