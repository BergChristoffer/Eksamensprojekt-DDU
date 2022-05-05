abstract class Gun {
  float x, y, angle;
  int coolDown = 0;

  abstract void display();

  abstract void pullTrigger();

  void releaseTrigger() {
  }
}

class Pistol extends Gun {
  boolean triggerReleased = true;
  PImage pistol = loadImage("pistol.png");

  void display() {
    fill(0);
    pistol.resize(200, 200);
    image(pistol, x+20, y+40);
  }
  void pullTrigger() {
    if (triggerReleased) {
      bulletList.add(new PistolBullet(x, y, angle));
      triggerReleased = false;
    }
  }

  void releaseTrigger() {
    triggerReleased = true;
  }
}

class Rifle extends Gun {
  boolean triggerReleased = true;
  PImage rifle = loadImage("rifle.png");

  void display() {
    fill(0);
    rifle.resize(200, 300);
    image(rifle, x+40, y+40);
  }
  void pullTrigger() {
    if (triggerReleased) {
      bulletList.add(new RifleBullet(x, y, angle));
      triggerReleased = false;
    }
  }
  void releaseTrigger() {
    triggerReleased = true;
  }
}

class MachineGun extends Gun {
  PImage machineGun = loadImage("machinegun.png");

  void display() {
    fill(0);
    machineGun.resize(300, 300);
    image(machineGun, x+60, y+40);
  }
  void pullTrigger() {
    bulletList.add(new MachineGunBullet(x, y, angle));
  }
}

class EnemyPistol extends Gun {
  boolean triggerReleased = true;
  PImage pistol = loadImage("pistol.png");

  void display() {
    fill(0);
    pistol.resize(200, 200);
    image(pistol, x+20, y+40);
  }
  void pullTrigger() {
    if (triggerReleased) {
      enemyBulletList.add(new PistolBullet(x, y, angle));
      triggerReleased = false;
    }
  }

  void releaseTrigger() {
    triggerReleased = true;
  }
}



class EnemyRifle extends Gun {
  boolean triggerReleased = true;
  PImage rifle = loadImage("rifle.png");

  void display() {
    fill(0);
    rifle.resize(200, 300);
    image(rifle, x+40, y+40);
  }
  void pullTrigger() {
    if (triggerReleased) {
      enemyBulletList.add(new RifleBullet(x, y, angle));
      triggerReleased = false;
    }
  }
  void releaseTrigger() {
    triggerReleased = true;
  }
}

class EnemyMachineGun extends Gun {
  boolean triggerReleased = true;
  PImage machineGun = loadImage("machinegun.png");

  void display() {
    fill(0);
    machineGun.resize(300, 300);
    image(machineGun, x+60, y+40);
  }
  void pullTrigger() {
    if (triggerReleased) {
      enemyBulletList.add(new MachineGunBullet(x, y, angle));
      triggerReleased = false;
    }
  }
  void releaseTrigger() {
    triggerReleased = true;
  }
}
