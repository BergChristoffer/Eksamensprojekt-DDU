
boolean startLevel1, startLevel2, startLevel3, startLevel4, startLevel5;
boolean level1IsRunning, level2IsRunning, level3IsRunning, level4IsRunning, level5IsRunning;
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
      if (enemyList.get(i).player1target == true && enemyList.get(i).coolDown >= 30 || enemyList.get(i).player2target == true && enemyList.get(i).coolDown >= 30 ) {
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
    enemyList.add(new Enemy(new PVector(width/2, 100), "EnemyPistol", 1, 80, 400, 1));
    enemyList.add(new Enemy(new PVector(200, height/2), "EnemyPistol", 30, 80, 400, 1));
    enemyList.add(new Enemy(new PVector(width-200, height/2), "EnemyRifle", 30, 80, 400, 1));
  }

  if (wave2) {
    enemyList.add(new Enemy(new PVector(width/2, 100), "EnemyPistol", 1, 80, 400, 1));
    enemyList.add(new Enemy(new PVector(200, height/2), "EnemyPistol", 30, 80, 400, 1));
    enemyList.add(new Enemy(new PVector(width-200, height/2), "EnemyPistol", 40, 80, 400, 1));
    enemyList.add(new Enemy(new PVector(200, 100), "EnemyMachineGun", 20, 80, 400, 1));
    enemyList.add(new Enemy(new PVector(width-200, 100), "EnemyRifle", 30, 80, 400, 1));
  }

  if (wave3) {
    enemyList.add(new Enemy(new PVector(width/2, 100), "EnemyMachineGun", 100, 120, 1000, 2));
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
    enemyList.add(new Enemy(new PVector(width-100, height-100), "EnemyPistol", 1, 80, 400, 1));
    enemyList.add(new Enemy(new PVector(width-100, height-100), "EnemyRifle", 40, 80, 400, 1));
    enemyList.add(new Enemy(new PVector(width/2, height/2), "EnemyMachineGun", 30, 80, 400, 1));
    enemyList.add(new Enemy(new PVector(450, height-100), "EnemyRifle", 100, 80, 400, 1));
  }
  if (wave2) {
    enemyList.add(new Enemy(new PVector(width-100, height-100), "EnemyPistol", 1, 80, 400, 1));
    enemyList.add(new Enemy(new PVector(width-100, height-100), "EnemyRifle", 100, 80, 400, 1));
    enemyList.add(new Enemy(new PVector(width/2, height/2-50), "EnemyMachineGun", 40, 80, 400, 1));
    enemyList.add(new Enemy(new PVector(width/2, height/2+50), "EnemyMachineGun", 40, 80, 400, 1));
    enemyList.add(new Enemy(new PVector(450, height-100), "EnemyRifle", 100, 80, 400, 1));
    enemyList.add(new Enemy(new PVector(width-300, 80), "EnemyPistol", 100, 80, 400, 1));
  }
}
void createLevel2() {
  wallList.add(new Wall(width/2+170, height/2, 80, color(150)));
  wallList.add(new Wall(width/2-170, height/2, 80, color(150)));
  wallList.add(new Wall(width/2, height/2+220, 80, color(150)));
  wallList.add(new Wall(width/2, height/2-220, 80, color(150)));
  wallList.add(new Wall(width/2+500, height/2, 150, color(150)));
  wallList.add(new Wall(width/2-500, height/2, 150, color(150)));
  wallList.add(new Wall(200, 180, 30, color(150)));
  wallList.add(new Wall(width-200, 200, 80, color(150)));
  wallList.add(new Wall(width-430, height-200, 20, color(150)));
  wallList.add(new Wall(300, height-100, 100, color(150)));
}

