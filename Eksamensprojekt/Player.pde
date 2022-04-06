class Player {
  float health, angle;
  int size;
  PVector position, speed;
  PImage img; 
  float heading;



  Player(int positionX, int positionY) {
    position = new PVector(positionX, positionY);
    speed = new PVector();
    size = 80;
    img = loadImage("sunglasses.png");
    gun1 = new Gun(position.x, position.y, "pistol");
    gun2 = new Gun(position.x, position.y, "pistol");

    bullet1 = new Bullet1(position.x, position.y);
    bullet2 = new Bullet2(position.x, position.y);
  }


  void update() {
    //checkedges();
    angle = heading-PI/2;
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
    gun1.x = position.x;
    gun1.y = position.y;
    gun1.display();   
    gun2.x = position.x;
    gun2.y = position.y;
    gun2.display();

    popMatrix();

    bullet1.shoot();
    bullet2.shoot();
  }

  void checkedges() {
    if (position.x<0) 
      position.x=width;
    if (position.x>width)
      position.x=0;
    if (position.y<0)
      position.y=height;
    if (position.y>height)
      position.y=0;
  }

  boolean wallcolision() {
    boolean colide = false;
    for (int i=0; i<wall.length; i++) {
      if (dist(position.x, position.y, wall[i].x, wall[i].y)<player1.size/2+wall[i].radius)
        colide = true;
    }
    if (colide==true)
      return true;
    else return false;
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
    shoot2=true;
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
    shoot1 = true;
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
    shoot2 = false;
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
    shoot1=false;
  }
}
