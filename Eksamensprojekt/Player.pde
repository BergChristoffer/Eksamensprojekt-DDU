class Player {
  float health;
  int size;
  PVector position, speed;
  PImage img; 

  Player(float positionX, float positionY) {
    position = new PVector(positionX, positionY);
    speed = new PVector();
    size = 80;
    img = loadImage("sunglasses.png");
  }

  void update() {
    position.add(speed);
  }

  void display(color c) {
    imageMode(CENTER);
    strokeWeight(0);
    fill(c);
    ellipse(position.x, position.y, size, size);
    img.resize(0, size+25);
    image(img, position.x, position.y);
  }
}
