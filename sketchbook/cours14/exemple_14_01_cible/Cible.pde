class Cible {
  float x, y;
  float taille;
  color couleur;
  
  Cible(float x, float y, float taille, color couleur) {
    this.x = x;
    this.y = y;
    this.taille = taille;
    this.couleur = couleur;
  }
  
  void dessiner() {
    stroke(couleur);
    strokeWeight(taille / 10);
    line(x - taille / 2, y - taille / 2, x + taille / 2, y + taille / 2);
    line(x - taille / 2, y + taille / 2, x + taille / 2, y - taille / 2);    
  }
  
  void deplacer(float nouveauX, float nouveauY) {
    x = nouveauX;
    y = nouveauY;
  }
}