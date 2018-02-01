class Chip {
  float x, y;
  float vitesse;
  float largeur;
  color couleur;
  Led ledR, ledG, ledB;
  int ledAllumee;
  
  Chip(float x, float y, float vitesse, float largeur, color couleur) {
    this.x = x;
    this.y = y;
    this.vitesse = vitesse;
    this.largeur = largeur;
    this.couleur = couleur;
    
    // instancier les LEDs
    ledR = new Led(largeur / 7, color(255, 0, 0));
    ledG = new Led(largeur / 7, color(0, 255, 0));
    ledB = new Led(largeur / 7, color(0, 0, 255));
    ledAllumee = 0;
    ledR.allumer();
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
    
    // les LEDs
    ledR.dessiner(x - 2 * u, y + 2.5 * u);
    ledG.dessiner(x, y + 2.5 * u);
    ledB.dessiner(x + 2 * u, y + 2.5 * u);
  }
  
  void avancerVers(float cibleX, float cibleY) {
    float d = dist(x, y, cibleX, cibleY);
    if (d > vitesse) {
      x += vitesse * (cibleX - x) / d;
      y += vitesse * (cibleY - y) / d;
    }
  }
  
  void avancerVers(Cible cible) {
    avancerVers(cible.x, cible.y);
  }
  
  void changerLed() {
    if (ledAllumee == 0) {
      ledR.eteindre();
      ledG.allumer();
      ledAllumee = 1;
    } else if (ledAllumee == 1) {
      ledG.eteindre();
      ledB.allumer();
      ledAllumee = 2;
    } else if (ledAllumee == 2) {
      ledB.eteindre();
      ledR.allumer();
      ledAllumee = 0;
    }
  }
}