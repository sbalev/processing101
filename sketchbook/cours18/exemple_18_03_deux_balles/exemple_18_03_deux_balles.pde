Balle b1, b2;

void setup() {
  size(400, 400);
  b1 = new Balle(64);
  b2 = new Balle(32);
}

void draw() {
  background(0);
  b1.dessiner();
  b2.dessiner();
  b1.bouger();
  b2.bouger();
}