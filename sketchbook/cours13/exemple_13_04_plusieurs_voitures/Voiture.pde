class Voiture {
  // attributs
  float x, y;
  float vitesse;
  color couleur;
  float taille;

  // constructeurs
  Voiture() {
    x = 0;
    y = height / 2;
    vitesse = 1;
    couleur = color(255, 0, 0);
    taille = 50;
  }

  Voiture(float x, float y, float vitesse, color couleur, float taille) {
    this.x = x;
    this.y = y;
    this.vitesse = vitesse;
    this.couleur = couleur;
    this.taille = taille;
  }

  // méthodes
  void dessiner() {
    rectMode(CENTER);
    fill(couleur);
    rect(x, y, taille, taille / 2);
  }

  void bouger() {
    x += vitesse;
    if (x > width) {
      x = 0;
    }
  }
}