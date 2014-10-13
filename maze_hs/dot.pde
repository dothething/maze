Dot[] dots = new Dot[174];

class Dot {
  float x;
  float y;
  boolean alive;
  boolean counted;
  int indx;
  Dot (float x_, float y_) {
    x = x_;
    y = y_;
    alive = true;
    counted = false;
    indx = int(random(kitten.length));
  }
  void display() {
    kill();
    if (alive) {
      // stroke(0);
      // fill(dotColor);
      // ellipseMode(CENTER);
      // ellipse(x, y, 10, 10);
      imageMode(CENTER);
      image(kitten[indx], x, y);
    } else if (!alive && !counted) {
      score+=(25*indx);
      counted = true;
    }
  }
  void kill() {
    PVector ballVec = new PVector(xPos, yPos);
    PVector dotVec = new PVector(x, y);
    float d = PVector.dist(ballVec, dotVec);
    if (d <= 10) {
      alive = false;
    }
  }
}
