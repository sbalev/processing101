class Snake {
  int taille;
  color couleur;
  float vitesse;
  float[] xpos;
  float[] ypos;
  
  Snake(int taille, color couleur, float vitesse, float x0, float y0) {
    this.taille = taille;
    this.couleur = couleur;
    this.vitesse = vitesse;
    
    xpos = new float[taille];
    ypos = new float[taille];
    for (int i = 0; i < taille; i++) {
      xpos[i] = x0;
      ypos[i] = y0;
    }
  }
  
  void dessiner() {
    noStroke();
    for (int i = 0; i < taille; i++) {
      fill(lerpColor(color(255), couleur, i / (taille - 1.0)));
      ellipse(xpos[i], ypos[i], i, i);
    }
  }
  
  // modificateurs
  void deplacer(float x, float y) {
    for (int i = 0; i < taille - 1; i++) {
      xpos[i] = xpos[i + 1];
      ypos[i] = ypos[i + 1];
    }
    xpos[taille - 1] = x;
    ypos[taille - 1] = y;
  }
  
  void avancerVers(float x, float y) {
    float xTete = xpos[taille - 1];
    float yTete = ypos[taille - 1];
    float d = dist(xTete, yTete, x, y);
    float vx = vitesse * (x - xTete) / d;
    float vy = vitesse * (y - yTete) / d;
    deplacer(xTete + vx, yTete + vy);
  }
  
  // accesseurs
  float getXTete() {
    return xpos[taille - 1];
  }
  
  float getYTete() {
    return ypos[taille - 1];
  }
  
  float getXQueue() {
    return xpos[0];
  }
  
  float getYQueue() {
    return ypos[0];
  }
}