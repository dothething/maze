class Dot {
  float x;
  float y;
  boolean alive;
  Dot (float x_, float y_) {
    x = x_;
    y = y_;
    alive = true;
  }
  void display() {
    if (alive) {
      noStroke();
      fill(dotColor);
      ellipseMode(CENTER);
      ellipse(x, y, 5, 5);
    }
  }
}
