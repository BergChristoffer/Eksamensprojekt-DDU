ArrayList<Bullet> bulletList = new ArrayList<Bullet>(); //<>//

void updateBullets() {
  for (int i = 0; i < bulletList.size(); i++) {
    bulletList.get(i).update();
    bulletList.get(i).wallcolide();
    bulletList.get(i).enemyColide();

    if (bulletList.get(i).wallhit) {
      bulletList.remove(i);
      println("fjerner bullet");
    }
  }
}

class Bullet {
  PVector velocity, position;
  boolean bulletPlayerInAir, wallhit;
  float diameter, angle; 

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
    //wallcollision
    if (wallhit == false) {
      fill(0);
      circle(position.x, position.y, diameter);
      position.add(velocity);
    }
  }

  void wallcolide() {
    for (int i = 0; i<wall.length; i++) {
      if (dist(position.x, position.y, wall[i].x, wall[i].y)<wall[i].radius) {
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
}

class PistolBullet extends Bullet {
  PistolBullet(float x, float y, float angle) {
    super(x, y, angle, 44, 80);
    diameter = 10;
    velocity.mult(5);
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
    velocity.mult(15);
  }
}
