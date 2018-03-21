// types de cellule
final int VIDE = 0;
final int OBSTACLE = 1;
final int TRESOR = 2;

class Cellule {
  float x, y; // position du centre
  float w, h; // taille
  int type;
  
  Cellule(float x, float y, float w, float h, int type) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.type = type;
  }
  
  void dessiner() {
    if (type == VIDE) {
      fill(255);
    } else if (type == OBSTACLE) {
      fill(0);
    } else {
      fill(255, 200, 50);
    }
    noStroke();
    rectMode(CENTER);
    rect(x, y, w, h);
  }
}
