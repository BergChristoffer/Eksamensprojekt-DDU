class Player {
  float health;
  int size;
  PVector position, speed;
  PImage img; 

  Player(float positionX, float positionY) {
    position = new PVector(positionX, positionY);
    speed = new PVector();
    size = 80;
    img = loadImage("sunglasses.png");
  }

  void update() {
    position.add(speed);
  }

  void display(color c) {
    imageMode(CENTER);
    strokeWeight(0);
    fill(c);
    ellipse(position.x, position.y, size, size);
    img.resize(0, size+25);
    image(img, position.x, position.y);
  }
}

void updateMovementPlayer1() {
  if (w)
    player1.position.add(0, -5);

  if (s)
    player1.position.add(0, 5);

  if (a)
    player1.position.add(-5, 0);

  if (d)
    player1.position.add(5, 0);
}

void updateMovementPlayer2() {
  if (up)
    player2.position.add(0, -5);

  if (down)
    player2.position.add(0, 5);

  if (left)
    player2.position.add(-5, 0);

  if (right)
    player2.position.add(5, 0);
}




//player 1
boolean w, a, s, d;

//player 2
boolean up, down, right, left;

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
}
