Goutte[] gouttes = new Goutte[50];

void setup() {
  size(400, 400);
  for (int i = 0; i < gouttes.length; i++) {
    gouttes[i] = new Goutte();
  }
}

void draw() {
  background(255);
  for (int i = 0; i < gouttes.length; i++) {
    gouttes[i].dessiner();
    gouttes[i].bouger();
  }
}