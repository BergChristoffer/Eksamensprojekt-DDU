class Button {
  float x, y; //position
  float w, h; // size
  color col; //color
  String label; //button text
  int textSize;

  Button(float x, float y, float w, float h, color col, String label, int textSize) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.col = col;
    this.label = label;
    this.textSize = textSize;
  }

  void update() {
    display();
    isClicked();
    mouseOver();
  }

  void display() {
    rectMode(CENTER);
    if(mouseOver() == false)
    fill(col);
      else
      fill(col,210);
    
    
    rect(x, y, w, h);
    textSize(textSize);
    textAlign(CENTER, CENTER);
    fill(0);
    text(label, x, y);
    fill(255);
  }

  boolean mouseOver() {
    if (mouseX >= x - (w/2) && mouseX <= x + (w/2) && mouseY >= y - (h/2) && mouseY <= y + (h/2)) {

      return true;
    } else
      return false;
  }

  boolean isClicked() {
    if (mouseX >= x - (w/2) && mouseX <= x + (w/2) && mouseY >= y - (h/2) && mouseY <= y + (h/2) && mousePressed) {
      mousePressed = false;
      return true;
    } else   
    return false;
  }
}
