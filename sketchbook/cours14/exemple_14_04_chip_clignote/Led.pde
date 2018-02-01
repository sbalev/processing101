class Led {
  float taille;
  color couleur;
  boolean on;
  
  Led(float taille, color couleur) {
    this.taille = taille;
    this.couleur = couleur;
    on = false;
  }
  
  void dessiner(float x, float y) {
    noStroke();
    if (on) {
      fill(couleur);
    } else {
      fill(63);
    }
    rectMode(CENTER);
    rect(x, y, taille, taille);
  }
  
  void allumer() {
    on = true;
  }
  
  void eteindre() {
    on = false;
  }
}