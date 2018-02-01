Chip chip;
Cible cible;

void setup() {
  size(600, 600);
  chip = new Chip(0, 0, 1, 70, 191);
  cible = new Cible(width / 2, height / 2, 40, color(255, 128, 0));
}

void draw() {
  background(255);
  cible.dessiner();
  chip.avancerVers(cible.x, cible.y);
  chip.dessiner();
}

void mousePressed() {
  cible.deplacer(mouseX, mouseY);
}