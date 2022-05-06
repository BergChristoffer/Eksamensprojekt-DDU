ArrayList<Bullet> bulletList = new ArrayList<Bullet>(); //<>// //<>// //<>// //<>// //<>//
ArrayList<Bullet> enemyBulletList = new ArrayList<Bullet>(); //<>//

void updateBullets() {
  for (int i = 0; i < bulletList.size(); i++) {
    bulletList.get(i).update();
    bulletList.get(i).wallcolide();
    bulletList.get(i).enemyColide();

    if (bulletList.get(i).wallhit) {
      bulletList.remove(i);
      //println("fjerner bullet");
    }
  }
  for (int i = 0; i < enemyBulletList.size(); i++) {
    enemyBulletList.get(i).update();
    enemyBulletList.get(i).wallcolide();
    enemyBulletList.get(i).playerColide();

    if (enemyBulletList.get(i).wallhit) {
      enemyBulletList.remove(i);
    }
  }
}








void updateEnemy() {
  for (int i = 0; i < enemyList.size(); i++) {
    if (enemyList.get(i).health <= 0) {
      money += 10;
      totalMoney += 10;
      enemyList.remove(i);
    }
  }
}



class Bullet {
  PVector velocity, position;
  boolean bulletPlayerInAir, wallhit;
  float diameter, angle; 
  int damage;

  Bullet(float x, float y, float angle, float gunOffset1, float gunOffset2) {
    position = new PVector(x, y);
    this.angle = angle;
    velocity = new PVector();
    position.x=position.x+gunOffset1*cos(angle+90)+gunOffset2*cos(angle);
    position.y=position.y+gunOffset1*sin(angle+90)+gunOffset2*sin(angle);
    velocity.x=cos(angle);
    velocity.y=sin(angle);
    wallhit = false;
  }

  void update() {
    if (wallhit == false) {
      fill(0);
      circle(position.x, position.y, diameter);
      position.add(velocity);
    }
  }

  void wallcolide() {
    for (int i = 0; i<wallList.size(); i++) {
      if (dist(position.x, position.y, wallList.get(i).x, wallList.get(i).y)<wallList.get(i).radius || position.x < 0 || position.x > width || position.y < 0 || position.y > height) {
        wallhit=true;
      }
    }
  }
  void enemyColide() {
    for (int i = 0; i < enemyList.size(); i++) {
      if (dist(position.x, position.y, enemyList.get(i).position.x, enemyList.get(i).position.y) < enemyList.get(i).size/2) {
        wallhit = true;
        enemyList.get(i).hit = true;      
      }
    }
  }
  void playerColide() {
    if (dist(position.x, position.y, player1.position.x, player1.position.y) < player1.size/2) {
      wallhit = true;
      player1.hit = true;
    }
    if (dist(position.x, position.y, player2.position.x, player2.position.y) < player2.size/2) {
      wallhit = true;
      player2.hit = true;
    }
  }
}

class PistolBullet extends Bullet {
  PistolBullet(float x, float y, float angle) {
    super(x, y, angle, 44, 80);
    diameter = 10;
    velocity.mult(5);
    damage = 10;
  }
}

class RifleBullet extends Bullet {
  RifleBullet(float x, float y, float angle) {
    super(x, y, angle, 44, 150);
    diameter = 15;
    velocity.mult(20);
  }
}

class MachineGunBullet extends Bullet {
  MachineGunBullet(float x, float y, float angle) {
    super(x, y, angle, 44, 150);
    diameter = 10;
    velocity.mult(10);
  }
}
class EnemyPistolBullet extends Bullet {
  EnemyPistolBullet(float x, float y, float angle) {
    super(x, y, angle, 0, 80);
    diameter = 10;
    velocity.mult(5);
  }
}

class EnemyRifleBullet extends Bullet {
  EnemyRifleBullet(float x, float y, float angle) {
    super(x, y, angle, 0, 150);
    diameter = 15;
    velocity.mult(20);
  }
}

class EnemyMachineGunBullet extends Bullet {
  EnemyMachineGunBullet(float x, float y, float angle) {
    super(x, y, angle, 0, 150);
    diameter = 10;
    velocity.mult(10);
  }
}
