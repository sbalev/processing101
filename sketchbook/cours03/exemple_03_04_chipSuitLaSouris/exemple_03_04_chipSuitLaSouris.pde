void setup() {
  size(400, 400);
}

void draw() {
  background(255);
  strokeWeight(1);

  // le corps
  fill(191);
  rect(mouseX - 35, mouseY, 70, 70);

  // les trois LEDs
  fill(255, 0, 0);
  rect(mouseX - 25, mouseY + 20, 10, 10);
  fill(0, 255, 0);
  rect(mouseX - 5, mouseY + 20, 10, 10);
  fill(0, 0, 255);
  rect(mouseX + 15, mouseY + 20, 10, 10);

  // les roues
  fill(255);
  ellipse(mouseX - 20, mouseY + 70, 20, 20);
  ellipse(mouseX + 20, mouseY + 70, 20, 20);

  // la tête
  fill(191);
  arc(200, 195, 70, 70, -PI, 0, CHORD);

  // la caméra
  fill(63, 0, 0);
  ellipse(200, 180, 20, 20);

  // l'antenne
  strokeWeight(3);
  line(200, 160, 200, 120);
}