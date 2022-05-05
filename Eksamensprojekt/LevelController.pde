
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
    enemyList.add(new Enemy(new PVector(width/2, 100), "MachineGun"));
    enemyList.add(new Enemy(new PVector(200, height/2), "MachineGun"));
    enemyList.add(new Enemy(new PVector(width-200, height/2), "MachineGun"));
  }

  if (wave2) {
    enemyList.add(new Enemy(new PVector(width/2, 100), "MachineGun"));
    enemyList.add(new Enemy(new PVector(200, height/2), "MachineGun"));
    enemyList.add(new Enemy(new PVector(width-200, height/2), "MachineGun"));
    enemyList.add(new Enemy(new PVector(200,100), "MachineGun"));
    enemyList.add(new Enemy(new PVector(width-200,100), "MachineGun"));
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
