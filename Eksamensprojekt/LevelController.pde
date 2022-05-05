
boolean startLevel1, startLevel2, startLevel3, startLevel4;
boolean level1IsRunning, level2IsRunning;
boolean wave1, wave2, wave3, wave4;


void updateEnemyShooting() {
  for (int i = 0; i < enemyList.size(); i++) {
    if (enemyList.get(i).gunType == "Pistol") {
      if (enemyList.get(i).coolDown == 60) {
        enemyList.get(i).gun.pullTrigger();
        enemyList.get(i).gun.releaseTrigger();
        enemyList.get(i).coolDown = 0;
      } else
        enemyList.get(i).coolDown++;
    }
    if (enemyList.get(i).gunType == "Rifle") {
      if (enemyList.get(i).coolDown == 30) {
        enemyList.get(i).gun.pullTrigger();
        enemyList.get(i).gun.releaseTrigger();
        enemyList.get(i).coolDown = 0;
      } else
        enemyList.get(i).coolDown++;
    }
    if (enemyList.get(i).gunType == "MachineGun") {
      if (enemyList.get(i).player1target == true || enemyList.get(i).player2target == true) {
        enemyList.get(i).gun.pullTrigger();
      } else {    
        enemyList.get(i).gun.releaseTrigger();
      }
    }
  }
}





void spawnLevel1Enemies() {
  if (wave1) {
    for (int i = 0; i < 1; i++) {
      enemyList.add(new Enemy(new PVector(random(width), random(height)), "MachineGun"));
    }
  }

  if (wave2) {
    for (int i = 0; i < 2; i++) {
      //enemyList.add(new Enemy(new PVector(random(width), random(height)), new Pistol()));
    }
  }
}


void createLevel1() { 
  wallList.add(new Wall(random(width), random(height), random(30, 80), color(150)));
  wallList.add(new Wall(random(width), random(height), random(30, 80), color(150)));
  wallList.add(new Wall(random(width), random(height), random(30, 80), color(150)));
  wallList.add(new Wall(random(width), random(height), random(30, 80), color(150)));
  wallList.add(new Wall(random(width), random(height), random(30, 80), color(150)));
  wallList.add(new Wall(random(width), random(height), random(30, 80), color(150)));
  wallList.add(new Wall(random(width), random(height), random(30, 80), color(150)));
  wallList.add(new Wall(random(width), random(height), random(30, 80), color(150)));
  wallList.add(new Wall(random(width), random(height), random(30, 80), color(150)));
  wallList.add(new Wall(random(width), random(height), random(30, 80), color(150)));
  wallList.add(new Wall(random(width), random(height), random(30, 80), color(150)));
  wallList.add(new Wall(random(width), random(height), random(30, 80), color(150)));
  wallList.add(new Wall(random(width), random(height), random(30, 80), color(150)));
  wallList.add(new Wall(random(width), random(height), random(30, 80), color(150)));
  wallList.add(new Wall(random(width), random(height), random(30, 80), color(150)));
  wallList.add(new Wall(random(width), random(height), random(30, 80), color(150)));
  wallList.add(new Wall(random(width), random(height), random(30, 80), color(150)));
  wallList.add(new Wall(random(width), random(height), random(30, 80), color(150)));
}

void createLevel2() {
  for (int i = 0; i < 5; i++) {
    //enemyList.add(new Enemy(new PVector(random(width), random(height)), new Pistol()));
  }
  wallList.add(new Wall(random(width), random(height), random(30, 80), color(150)));
  wallList.add(new Wall(random(width), random(height), random(30, 80), color(150)));
  wallList.add(new Wall(random(width), random(height), random(30, 80), color(150)));
  wallList.add(new Wall(random(width), random(height), random(30, 80), color(150)));
  wallList.add(new Wall(random(width), random(height), random(30, 80), color(150)));
  wallList.add(new Wall(random(width), random(height), random(30, 80), color(150)));
  wallList.add(new Wall(random(width), random(height), random(30, 80), color(150)));
  wallList.add(new Wall(random(width), random(height), random(30, 80), color(150)));
  wallList.add(new Wall(random(width), random(height), random(30, 80), color(150)));
  wallList.add(new Wall(random(width), random(height), random(30, 80), color(150)));
  wallList.add(new Wall(random(width), random(height), random(30, 80), color(150)));
  wallList.add(new Wall(random(width), random(height), random(30, 80), color(150)));
  wallList.add(new Wall(random(width), random(height), random(30, 80), color(150)));
  wallList.add(new Wall(random(width), random(height), random(30, 80), color(150)));
  wallList.add(new Wall(random(width), random(height), random(30, 80), color(150)));
  wallList.add(new Wall(random(width), random(height), random(30, 80), color(150)));
  wallList.add(new Wall(random(width), random(height), random(30, 80), color(150)));
  wallList.add(new Wall(random(width), random(height), random(30, 80), color(150)));
}
