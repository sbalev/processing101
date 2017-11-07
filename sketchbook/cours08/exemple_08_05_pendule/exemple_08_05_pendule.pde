final float THETA0 = QUARTER_PI;
final float OMEGA = 0.02;
final int L = 200;

float theta, x, y;
float t = 0;

void setup() {
  size(400, 300);
}

void draw() {
  background(255);
  
  theta = THETA0 * cos(OMEGA * t);
  x = width / 2 + L * sin(theta);
  y = L * cos(theta);
  
  stroke(0);
  line(width / 2, 0, x, y);
  noStroke();
  fill(127);
  ellipse(x, y, 50, 50);
  t++;
}