void spawnLevel3Enemies() {
  if (wave1) {
    enemyList.add(new Enemy(new PVector(100, height-100), "EnemyPistol", 3, 80, 1000, 1));
    enemyList.add(new Enemy(new PVector(400, height-100), "EnemyPistol", 3, 80, 1000, 1));
    enemyList.add(new Enemy(new PVector(500, height-300), "EnemyRifle", 3, 80, 1000, 1));
    enemyList.add(new Enemy(new PVector(width-100, height-100), "EnemyPistol", 3, 80, 1000, 1));
    enemyList.add(new Enemy(new PVector(width-400, height-100), "EnemyPistol", 3, 80, 1000, 1));
    enemyList.add(new Enemy(new PVector(width-500, height-300), "EnemyRifle", 3, 80, 1000, 1));
  }
  if (wave2) {
    enemyList.add(new Enemy(new PVector(width/2, height/2), "EnemyMachineGun", 3, 80, 1000, 1));
    enemyList.add(new Enemy(new PVector(width/2+20, height/2), "EnemyMachineGun", 3, 80, 1000, 1));
    enemyList.add(new Enemy(new PVector(width/2+40, height/2), "EnemyMachineGun", 3, 80, 1000, 1));
    enemyList.add(new Enemy(new PVector(width/2-20, height/2), "EnemyMachineGun", 3, 80, 1000, 1));
    enemyList.add(new Enemy(new PVector(width/2-40, height/2), "EnemyMachineGun", 3, 80, 1000, 1));
  }
  if (wave3) {
    enemyList.add(new Enemy(new PVector(width/2+100, height/2), "EnemyMachineGun", 300, 120, 1000, 2));
    enemyList.add(new Enemy(new PVector(width/2-100, height/2), "EnemyMachineGun", 300, 120, 1000, 2));
  }
}
void createLevel3() {
  wallList.add(new Wall(width/2, 0, 90, color(150)));
  wallList.add(new Wall(width/2, 150, 90, color(150)));
  wallList.add(new Wall(width/2, 300, 90, color(150)));
  wallList.add(new Wall(width/2, height, 90, color(150)));
  wallList.add(new Wall(width/2, height-150, 90, color(150)));
  wallList.add(new Wall(width/2, height-300, 90, color(150)));

  wallList.add(new Wall(300, 200, 100, color(150)));
  wallList.add(new Wall(300, height-200, 100, color(150)));
  wallList.add(new Wall(150, height/2, 60, color(150)));
  wallList.add(new Wall(width-300, 200, 100, color(150)));
  wallList.add(new Wall(width-300, height-200, 100, color(150)));
  wallList.add(new Wall(width-150, height/2, 60, color(150)));
}


