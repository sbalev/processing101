float r, g, b, a, x, y, diam;

void setup() {
  size(320, 240);
  background(255);
  noStroke();
}

void draw() {
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  x = random(width);
  y = random(height);
  diam = random(20);
  fill(r, g, b, a);
  ellipse(x, y, diam, diam);
}