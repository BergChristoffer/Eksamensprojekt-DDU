class Enemy {
  int health = 100;
  int size;
  PVector position, speed;
  float heading, agroRange;
  float rotation = 0;
  boolean hit, wallhit, player1target, player2target;

  Enemy(float positionX, float positionY) {
    position = new PVector(positionX, positionY);
    speed = new PVector(random(2, -2), random(2, -2));
    size = 50;
    wallhit = false;
    agroRange = 400;
  }

  void update() {
    updateHealth();
    display();
    updateMovement();
    enemyWallCollide();
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
    //simple ai til enemy
    PVector v = new PVector();
    //hvis dist mellem player1 og enemy er mindre end player2 og enemy få fjende agro på player1
    if (dist(position.x, position.y, player1.position.x, player1.position.y)<dist(position.x, position.y, player2.position.x, player2.position.y)&&player2target==false) 
      //hvis dist mellem player1 og enemy er mindre end agro range bliver accelerationen, v, sat mod player1
      if (dist(position.x, position.y, player1.position.x, player1.position.y)<agroRange) { 
        v = PVector.sub(player1.position, position);
        player1target = true;
      } else 
      player1target = false;

    if (dist(position.x, position.y, player2.position.x, player2.position.y)<agroRange&&player1target==false) {
      v = PVector.sub(player2.position, position);
      player2target = true;
    } else player2target = false;
    v.normalize();
    //hvor hurtigt skal fjenden kunne dreje
    v.mult(0.1);
    //tilføjer v til speed
    speed.add(v);
    speed.limit(2);
    position.add(speed);
  }
  float updateRotation() {
    float rotate = 0;
    rotate = random(PI/10);
    return rotate;
  }
  void enemyWallCollide() {
    float radius = size/2;
    for (int i = 0; i<wall.length; i++) {
      if (position.x > width-radius) {
        position.x = width-radius;
        speed.x *= -1;
      } else if (position.x < radius) {
        position.x = radius;
        speed.x *= -1;
      } else if (position.y > height-radius) {
        position.y = height-radius;
        speed.y *= -1;
      } else if (position.y < radius) {
        position.y = radius;
        speed.y *= -1;
      }

      //PVector dist = PVector.sub(wall[i].position, position);     
      //float distmag = dist.mag();
      //float mindist = radius + wall[i].radius;
      //if (distmag < mindist) {
      //  float theta = dist.heading();
      //  float sin = sin(theta);
      //  float cos = cos(theta);
      //  speed.x = cos * speed.x + sin * speed.y;
      //  speed.y = cos * speed.y - sin * speed.x;
      //}
    }
  }


  void updateHealth() {
    if (hit) {
      health = health-20;
      hit = false;
    }
  }
}
