void setup() {
  size(400, 400);
  background(255);
}

void draw() {
  // dessiner une ligne entre la position précédente
  // et la position courante de la souris
  line(pmouseX, pmouseY, mouseX, mouseY);
}