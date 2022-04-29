class Enemy {
  int health = 100;
  int size;
  PVector position, speed;
  float heading, agroRange;
  float rotation = 0;
  boolean hit, wallhit, player1target, player2target, blocked;
  PVector v = new PVector();

  Enemy() {
    position = new PVector(random(width), random(height));
    speed = new PVector(random(2, -2), random(2, -2));
    size = 50;
    wallhit = false;
    agroRange = 400;
  }

  void update() {
    updateHealth();
    enemyWallCollide();
    display();
    for (int i = 0; i < wall.length; i++) {      
      if (lineCircle(position.x, position.y, player1.position.x, player1.position.y, wall[i].x, wall[i].y, wall[i].radius)) {
        blocked=true;
      } else blocked =false;
    }
    updateMovement();
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

    //hvis dist mellem player1 og enemy er mindre end player2 og enemy få fjende agro på player1
    //if (dist(position.x, position.y, player1.position.x, player1.position.y)<dist(position.x, position.y, player2.position.x, player2.position.y)&&player2target==false) 
    //hvis dist mellem player1 og enemy er mindre end agro range bliver accelerationen, v, sat mod player1
    if (dist(position.x, position.y, player1.position.x, player1.position.y)<agroRange&&player2target==false) { 
      v = PVector.sub(player1.position, position);
      player1target = true;
    } else
      player1target = false;
    if (playMultiPlayer) {
      if (dist(position.x, position.y, player2.position.x, player2.position.y)<agroRange&&player1target==false) {
        v = PVector.sub(player2.position, position);
        player2target = true;
      } else player2target = false;
    }
    v.normalize();
    //hvor hurtigt skal fjenden kunne dreje
    v.mult(0.1);
    //tilføjer v til speed
    speed.add(v);
    speed.limit(1);
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
      if (dist(position.x, position.y, wall[i].x, wall[i].y)<size/2+wall[i].radius) {
        speed.x = speed.x*-2;
        speed.y = speed.y*-2;
      }
    }
  }


  void updateHealth() {
    if (hit) {
      health = health-20;
      hit = false;
    }
  }

  boolean lineCircle(float x1, float y1, float x2, float y2, float cx, float cy, float r) {

    // get length of the line
    float distX = x1 - x2;
    float distY = y1 - y2;
    float len = sqrt( (distX*distX) + (distY*distY) );

    // get dot product of the line and circle
    float dot = ( ((cx-x1)*(x2-x1)) + ((cy-y1)*(y2-y1)) ) / pow(len, 2);

    // find the closest point on the line
    float closestX = x1 + (dot * (x2-x1));
    float closestY = y1 + (dot * (y2-y1));

    boolean onSegment = linePoint(x1, y1, x2, y2, closestX, closestY);
    if (!onSegment) return false;

    // optionally, draw a circle at the closest
    // point on the line
    fill(255, 0, 0);
    noStroke();
    ellipse(closestX, closestY, 20, 20);

    // get distance to closest point
    distX = closestX - cx;
    distY = closestY - cy;
    float distance = sqrt( (distX*distX) + (distY*distY) );

    if (distance <= r) {
      return true;
    }
    return false;
  }

  boolean linePoint(float x1, float y1, float x2, float y2, float px, float py) {

    // get distance from the point to the two ends of the line
    float d1 = dist(px, py, x1, y1);
    float d2 = dist(px, py, x2, y2);

    // get the length of the line
    float lineLen = dist(x1, y1, x2, y2);

    // since floats are so minutely accurate, add
    // a little buffer zone that will give collision
    float buffer = 0.1;    // higher # = less accurate

    // if the two distances are equal to the line's
    // length, the point is on the line!
    // note we use the buffer here to give a range,
    // rather than one #
    if (d1+d2 >= lineLen-buffer && d1+d2 <= lineLen+buffer) {
      return true;
    }
    return false;
  }
}
