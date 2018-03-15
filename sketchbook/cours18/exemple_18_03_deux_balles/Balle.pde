class Balle {
  float r;      // Rayon
  float x, y;   // Position
  float vx, vy; // Vitesse
  
  Balle(float r) {
    this.r = r;
    x = random(width);
    y = random(height);
    vx = random(-5, 5);
    vy = random(-5, 5);
  }
  
  void bouger() {
    x += vx;
    y += vy;
    if (x < 0 || x > width) {
      vx *= -1;
    }
    if (y < 0 || y > height) {
      vy *= -1;
    }
  }
  
  void dessiner() {
    stroke(255);
    fill(100, 50);
    ellipse(x, y, 2 * r, 2 * r);
  }
}