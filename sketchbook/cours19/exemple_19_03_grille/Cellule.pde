class Cellule {
  float x, y; // position
  float w, h; // taille
  int etat;
  
  Cellule(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    etat = 0;
  }
  
  void click(int mx, int my) {
    if (x <= mx && mx < x + w && y <= my && my < y + h) {
      etat = 1 - etat;
    }
  }
  
  void dessiner() {
    stroke(0);
    if (etat == 0) {
      fill(255);
    } else {
      fill(128);
    }
    rect(x, y, w, h);
  }
}
