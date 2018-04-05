void setup() {
  size(400, 400);
}

void draw() {
  // Processing, passe-moi les pixels, j'ai besoin de leur parler
  loadPixels();

  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      float d = dist(x, y, mouseX, mouseY);
      int i = y * width + x;
      pixels[i] = color(d);
    }
  }

  // J'ai fini, tu peux les récupérer et les dessiner
  updatePixels();
}
