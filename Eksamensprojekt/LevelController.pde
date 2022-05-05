
boolean startLevel1, startLevel2, startLevel3, startLevel4;
boolean level1IsRunning, level2IsRunning;
boolean wave1, wave2, wave3, wave4;


void updateEnemyShooting() {
  for (int i = 0; i < enemyList.size(); i++) {
    if (enemyList.get(i).gunType == "EnemyPistol") {
      if (enemyList.get(i).player1target == true && enemyList.get(i).coolDown >= 60 || enemyList.get(i).player2target == true && enemyList.get(i).coolDown >= 60 ) {
        enemyList.get(i).gun.pullTrigger();
        enemyList.get(i).gun.releaseTrigger();
        enemyList.get(i).coolDown = 0;
      } else
        enemyList.get(i).coolDown++;
    }

    if (enemyList.get(i).gunType == "EnemyRifle") {
      if (enemyList.get(i).player1target == true && enemyList.get(i).coolDown >= 60 || enemyList.get(i).player2target == true && enemyList.get(i).coolDown >= 30 ) {
        enemyList.get(i).gun.pullTrigger();
        enemyList.get(i).gun.releaseTrigger();
        enemyList.get(i).coolDown = 0;
      } else
        enemyList.get(i).coolDown++;
    }
    if (enemyList.get(i).gunType == "EnemyMachineGun") {
      if (enemyList.get(i).player1target == true && enemyList.get(i).coolDown >= 10 || enemyList.get(i).player2target == true && enemyList.get(i).coolDown >= 10 ) {
        enemyList.get(i).gun.pullTrigger();
        enemyList.get(i).gun.releaseTrigger();
        enemyList.get(i).coolDown = 0;
      } else {   
        enemyList.get(i).coolDown++;
      }
    }
  }
}
//level1
void spawnLevel1Enemies() {
  if (wave1) {
    //enemyList.add(new Enemy(new PVector(width/2, 100), "MachineGun", 20));
    //enemyList.add(new Enemy(new PVector(200, height/2), "Pistol", 20));
    //enemyList.add(new Enemy(new PVector(width-200, height/2), "Rifle", 20));
  }

  if (wave2) {
    //enemyList.add(new Enemy(new PVector(width/2, 100), "MachineGun", 1));
    //enemyList.add(new Enemy(new PVector(200, height/2), "MachineGun", 100));
    //enemyList.add(new Enemy(new PVector(width-200, height/2), "MachineGun", 100));
    //enemyList.add(new Enemy(new PVector(200, 100), "MachineGun", 100));
    //enemyList.add(new Enemy(new PVector(width-200, 100), "MachineGun", 100));
  }
}
void createLevel1() { 
  wallList.add(new Wall(0, 250, 50, color(150)));
  wallList.add(new Wall(100, 200, 50, color(150)));
  wallList.add(new Wall(200, 250, 50, color(150)));
  wallList.add(new Wall(300, 200, 50, color(150)));
  wallList.add(new Wall(400, 200, 50, color(150)));
  wallList.add(new Wall(width, 250, 50, color(150)));
  wallList.add(new Wall(width-100, 200, 50, color(150)));
  wallList.add(new Wall(width-200, 250, 50, color(150)));
  wallList.add(new Wall(width-300, 200, 50, color(150)));
  wallList.add(new Wall(width-400, 200, 50, color(150)));

  wallList.add(new Wall(0, height-250, 50, color(150)));
  wallList.add(new Wall(100, height-200, 50, color(150)));
  wallList.add(new Wall(200, height-250, 50, color(150)));
  wallList.add(new Wall(300, height-200, 50, color(150)));
  wallList.add(new Wall(400, height-200, 50, color(150)));
  wallList.add(new Wall(width, height-250, 50, color(150)));
  wallList.add(new Wall(width-100, height-200, 50, color(150)));
  wallList.add(new Wall(width-200, height-250, 50, color(150)));
  wallList.add(new Wall(width-300, height-200, 50, color(150)));
  wallList.add(new Wall(width-400, height-200, 50, color(150)));

  wallList.add(new Wall(width/2, height/2, 180, color(150)));
  wallList.add(new Wall(width/2-250, height/2, 80, color(150)));
  wallList.add(new Wall(width/2+250, height/2, 80, color(150)));
  wallList.add(new Wall(width/2, height-50, 120, color(150)));
}


//level2
void spawnLevel2Enemies() {
  if (wave1) {
    enemyList.add(new Enemy(new PVector(width-100, height-100), "EnemyPistol", 255));
    enemyList.add(new Enemy(new PVector(width-100, height-100), "EnemyPistol", 100));
  }
  if (wave2) {
    enemyList.add(new Enemy(new PVector(100, 100), "EnemyPistol", 1000));
  }
}
void createLevel2() {
  wallList.add(new Wall(width/2+170, height/2, 80, color(150)));
  wallList.add(new Wall(width/2-170, height/2, 80, color(150)));
  wallList.add(new Wall(width/2, height/2+220, 80, color(150)));
  wallList.add(new Wall(width/2, height/2-220, 80, color(150)));
  wallList.add(new Wall(width/2+500, height/2, 150, color(150)));
  wallList.add(new Wall(width/2-500, height/2, 150, color(150)));
  wallList.add(new Wall(200, 200, 30, color(150)));
  wallList.add(new Wall(width-200, 200, 80, color(150)));
  wallList.add(new Wall(width-430, height-200, 20, color(150)));
  wallList.add(new Wall(300, height-100, 100, color(150)));
}
