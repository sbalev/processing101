float gravite = 0.1;

class Balle {
  float x;
  float y;
  float v;
  float w;

  Balle(float x, float y, float w) {
    this.x = x;
    this.y = y;
    this.w = w;
    v = 0;
  }

  void bouger() {
    // Ajoute la gravite à la vitesse.
    v += gravite;
    // Ajouter la vitesse à la position
    y += v;
    if (y > height) {
      v = v * -0.95;
      y = height;
    }
  }

  void dessiner() {
    fill(255);
    noStroke();
    ellipse(x, y, w, w);
  }
}