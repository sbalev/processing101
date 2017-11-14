int r = 25;
float x = r;
float y = r;
float v = 2;
int etat = 0;

void setup() {
  size(200, 200);
  noStroke();
  fill(127);
  ellipseMode(RADIUS);
}

void draw() {
  background(255);
  ellipse(x, y, r, r);

  if (etat == 0) {
    x += v;
    if (x > width - r) {
      x = width - r;
      etat = 1;
    }
  } else if (etat == 1) {
    y += v;
    if (y > height - r) {
      y = height - r;
      etat = 2;
    }
  } else if (etat == 2) {
    x -= v;
    if (x < r) {
      x = r;
      etat = 3;
    }
  } else {
    y -= v;
    if (y < r) {
      y = r;
      etat = 0;
    }
  }
}