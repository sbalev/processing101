int r = 25;
float x;
float y;
float vitesse = 0;
float acceleration = 0.1;

void setup() {
  size(400, 400);
  x = width / 2;
  y = r;
  noStroke();
  fill(127);
  ellipseMode(RADIUS);
}

void draw() {
  background(255);
  ellipse(x, y, r, r);
  
  y += vitesse;
  vitesse += acceleration;
  
  if (y > height - r) {
    // la balle perd un peu de vitesse quand elle touche le sol
    vitesse *= -0.95;
  }
}