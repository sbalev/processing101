Attrapeur attrapeur;

void setup() {
  size(400, 400);
  attrapeur = new Attrapeur(32);
}

void draw() {
  background(255);
  attrapeur.placer(mouseX, mouseY);
  attrapeur.dessiner();
}