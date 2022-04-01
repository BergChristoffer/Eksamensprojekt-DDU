class Bullet {
  PVector velocity, position;
  float radius;
  Bullet(float x, float y, float size) {
    position = new PVector(x, y);
    velocity = new PVector();
    radius = size;
  }

  void display() {
    circle(position.x, position.y, radius);
  }
}
