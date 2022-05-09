abstract class Gun {
  float x, y, angle;
  int damage, cooldown;

  abstract void display();

  abstract void pullTrigger();

  void releaseTrigger() {
  }
}


int pistolCooldown = 45;
class Pistol extends Gun {
  boolean triggerReleased = true;
  PImage pistol = loadImage("pistol.png");
  Pistol() {
    pistol.resize(200, 200);
    cooldown = 90;
  }
  void display() {
    fill(0);
    image(pistol, x+20, y+40);
  }
  void pullTrigger() {
    if (triggerReleased && player1.pistolGunCooldownTimer == pistolCooldown) {
      player1.pistolGunCooldownTimer = 0;
      bulletList.add(new PistolBullet(x, y, angle));
      //shootSound.play();

      triggerReleased = false;
    }
    if (triggerReleased && player2.pistolGunCooldownTimer == pistolCooldown) {
      player2.pistolGunCooldownTimer = 0;
      bulletList.add(new PistolBullet(x, y, angle));
      triggerReleased = false;
    }
  }

  void releaseTrigger() {
    triggerReleased = true;
  }
}

int rifleCooldown = 30;
class Rifle extends Gun {
  boolean triggerReleased = true;
  PImage rifle = loadImage("rifle.png");

  Rifle() {
    rifle.resize(200, 300);
    cooldown = 60;
  }

  void display() {
    fill(0);
    image(rifle, x+40, y+40);
  }
  void pullTrigger() {
    if (triggerReleased && player1.rifleGunCooldownTimer == rifleCooldown) {
      player1.rifleGunCooldownTimer = 0;
      bulletList.add(new RifleBullet(x, y, angle));
      triggerReleased = false;
    }

    if (triggerReleased && player2.rifleGunCooldownTimer == rifleCooldown) {
      player2.rifleGunCooldownTimer = 0;
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

int sniperCooldown = 70;
class Sniper extends Gun {
  boolean triggerReleased = true;

  PImage Sniper = loadImage("sniper.png");

  Sniper() {
    Sniper.resize(300, 300);
  }
  void display() {
    rectMode(CORNER);
    fill(255, 0, 0);
    rect(x+40, y+39, 10000, 2);
    rectMode(CENTER);
    fill(0);
    image(Sniper, x+40, y+40);
  }
  void pullTrigger() {
    if (triggerReleased && player1.sniperCooldownTimer == sniperCooldown) {
      player1.sniperCooldownTimer = 0;
      bulletList.add(new SniperBullet(x, y, angle));

      triggerReleased = false;
    }
    if (triggerReleased && player2.sniperCooldownTimer == sniperCooldown) {
      player2.sniperCooldownTimer = 0;
      bulletList.add(new SniperBullet(x, y, angle));
      triggerReleased = false;
    }
  }

  void releaseTrigger() {
    triggerReleased = true;
  }
}


int rocketLauncerCooldown = 110;
class RocketLauncher extends Gun {
  boolean triggerReleased = true;

  PImage RocketLauncher = loadImage("bazooka.png");

  RocketLauncher() {
    RocketLauncher.resize(300, 300);
  }
  void display() {
    fill(0);
    image(RocketLauncher, x+40, y+40);
  }
  void pullTrigger() {
    if (triggerReleased && player1.rocketLauncherCooldownTimer == rocketLauncerCooldown) {
      player1.rocketLauncherCooldownTimer = 0;
      bulletList.add(new RocketLauncherBullet(x, y, angle));

      triggerReleased = false;
    }
    if (triggerReleased && player2.rocketLauncherCooldownTimer == rocketLauncerCooldown) {
      player2.rocketLauncherCooldownTimer = 0;
      bulletList.add(new RocketLauncherBullet(x, y, angle));
      triggerReleased = false;
    }
  }

  void releaseTrigger() {
    triggerReleased = true;
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
    //image(pistol, x+20, y+40);
    image(pistol, x+20, y);
  }
  void pullTrigger() {
    if (triggerReleased) {
      enemyBulletList.add(new EnemyPistolBullet(x, y, angle));
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
    //image(rifle, x+40, y+40);
    image(rifle, x+40, y);
  }
  void pullTrigger() {
    if (triggerReleased) {
      enemyBulletList.add(new EnemyRifleBullet(x, y, angle));
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
    //image(machineGun, x+60, y+40);
    image(machineGun, x+60, y);
  }
  void pullTrigger() {
    if (triggerReleased) {
      enemyBulletList.add(new EnemyMachineGunBullet(x, y, angle));
      triggerReleased = false;
    }
  }
  void releaseTrigger() {
    triggerReleased = true;
  }
}
