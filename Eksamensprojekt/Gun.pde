class Gun {
  float x, y; //position
  String type;
  PImage pistol, rifle, big_gun;

  Gun(float x, float y, String type) {
    this.x = x;
    this.y = y;
    this.type = type;
    pistol = loadImage("pistol.png");
    rifle = loadImage("rifle.png");
  }

  void display() {

    if (type == "pistol") {
      fill(0);
      //rect(x+20, y+40, 50, 10);
      pistol.resize(200,200);
      image(pistol,x+20,y+40);
    }

    if (type == "rifle") {
      fill(0);
      //rect(x+20, y+40, 100, 10);
      rifle.resize(200,300);
      image(rifle,x+40,y+40);
    }
  }
}
