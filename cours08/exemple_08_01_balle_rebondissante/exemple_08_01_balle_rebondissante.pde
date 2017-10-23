int r = 25;
int x;
int y;
int v = 1;

void setup() {
  size(200, 200);
  x = r;
  y = height / 2;
  noStroke();
  fill(127);
  ellipseMode(RADIUS);
}

void draw() {
  background(255);
  ellipse(x, y, r, r);
  x += v;
  if (x < r || x > width - r) {
    v = -v;
  }
}