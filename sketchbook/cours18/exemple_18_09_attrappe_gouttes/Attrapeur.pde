class Attrapeur {
  float r;    // Rayon
  float x, y; // Position
  
  Attrapeur(float r) {
    this.r = r;
    x = 0;
    y = 0;
  }
  
  void placer(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void dessiner() {
    stroke(0);
    fill(175);
    ellipse(x, y, 2 * r, 2 * r);
  }
  
  boolean intersecte(Goutte goutte) {
    return dist(x, y, goutte.x, goutte.y) < r + goutte.r;
  }
}