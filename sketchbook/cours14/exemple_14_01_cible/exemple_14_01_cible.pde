Cible cibleSouris, cibleClick;

void setup() {
  size(400, 400);
  cibleSouris = new Cible(0, 0, 25, color(0, 126, 198));
  cibleClick = new Cible(width / 2, height / 2, 50, color(255, 144, 0));
}

void draw() {
  background(255);
  cibleClick.dessiner();
  cibleSouris.deplacer(mouseX, mouseY);
  cibleSouris.dessiner();
}

void mousePressed() {
  cibleClick.deplacer(mouseX, mouseY);
}