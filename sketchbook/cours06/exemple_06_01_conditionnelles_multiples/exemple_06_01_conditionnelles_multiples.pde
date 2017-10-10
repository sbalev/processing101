void setup() {
  size(200, 200);
}

void draw() {
  if (mouseX < width / 3) {
    // la souris est dans le tiers gauche de la fanêtre
    background(255);
  } else if (mouseX < 2 * width / 3) {
    // la souris est dans le tiers du millieu
    background(127);
  } else {
    // la souris est dans le tiers droit
    background(0);
  }

  // visualiser les tiers
  stroke(255, 0, 0);
  line(width / 3, 0, width / 3, height);
  line(2 * width / 3, 0, 2 * width / 3, height);
}