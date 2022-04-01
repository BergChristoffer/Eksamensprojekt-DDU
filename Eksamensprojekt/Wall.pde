class Wall {
  float x, y; //position
  float radius; //diameter på væggen
  color col; //farve på væggen

  Wall(float x, float y, float radius, color col) {
    this.x = x;
    this.y= y;
    this.radius = radius;
    this.col = col;
  }

  void update() {
    display();
  }

  void display() {
    ellipseMode(CENTER);
    fill(col);
    circle(x, y, radius*2);
    fill(255);
  }
}
