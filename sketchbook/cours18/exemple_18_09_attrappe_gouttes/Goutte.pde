class Goutte {
  float x, y;     // Position
  float v;        // Vitesse
  color c;        // Couleur
  float r;        // Rayon

  Goutte() {
    r = 8;      // Nos gouttes ont toutes la même taille pour l'instant.
    x = random(width);
    y = -4 * r; // on commence légèrement au dessus du haut de l'écran.
    v = random(1, 5);
    c = color(50, 100, 150);
  }

  void bouger() {
    y += v;
  }

  boolean enBas() {
    return(y > height + 4 * r);
  }

  void dessiner() {
    fill(c);
    noStroke();
    for (int i = 2; i <= r; i++) {
      ellipse(x, y + 4 * i, 2 * i, 2 * i);
    }
  }
  
  void attrapee() {
    y = -1000;
    v = 0;
  }
}