void spawnLevel4Enemies() {
  if (wave1) {
    enemyList.add(new Enemy(new PVector(100, 330), "EnemyPistol", 3, 80, 1000, 1));
    enemyList.add(new Enemy(new PVector(400, 330), "EnemyPistol", 3, 80, 1000, 1));
    enemyList.add(new Enemy(new PVector(width-100, 330), "EnemyPistol", 3, 80, 1000, 1));
    enemyList.add(new Enemy(new PVector(width/2+30, 330), "EnemyPistol", 3, 80, 1000, 1));
  }
  if (wave2) {
    enemyList.add(new Enemy(new PVector(100, 580), "EnemyRifle", 3, 80, 1000, 1));
    enemyList.add(new Enemy(new PVector(400, 580), "EnemyPistol", 3, 80, 1000, 1));
    enemyList.add(new Enemy(new PVector(width-200, 580), "EnemyRifle", 3, 80, 1000, 1));
    enemyList.add(new Enemy(new PVector(width/2, 580), "EnemyPistol", 3, 80, 1000, 1));
  }
  if (wave3) {
    enemyList.add(new Enemy(new PVector(100, height-120), "EnemyMachineGun", 3, 80, 1000, 1));
    enemyList.add(new Enemy(new PVector(300, height-120), "EnemyPistol", 3, 80, 1000, 1));
    enemyList.add(new Enemy(new PVector(500, height-120), "EnemyPistol", 3, 80, 1000, 1));
    enemyList.add(new Enemy(new PVector(800, height-120), "EnemyPistol", 3, 80, 1000, 1));
    enemyList.add(new Enemy(new PVector(900, height-120), "EnemyPistol", 3, 80, 1000, 1));
  }
  if (wave4) {
    enemyList.add(new Enemy(new PVector(100, 330), "EnemyMachineGun", 3, 80, 1000, 1));
    enemyList.add(new Enemy(new PVector(400, 330), "EnemyPistol", 3, 80, 1000, 1));
    enemyList.add(new Enemy(new PVector(width-100, 330), "EnemyRifle", 3, 80, 1000, 1));
    enemyList.add(new Enemy(new PVector(width/2+30, 330), "EnemyMachineGun", 3, 80, 1000, 1));
    enemyList.add(new Enemy(new PVector(width/2+30, height-100), "EnemyMachineGun", 400, 120, 1000, 2 ));
  }
}
void createLevel4() {
  wallList.add(new Wall(width/2, 200, 70, color(150)));
  wallList.add(new Wall(width/2-140, 200, 70, color(150)));
  wallList.add(new Wall(width/2-140*2, 200, 70, color(150)));
  wallList.add(new Wall(width/2-140*4, 200, 70, color(150)));
  wallList.add(new Wall(width/2-140*5, 200, 70, color(150)));
  wallList.add(new Wall(width/2+140*2, 200, 70, color(150)));
  wallList.add(new Wall(width/2+140*3, 200, 70, color(150)));
  wallList.add(new Wall(width/2+140*4, 200, 70, color(150)));
  wallList.add(new Wall(width/2+140*5, 200, 70, color(150)));
  wallList.add(new Wall(width/2, 70, 70, color(150)));

  //wave1
  wallList.add(new Wall(width/2, 450, 40, color(150)));
  wallList.add(new Wall(width/2-80, 450, 40, color(150)));
  wallList.add(new Wall(width/2-80*2, 450, 40, color(150)));
  wallList.add(new Wall(width/2-80*3, 450, 40, color(150)));
  wallList.add(new Wall(width/2-80*4, 450, 40, color(150)));
  wallList.add(new Wall(width/2-80*5, 450, 40, color(150)));

  wallList.add(new Wall(width/2-80*8, 450, 40, color(150)));
  wallList.add(new Wall(width/2-80*9, 450, 40, color(150)));
  wallList.add(new Wall(width/2+80, 450, 40, color(150)));
  wallList.add(new Wall(width/2+80*5, 450, 40, color(150)));
  wallList.add(new Wall(width/2+80*6, 450, 40, color(150)));
  wallList.add(new Wall(width/2+80*7, 450, 40, color(150)));
  if (wave1) {
    wallList.add(new Wall(width/2-80*6, 450, 40, color(255, 100, 100)));
    wallList.add(new Wall(width/2-80*7, 450, 40, color(255, 100, 100)));
    wallList.add(new Wall(width/2+80*2, 450, 40, color(255, 100, 100)));
    wallList.add(new Wall(width/2+80*3, 450, 40, color(255, 100, 100)));
    wallList.add(new Wall(width/2+80*4, 450, 40, color(255, 100, 100)));
    wallList.add(new Wall(width/2+80*8, 450, 40, color(255, 100, 100)));
    wallList.add(new Wall(width/2+80*9, 450, 40, color(255, 100, 100)));
  }

  //wave2
  wallList.add(new Wall(width/2, 700, 40, color(150)));
  wallList.add(new Wall(width/2-80, 700, 40, color(150)));
  wallList.add(new Wall(width/2-80*5, 700, 40, color(150)));
  wallList.add(new Wall(width/2-80*6, 700, 40, color(150)));
  wallList.add(new Wall(width/2-80*7, 700, 40, color(150)));

  wallList.add(new Wall(width/2+80, 700, 40, color(150)));
  wallList.add(new Wall(width/2+80*2, 700, 40, color(150)));
  wallList.add(new Wall(width/2+80*3, 700, 40, color(150)));
  wallList.add(new Wall(width/2+80*6, 700, 40, color(150)));
  wallList.add(new Wall(width/2+80*7, 700, 40, color(150)));

  if (wave2||wave1) {
    wallList.add(new Wall(width/2-80*2, 700, 40, color(255, 100, 100)));
    wallList.add(new Wall(width/2-80*3, 700, 40, color(255, 100, 100)));
    wallList.add(new Wall(width/2-80*4, 700, 40, color(255, 100, 100)));
    wallList.add(new Wall(width/2-80*9, 700, 40, color(255, 100, 100)));
    wallList.add(new Wall(width/2-80*8, 700, 40, color(255, 100, 100)));
    wallList.add(new Wall(width/2+80*8, 700, 40, color(255, 100, 100)));
    wallList.add(new Wall(width/2+80*9, 700, 40, color(255, 100, 100)));
    wallList.add(new Wall(width/2+80*4, 700, 40, color(255, 100, 100)));
    wallList.add(new Wall(width/2+80*5, 700, 40, color(255, 100, 100)));
  }
}


