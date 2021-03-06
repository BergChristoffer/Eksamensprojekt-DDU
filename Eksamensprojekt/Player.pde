class Player { //<>//
  float angle;
  int health = 200;
  int size;
  PVector position, speed, tempPos;
  PImage img; 
  float heading;
  boolean colide, hit;
  Gun gun;
  int pistolGunCooldownTimer, rifleGunCooldownTimer, sniperCooldownTimer, rocketLauncherCooldownTimer = 0;
  boolean shoot;
  String gunType;
  color col;
  Pistol pistol;
  Rifle rifle;

  Player(float positionX, float positionY, String gunType, color col) {
    position = new PVector(positionX, positionY);
    speed = new PVector();
    //this.gun = gun;
    size = 80;
    img = loadImage("sunglasses.png");
    tempPos = new PVector();
    this.col = col;

    if (gunType == "Pistol")
      gun = new Pistol();
    if (gunType == "Rifle")
      gun = new Rifle();
    if (gunType == "MachineGun")
      gun = new MachineGun();
    if (gunType == "Sniper")
      gun = new Sniper();
    if (gunType == "RocketLauncher")
      gun = new RocketLauncher();


    img.resize(0, size+25);
  }


  void update() {
    display();
    updateHealth();


    if (health <= 0) {
      position = new PVector(-1000, -1000);
      health = 0;
    }

    if (pistolGunCooldownTimer != pistolCooldown)
      pistolGunCooldownTimer++;

    if (rifleGunCooldownTimer != rifleCooldown)
      rifleGunCooldownTimer++;

    if (sniperCooldownTimer != sniperCooldown)
      sniperCooldownTimer++;

    if (rocketLauncherCooldownTimer != rocketLauncerCooldown)
      rocketLauncherCooldownTimer++;

    angle = heading-PI/2;
    for (int i=0; i<wallList.size(); i++) {
      if (dist(position.x, position.y, wallList.get(i).x, wallList.get(i).y) >= size/2 + wallList.get(i).radius)
        tempPos = new PVector(position.x, position.y);
    }
  }

  void updateHealth() {
    if (hit) {
      health -= damage;
      hit = false;
    }
  }


  void display() {
    pushMatrix();
    translate(position.x, position.y);
    rotate(angle);
    fill(col);
    imageMode(CENTER);
    translate(-position.x, -position.y);
    circle(position.x, position.y, size);
    image(img, position.x, position.y);
    gun.angle = angle;
    gun.x = position.x;
    gun.y = position.y;
    gun.display();   
    popMatrix();
  }

  void checkedges() {
    if (position.x<0) 
      position.x=0;
    if (position.x>width)
      position.x=width;
    if (position.y<0)
      position.y=0;
    if (position.y>height)
      position.y=height;
  }

  boolean wallcolision() {
    for (int i=0; i<wallList.size(); i++) {
      if (dist(position.x, position.y, wallList.get(i).x, wallList.get(i).y) < size/2 + wallList.get(i).radius) {
        colide = true;
      }
    }
    if (colide==true) 
      return true;
    else 
    return false;
  }
  void turn(float a) {
    heading+=a;
  }
}

void updateMovementPlayer1() {
  if (w) {
    player1.speed.x=cos(player1.angle);
    player1.speed.y=sin(player1.angle);
    player1.speed.mult(3);
    player1.position.add(player1.speed);
  }
  if (s) {
    player1.speed.x=cos(player1.angle)*-1;
    player1.speed.y=sin(player1.angle)*-1;
    player1.speed.mult(3);
    player1.position.add(player1.speed);
  }
  if (a) 
    player1.turn(-0.0625);
  if (d) 
    player1.turn(0.0625);
  player1.checkedges();
}

void updateMovementPlayer2() {
  if (up) {
    player2.speed.x=cos(player2.angle);
    player2.speed.y=sin(player2.angle);
    player2.speed.mult(3);
    player2.position.add(player2.speed);
  }
  if (down) {
    player2.speed.x=cos(player2.angle)*-1;
    player2.speed.y=sin(player2.angle)*-1;
    player2.speed.mult(3);
    player2.position.add(player2.speed);
  }
  if (left)
    player2.turn(-0.075);
  if (right)
    player2.turn(0.075);
  player2.checkedges();
}

//player 1
boolean w, a, s, d, shoot1;

//player 2
boolean up, down, right, left, shoot2;

void keyPressed() {
  if  (keyCode == UP) {
    up = true;
    down = false;
  } 
  if (keyCode == DOWN) {
    down = true;
    up = false;
  }
  if (keyCode == LEFT) {
    left = true;
    right = false;
  }
  if (keyCode == RIGHT) {
    right = true;
    left = false;
  }
  if (key == 'm') {
    if (playMultiPlayer) {
      player2.gun.pullTrigger();
      player2.shoot = true;
    }
  }

  if (key == 'w') {
    w = true;
    s = false;
  } 
  if (key == 's') {
    s = true;
    w = false;
  }
  if (key == 'a') {
    a = true;
    d = false;
  }
  if (key == 'd') {
    d = true;
    a = false;
  }
  if (key == ' ') {
    if (playSinglePlayer) {
      player1.gun.pullTrigger();
      player1.shoot = true;
    }
  }
}
void keyReleased() {
  if  (keyCode == UP) {
    up = false;
  }
  if (keyCode == DOWN) {
    down = false;
  }
  if (keyCode == LEFT) {
    left = false;
  }
  if (keyCode == RIGHT) {
    right = false;
  }
  if (key == 'm') {
    if (playMultiPlayer)
      player2.gun.releaseTrigger();
  }
  if (key == 'w') {
    w = false;
  }  
  if (key == 's') {
    s = false;
  }  
  if (key == 'a') {
    a = false;
  }  
  if (key == 'd') {
    d = false;
  }
  if (key == ' ') {
    if (playSinglePlayer)
      player1.gun.releaseTrigger();
  }
}
