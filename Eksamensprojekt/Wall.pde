class Wall {
  float x, y; //position
  float radius; //diameter på væggen
  color col; //farve på væggen
  PVector position;

  Wall(float x, float y, float radius, color col) {
    this.x = x;
    this.y= y;
    this.radius = radius;
    this.col = col;
    position = new PVector(x,y);
  }

  void update() {
    display();
    position.x = x;
    position.y = y;
  }

  void display() {
    ellipseMode(CENTER);
    fill(col);
    circle(x, y, radius*2);
    fill(255);
  }
}
