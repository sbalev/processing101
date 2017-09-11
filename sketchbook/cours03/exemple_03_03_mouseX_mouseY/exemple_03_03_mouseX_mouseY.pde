void setup() {
  size(400, 400);
}

void draw() {
  background(255);
  fill(127);
  rectMode(CENTER);
  // mouseX et mouseY sont des mots clefs que Processing remplace
  // par la position horizontale et verticale de la souris
  rect(mouseX, mouseY, 50, 50);
}