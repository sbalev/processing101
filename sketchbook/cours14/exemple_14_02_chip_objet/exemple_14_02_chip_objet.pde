Chip chip;

void setup() {
  size(400, 400);
  chip = new Chip(0, 0, 2, 70, 191);
}

void draw() {
  background(255);
  chip.avancerVers(width / 2, height / 2);
  chip.dessiner();
}