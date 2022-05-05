class Player { //<>// //<>// //<>// //<>//
  float health, angle;
  int size;
  PVector position, speed, tempPos;
  PImage img; 
  float heading;
  boolean colide = false;
  Gun gun;
  int gunCoolDown = 0;

  Player(float positionX, float positionY, Gun gun) {
    position = new PVector(positionX, positionY);
    speed = new PVector();
    this.gun = gun;
    size = 80;
    img = loadImage("sunglasses.png");
    tempPos = new PVector();
  }


  void update() {
    //checkedges();
    angle = heading-PI/2;
    for (int i=0; i<wallList.size(); i++) {
      if (dist(position.x, position.y, wallList.get(i).x, wallList.get(i).y) >= size/2 + wallList.get(i).radius)
        tempPos = new PVector(position.x, position.y);
    }
  }

  void display(color c) {
    pushMatrix();
    translate(position.x, position.y);
    rotate(angle);
    fill(c);
    imageMode(CENTER);
    translate(-position.x, -position.y);
    circle(position.x, position.y, size);
    img.resize(0, size+25);
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
    player1.turn(-0.05);
  if (d) 
    player1.turn(0.05);
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
    player2.turn(-0.05);
  if (right)
    player2.turn(0.05);
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
    player2.gun.pullTrigger();
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
    player1.gun.pullTrigger();
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
    player1.gun.releaseTrigger();
  }
}
