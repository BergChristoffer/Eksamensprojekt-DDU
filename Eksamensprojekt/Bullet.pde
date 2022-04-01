class Bullet1 {
  PVector velocity, position;
  boolean bulletPlayer1InAir;
  float diameter, a, b; 
  
  Bullet1(float x, float y) {
    position = new PVector(x, y);

    velocity = new PVector();
  }

  void shoot() {
    if (shoot1) {
      position.x = player1.position.x;
      position.y= player1.position.y;
      velocity.x=cos(player1.angle);
      velocity.y=sin(player1.angle);

      if (gun1.type == "pistol") {
        velocity.mult(10);
        diameter = 10;
        a = 44;
        b = 20;
      }

      if (gun1.type == "rifle") {
        velocity.mult(30);
        diameter = 20;
        a = 44;
        b = 80;
      }

      position.x=position.x+a*cos(player1.angle+90)+b*cos(player1.angle);
      position.y=position.y+a*sin(player1.angle+90)+b*sin(player1.angle);

      bulletPlayer1InAir = true;
      shoot1 = false;
    }

    if (bulletPlayer1InAir)
      position.add(velocity);
    //else
    //  diameter = 0;

    circle(position.x, position.y, diameter);
  }
}

class Bullet2 {
  PVector velocity, position;
  boolean bulletPlayer2InAir;
  float diameter, a, b; 
  
  Bullet2(float x, float y) {
    position = new PVector(x, y);

    velocity = new PVector();
  }

  void shoot() {
    if (shoot2) {
      position.x = player2.position.x;
      position.y= player2.position.y;
      velocity.x=cos(player2.angle);
      velocity.y=sin(player2.angle);

      if (gun2.type == "pistol") {
        velocity.mult(10);
        diameter = 10;
        a = 44;
        b = 20;
      }

      if (gun2.type == "rifle") {
        velocity.mult(30);
        diameter = 100;
        a = 44;
        b = 80;
      }

      position.x=position.x+a*cos(player2.angle+90)+b*cos(player2.angle);
      position.y=position.y+a*sin(player2.angle+90)+b*sin(player2.angle);

      bulletPlayer2InAir = true;
      shoot2 = false;
    }

    if (bulletPlayer2InAir)
      position.add(velocity);
    //else
    //  diameter = 0;

    circle(position.x, position.y, diameter);
  }
}
