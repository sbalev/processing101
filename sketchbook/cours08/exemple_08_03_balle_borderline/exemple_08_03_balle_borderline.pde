int r = 25;
float x;
float y;
float v = 2;
float alpha = random(TWO_PI);
float vx = v * cos(alpha);
float vy = v * sin(alpha);

void setup() {
  size(200, 200);
  x = random(r, width - r);
  y = random(r, height - r);
  noStroke();
  fill(127);
  ellipseMode(RADIUS);
}

void draw() {
  background(255);
  ellipse(x, y, r, r);
  x += vx;
  y += vy;
  if (x < r || x > width - r) {
    vx = -vx;
  }
  if (y < r || y > height - r) {
    vy = -vy;
  }
}