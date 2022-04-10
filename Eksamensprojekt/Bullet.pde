ArrayList<Bullet> bulletList = new ArrayList<Bullet>(); //<>//

void updateBullets(){
  for (int i = 0; i < bulletList.size(); i++) {
      bulletList.get(i).update();
    }
}

class Bullet {
  PVector velocity, position;
  boolean bulletPlayerInAir;
  float diameter, angle; 

  Bullet(float x, float y, float angle, float gunOffset1, float gunOffset2) {
    position = new PVector(x, y);
    this.angle = angle;
    velocity = new PVector();
    position.x=position.x+gunOffset1*cos(angle+90)+gunOffset2*cos(angle);
    position.y=position.y+gunOffset1*sin(angle+90)+gunOffset2*sin(angle);
    velocity.x=cos(angle);
    velocity.y=sin(angle);
  } //<>//

  void update() {
    fill(0);
    circle(position.x, position.y, diameter);
    position.add(velocity);
  }
}

class PistolBullet extends Bullet {
  PistolBullet(float x, float y, float angle) {
    super(x, y, angle, 44, 20);
    diameter = 10;
    velocity.mult(10);
  }
}

class RifleBullet extends Bullet {
  RifleBullet(float x, float y, float angle) {
    super(x, y, angle, 44, 80);
    diameter = 15;
    velocity.mult(20);
  }
}

class MachineGunBullet extends Bullet {
  MachineGunBullet(float x, float y, float angle) {
    super(x, y, angle, 44, 80);
    diameter = 20;
    velocity.mult(30);
  }
}
