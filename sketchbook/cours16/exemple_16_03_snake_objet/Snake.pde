class Snake {
  int taille;
  color couleur;
  float[] xpos;
  float[] ypos;
  
  Snake(int taille, color couleur, float x0, float y0) {
    this.taille = taille;
    this.couleur = couleur;
    
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
  
  void deplacer(float x, float y) {
    for (int i = 0; i < taille - 1; i++) {
      xpos[i] = xpos[i + 1];
      ypos[i] = ypos[i + 1];
    }
    xpos[taille - 1] = x;
    ypos[taille - 1] = y;
  }
}