class Gun {
  float x, y; //position
  String type;

  Gun(float x, float y, String type) {
    this.x = x;
    this.y = y;
    this.type = type;
  }

  void display() {

    if (type == "pistol") {
      fill(0);
      rect(x+20, y+40, 50, 10);
    }

    if (type == "rifle") {
      fill(0);
      rect(x+20, y+40, 100, 10);
    }
  }
}
