abstract class Gun {
  float x, y, angle;

  abstract void display();

  abstract void pullTrigger();

  void releaseTrigger() {
  }
}

class Pistol extends Gun {
  boolean triggerReleased = true;

  void display() {
    fill(0);
    rect(x+20, y+40, 50, 10);
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
  void display() {
    fill(0);
    rect(x+20, y+40, 100, 10);
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
  void display() {
    fill(0);
    rect(x+20, y+40, 100, 20);
  }
  void pullTrigger() {
    bulletList.add(new MachineGunBullet(x, y, angle));
  }
}
