// On déclare deux variables au début du croquis
int cercleX = 100;
int cercleY = 100;

void setup() {
  size(200, 200);
}

void draw() {
  background(255);
  fill(127);
  // On utilise ces variables pour spécifier la position du cercle
  ellipse(cercleX, cercleY, 50, 50);
}