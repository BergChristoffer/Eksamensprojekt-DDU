class Enemy {
  int health = 100;
  int size;
  PVector position, speed;
  float heading;
  float rotation = 0;
  boolean hit;

  Enemy(float positionX, float positionY) {
    position = new PVector(positionX, positionY);
    speed = new PVector();
    size = 50;
  }

  void update() {
    updateHealth();
    if (health > 0) {
      display();
      updateMovement();
    }
  }

  void display() {
    pushMatrix();

    translate(position.x, position.y);


    rotation = rotation + updateRotation();
    rotate(rotation);
    translate(-position.x, -position.y);

    //lav enemy
    fill(130, 0, 0);
    circle(position.x, position.y, size);
    rectMode(CENTER);
    fill(0);
    rect(position.x, position.y-20, 10, 10);  
    popMatrix();
  }

  void updateMovement() {
    if ((int)random(10) == 1) 
      speed = new PVector(random(-10, 10), random(-10, 10));
    position.add(speed);

    if (position.x>width||position.x<0||position.y>height||position.y<0)
      position = new PVector(width/2, height/2);
  }
  float updateRotation() {
    float rotate = 0;
    rotate = random(PI/10);
    return rotate;
  }


  void updateHealth() {
    if (hit) {
      health = health-20;
      hit = false;
    }
  }
}