void spawnLevel5Enemies() {
  if (wave1) {
    enemyList.add(new Enemy(new PVector(100, 330), "EnemyPistol", 3, 80, 1000, 1));
  }
  if (wave2) {
    enemyList.add(new Enemy(new PVector(100, 330), "EnemyPistol", 3, 80, 1000, 1));
  }
  if (wave3) {
    enemyList.add(new Enemy(new PVector(width/2, height/2), "EnemyMachineGun", 200, 240, 1000, 3));
    enemyList.add(new Enemy(new PVector(100, 330), "EnemyPistol", 3, 80, 1000, 1));
  }
}
void createLevel5() {
  wallList.add(new Wall(width/2, 150, 40, color(150)));
  wallList.add(new Wall(width/2+80, 150, 40, color(150)));
  wallList.add(new Wall(width/2+80*2, 150, 40, color(150)));
  wallList.add(new Wall(width/2+80*3, 150, 40, color(150)));
  wallList.add(new Wall(width/2+80*4, 150, 40, color(150)));
  wallList.add(new Wall(width/2-80, 150, 40, color(150)));
  wallList.add(new Wall(width/2-80*2, 150, 40, color(150)));
  wallList.add(new Wall(width/2-80*3, 150, 40, color(150)));
  wallList.add(new Wall(width/2-80*4, 150, 40, color(150)));
  wallList.add(new Wall(width/2-80*5, 150, 40, color(150)));
  wallList.add(new Wall(width/2-80*6, 150, 40, color(150)));
  wallList.add(new Wall(width/2-80*7, 150, 40, color(150)));
  wallList.add(new Wall(width/2-80*7, 150+80, 40, color(150)));
  wallList.add(new Wall(width/2-80*7, 150+80*2, 40, color(150)));
  wallList.add(new Wall(width/2-80*7, 150+80*3, 40, color(150)));
  wallList.add(new Wall(width/2-80*7, 150+80*6, 40, color(150)));
  wallList.add(new Wall(width/2-80*7, 150+80*7, 40, color(150)));
  wallList.add(new Wall(width/2-80*7, 150+80*8, 40, color(150)));
  wallList.add(new Wall(width/2-80*7, 150+80*9, 40, color(150)));
  wallList.add(new Wall(width/2-320, 360, 70, color(150)));

  wallList.add(new Wall(width/2, height-150, 40, color(150)));
  wallList.add(new Wall(width/2-80, height-150, 40, color(150)));
  wallList.add(new Wall(width/2-80*2, height-150, 40, color(150)));
  wallList.add(new Wall(width/2-80*3, height-150, 40, color(150)));
  wallList.add(new Wall(width/2-80*4, height-150, 40, color(150)));
  wallList.add(new Wall(width/2+80, height-150, 40, color(150)));
  wallList.add(new Wall(width/2+80*2, height-150, 40, color(150)));
  wallList.add(new Wall(width/2+80*3, height-150, 40, color(150)));
  wallList.add(new Wall(width/2+80*4, height-150, 40, color(150)));
  wallList.add(new Wall(width/2+80*5, height-150, 40, color(150)));
  wallList.add(new Wall(width/2+80*6, height-150, 40, color(150)));
  wallList.add(new Wall(width/2+80*7, height-150, 40, color(150)));
  wallList.add(new Wall(width/2+80*7, height-150-80, 40, color(150)));
  wallList.add(new Wall(width/2+80*7, height-150-80*2, 40, color(150)));
  wallList.add(new Wall(width/2+80*7, height-150-80*3, 40, color(150)));
  wallList.add(new Wall(width/2+80*7, height-150-80*6, 40, color(150)));
  wallList.add(new Wall(width/2+80*7, height-150-80*7, 40, color(150)));
  wallList.add(new Wall(width/2+80*7, height-150-80*8, 40, color(150)));
  wallList.add(new Wall(width/2+80*7, height-150-80*9, 40, color(150)));
  wallList.add(new Wall(width/2+320, height-360, 70, color(150)));

  if (wave1||wave2) {
    wallList.add(new Wall(width/2, height/2, 120, color(255, 100, 100)));
  }
}
