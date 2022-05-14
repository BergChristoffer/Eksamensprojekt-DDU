class Enemy {
  int size, agroRange, health, type, totalhealth;
  PVector position, speed, tempPosEnemy;
  float theta, speedlimit, procent;
  float rotation = 0;
  boolean hit, wallhit, player1target, player2target, player1blocked, player2blocked;
  PVector v = new PVector();
  Gun gun;
  String gunType;
  int coolDown = 0;
  boolean shoot;

  Enemy(PVector pos, String gunType, int health, int size, int agroRange, int type) {
    position = new PVector(pos.x, pos.y);
    speed = new PVector(random(-2, 2), random(-2, 2));
    this.size = size;
    wallhit = false;
    this.agroRange = agroRange;
    speedlimit = 1;
    tempPosEnemy = new PVector(0, 0);
    //this.gun = gun;
    this.gunType = gunType;
    this.health = health;
    this.type = type;
    totalhealth = health;

    if (gunType == "EnemyPistol")
      gun = new EnemyPistol();
    if (gunType == "EnemyRifle")
      gun = new EnemyRifle();
    if (gunType == "EnemyMachineGun")
      gun = new EnemyMachineGun();
  }

  void update() {
    theta = v.heading();
    for (int i = 0; i < wallList.size(); i++) {
      if (dist(position.x, position.y, wallList.get(i).x, wallList.get(i).y) >= size/2 + wallList.get(i).radius) 
        tempPosEnemy = new PVector(position.x, position.y);
      if (lineCircle(position.x, position.y, player1.position.x, player1.position.y, wallList.get(i).x, wallList.get(i).y, wallList.get(i).radius)) {
        player1blocked = true;
      }
      if (lineCircle(position.x, position.y, player2.position.x, player2.position.y, wallList.get(i).x, wallList.get(i).y, wallList.get(i).radius)) {
        player2blocked = true;
      }
    }
    updateMovement();
    enemyWallCollide();
    display();
    player1blocked = false;
    player2blocked = false;
  }


  void display() {
    pushMatrix();
    translate(position.x, position.y);
    rotate(speed.heading());
    translate(-position.x, -position.y);

    //lav enemy som viser liv
    if (type!=3) {
      fill(255, 0, 0);
      circle(position.x, position.y, size);
    }
    fill(255, 255, 0, health);
    if (type == 3)
      fill(255, 0, 255);
    circle(position.x, position.y, size);
    if (type == 1) {
      fill(0);
      rect(position.x, position.y, 40, 20);
    }
    rectMode(CENTER);
    fill(0);
    gun.angle = speed.heading();
    gun.x = position.x;
    gun.y = position.y;
    gun.display();
    popMatrix();
    pushMatrix();
    if (type == 3) {
      rectMode(CORNER);
      text("BIG GUY", width/2, height-80);
      fill(90);
      rect(45, height-45, width-90, 20);
      fill(220, 220, 30);
      procent = (float)health/(float)totalhealth * (width-100);
      rect(50, height-40, procent, 10);
      rectMode(CENTER);
    }
    popMatrix();
  }

  void updateMovement() {
    //simple ai til enemy

    //hvis dist mellem player1 og enemy er mindre end player2 og enemy få fjende agro på player1
    //if (dist(position.x, position.y, player1.position.x, player1.position.y)<dist(position.x, position.y, player2.position.x, player2.position.y)&&player2target==false) 
    //hvis dist mellem player1 og enemy er mindre end agro range bliver accelerationen, v, sat mod player1
    if (dist(position.x, position.y, player1.position.x, player1.position.y)<agroRange&&player2target==false&&player1blocked==false) { 
      v = PVector.sub(player1.position, position);
      player1target = true;
    } else player1target = false;
    if (playMultiPlayer) {
      if (dist(position.x, position.y, player2.position.x, player2.position.y)<agroRange&&player1target==false&&player2blocked==false) {
        v = PVector.sub(player2.position, position);
        player2target = true;
      } else player2target = false;
    }
    v.normalize();
    //hvor hurtigt skal fjenden kunne dreje
    v.mult(0.1);
    //tilføjer v til speed
    //if (player1blocked==false||player2blocked==false)
    //  speed.add(v);
    speed.limit(speedlimit);
    if (type ==3)
      speedlimit=0;
    if (player1target||player2target) {
      if (dist(player1.position.x, player1.position.y, position.x, position.y)>200&&dist(player2.position.x, player2.position.y, position.x, position.y)>200) 
        position.add(speed);
    } else if (type==1) position.add(speed);
    if (player1target==false&&player2target==false) {
      speed.normalize();
      speed = speed.mult(speedlimit);
    } else speed.add(v);
  }



  float updateRotation() {
    float rotate = 0;
    rotate = random(PI/10);
    return rotate;
  }



  void enemyWallCollide() {
    float radius = size/2;
    for (int i = 0; i<wallList.size(); i++) {
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
      if (dist(position.x, position.y, wallList.get(i).x, wallList.get(i).y)<size/2+wallList.get(i).radius) {
        if (player1target||player2target)
          position = new PVector(tempPosEnemy.x, tempPosEnemy.y);
        else 
        speed = new PVector(speed.x*-2, speed.y*-2);
      }
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
    noStroke();
    //ellipse(closestX, closestY, 20, 20);

    // get distance to closest point
    distX = closestX - cx;
    distY = closestY - cy;
    float distance = sqrt( (distX*distX) + (distY*distY) );

    if (distance <= r) {
      return true;
    } else return false;
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
    } else return false;
  }
}
