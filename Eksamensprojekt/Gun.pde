class Gun {
  float x, y; //position
  String gun;

  Gun(float x, float y, String gun) {
    this.x = x;
    this.y = y;
    this.gun = gun;
  }

  void display() {

    if (gun == "pistol") {
      fill(0);
      rect(x+20, y+40, 50, 10);
    }

    if (gun == "rifle") {
      fill(0);
      rect(x+20, y+40, 100, 10);
    }
  }
}
