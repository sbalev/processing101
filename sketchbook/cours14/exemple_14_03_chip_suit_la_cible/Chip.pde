class Chip {
  float x, y;
  float vitesse;
  float largeur;
  color couleur;
  
  Chip(float x, float y, float vitesse, float largeur, color couleur) {
    this.x = x;
    this.y = y;
    this.vitesse = vitesse;
    this.largeur = largeur;
    this.couleur = couleur;
  }
  
  void dessiner() {
    // l'unité de mon papier à carreaux
    float u = largeur / 7;
    
    // le corps
    stroke(0);
    strokeWeight(1);
    fill(couleur);
    rectMode(CENTER);
    rect(x, y + 3.5 * u, largeur, largeur);
    
    // les roues
    fill(255);
    ellipseMode(CENTER);
    ellipse(x - 2 * u, y + largeur, 2 * u, 2 * u);
    ellipse(x + 2 * u, y + largeur, 2 * u, 2 * u);
    
    // la tête
    fill(couleur);
    arc(x, y - u / 2, largeur, largeur, -PI, 0, CHORD);
    
    // la caméra
    fill(63, 0, 0);
    ellipse(x, y - 2 * u, 2 * u, 2 * u);
    
    // l'antenne
    strokeWeight(3);
    line(x, y - 4 * u, x, y - 8 * u);
  }
  
  void avancerVers(float cibleX, float cibleY) {
    float d = dist(x, y, cibleX, cibleY);
    if (d > vitesse) {
      x += vitesse * (cibleX - x) / d;
      y += vitesse * (cibleY - y) / d;
    }
  }
}