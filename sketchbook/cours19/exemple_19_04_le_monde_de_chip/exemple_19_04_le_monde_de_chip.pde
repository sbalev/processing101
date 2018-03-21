Monde monde;
Chip chip;

void setup() {
  size(720, 720);
  monde = new Monde(60, 60, 600, 600, 10, 10, 0.2);
  chip = new Chip(monde, 1, 25, 191);
}

void draw() {
  background(128);
  monde.dessiner();
  chip.bouger();
  chip.dessiner();
  if (chip.tresorTrouve()) {
    fill(0);
    textSize(24);
    textAlign(CENTER, TOP);
    text("Chip a trouvé le trésor !", width / 2, 20);
    noLoop();
  }
}
