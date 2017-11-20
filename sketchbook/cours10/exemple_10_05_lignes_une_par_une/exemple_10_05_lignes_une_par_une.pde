int y = 0; // pas besoin de boucle for, mais une variable compteur globale.

void setup() {
  size(200, 200);
  background(255);
  // On ralentit afin de voir les lignes se dessiner progressivement.
  frameRate(5);
}

void draw() {
  // Dessine une ligne.
  stroke(0);
  line(0, y, width, y);
  // Incrémente notre compteur y pour le prochain tour de la boucle exécutant draw().
  y += 10;
}