class Bande {
  float x;
  float v;
  float w;
  boolean mouse;
  
  Bande() {
    x = 0;
    v = random(1);
    w = random(10, 30);
    mouse = false;
  }
  
  void afficher() {
    if(mouse) {
      fill(255);
    } else {
      fill(255, 100);
    }
    noStroke();
    rectMode(CORNER);
    rect(x, 0, w, height);
  }
  
  void bouger() {
    x += v;
    if(x > width) x = -w;
  }
  
  void rollover(float mx, float my) {
    mouse = (mx > x && mx < x+w);
  }
}