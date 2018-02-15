Voiture[] voitures = new Voiture[400];

void setup() {
  size(400, 400);
  for (int i = 0; i < voitures.length; i++) {
    voitures[i] = new Voiture(0, i * 4, random(1, 5), color(i * 2), 8);
  }
}

void draw() {
  background(255);
  for (int i = 0; i < voitures.length; i++) {
    voitures[i].dessiner();
    voitures[i].bouger();
  }
}