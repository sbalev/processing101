void setup() {
  size(400, 400);
  frameRate(30);
}

void draw() {
  background(255);
  strokeWeight(1);

  // le corps
  fill(191);
  rect(mouseX - 35, mouseY, 70, 70);

  // les trois LEDs
  colorMode(RGB, width, height, width + height);
  fill(mouseX, 0, 0);
  rect(mouseX - 25, mouseY + 20, 10, 10);
  fill(0, mouseY, 0);
  rect(mouseX - 5, mouseY + 20, 10, 10);
  fill(0, 0, mouseX + mouseY);
  rect(mouseX + 15, mouseY + 20, 10, 10);
  colorMode(RGB, 255, 255, 255);

  // les roues
  fill(255);
  ellipse(mouseX - 20, mouseY + 70, 20, 20);
  ellipse(mouseX + 20, mouseY + 70, 20, 20);

  // la tête
  fill(191);
  arc(mouseX, mouseY - 5, 70, 70, -PI, 0, CHORD);

  // la caméra
  fill(63, 0, 0);
  ellipse(mouseX, mouseY - 20, 20, 20);

  // l'antenne
  strokeWeight(3);
  line(mouseX, mouseY - 40, pmouseX, pmouseY - 80);
}

void mousePressed() {
  println("Je suis sur (" + mouseX + ", " + mouseY + ")");
}