class Wall {
  float x, y; //position
  float diameter; //diameter på væggen
  color col; //farve på væggen

  Wall(float x, float y, float diameter, color col) {
    this.x = x;
    this.y= y;
    this.diameter = diameter;
    this.col = col;
  }

  void update() {
    display();
  }

  void display() {
    ellipseMode(CENTER);
    fill(col);
    circle(x, y, diameter);
    fill(255);
  }
}
