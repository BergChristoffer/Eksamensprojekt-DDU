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
  Pistol() {
    pistol.resize(200, 200);
  }
  void display() {
    fill(0);
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

  Rifle() {
    rifle.resize(200, 300);
  }

  void display() {
    fill(0);
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

  MachineGun() {
    machineGun.resize(300, 300);
  }

  void display() {
    fill(0);
    image(machineGun, x+60, y+40);
  }
  void pullTrigger() {
    bulletList.add(new MachineGunBullet(x, y, angle));
  }
}

class EnemyPistol extends Gun {
  boolean triggerReleased = true;
  PImage pistol = loadImage("pistol.png");
  EnemyPistol() {
    pistol.resize(200, 200);
  }

  void display() {
    fill(0);
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
  EnemyRifle() {
    rifle.resize(200, 300);
  }

  void display() {
    fill(0);
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

  EnemyMachineGun() {
    machineGun.resize(300, 300);
  }

  void display() {
    fill(0);
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
