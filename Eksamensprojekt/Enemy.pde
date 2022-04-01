class Enemy {
  float health;
  int size;
  PVector position, speed;
  float heading;



  Enemy(float positionX, float positionY) {
    position = new PVector(positionX, positionY);
    speed = new PVector();
    size = 50;
  }

  void update() {
    display();
    updateMovement();
  }

  void display() {
    //pushMatrix();
    //translate(position.x, position.y);
    fill(130, 0, 0);
    circle(position.x, position.y, size);
    rectMode(CENTER);
    fill(0);
    rect(position.x, position.y-20, 10, 10);  
    //popMatrix();
  }

  void updateMovement() {
    if ((int)random(20) == 1) {
      speed = new PVector(random(-10, 10), random(-10, 10));
      position.add(speed);
    }
  }
}
