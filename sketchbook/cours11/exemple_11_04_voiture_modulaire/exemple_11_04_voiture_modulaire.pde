void dessineVoiture(int x, int y, int taille, color c) {
  int decalage = taille / 4;

  // Le corps de la voiture.
  rectMode(CENTER);
  stroke(0);
  fill(c);
  rect(x, y, taille, taille / 2);

  // Les roues.
  fill(200);
  rect(x - decalage, y - decalage, decalage, decalage / 2);
  rect(x + decalage, y - decalage, decalage, decalage / 2);
  rect(x - decalage, y + decalage, decalage, decalage / 2);
  rect(x + decalage, y + decalage, decalage, decalage / 2);
}

void setup() {
  size(200, 200);
}

void draw() {
  background(0);
  dessineVoiture(100, 100, 64, color(200,200,0));
  dessineVoiture(50, 75, 32, color(0, 200, 100));
  dessineVoiture(80, 175, 40, color(200, 0, 0));
}