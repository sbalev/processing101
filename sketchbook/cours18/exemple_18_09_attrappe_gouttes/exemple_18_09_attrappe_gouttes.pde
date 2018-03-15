Attrapeur attrapeur;
Chronometre chrono;
Goutte[] gouttes = new Goutte[1000];
int totalGouttes = 0;

void setup() {
  size(800, 800);
  attrapeur = new Attrapeur(32);
  chrono = new Chronometre(2000);
  chrono.lancer();
}

void draw() {
  background(255);

  attrapeur.placer(mouseX, mouseY);
  attrapeur.dessiner();

  if (chrono.estTermine()) {
    gouttes[totalGouttes] = new Goutte();
    totalGouttes++;
    if (totalGouttes >= gouttes.length) {
      totalGouttes = 0;
    }
    chrono.lancer();
  }

  for (int i = 0; i < totalGouttes; i++) {
    if (attrapeur.intersecte(gouttes[i])) {
      gouttes[i].attrapee();
    }
    gouttes[i].dessiner();
    gouttes[i].bouger();
  }
}