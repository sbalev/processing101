class Cellule {
  float x, y; // position
  float w, h; // taille
  float alpha; // angle pour l'oscillation
  
  Cellule(float x, float y, float w, float h, float alpha) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.alpha = alpha;
  }
  
  void dessiner() {
    noStroke();
    fill(map(sin(alpha), -1, 1, 0, 255));
    rect(x, y, w, h);
  }
  
  void osciller() {
    alpha += 0.02;
  }
}
