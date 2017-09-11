int cercleX = 0;
int cercleY = 100;

void setup() {
  size(200, 200);
}

void draw() {
  background(255);
  fill(127);
  ellipse(cercleX, cercleY, 50, 50);
  
  // on incrémente cercleX
  cercleX = cercleX + 1;
}