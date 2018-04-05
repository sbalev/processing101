Mandelbrot mandel;

void setup() {
  // On ajoute le paramètre P2D qui permet de profiter d'accélération matérielle
  // On passe à une résolution beaucoup plus élevée
  size(960, 720, P2D);
  // On utilise nMax = 300 pour une rendue plus précise
  // Soyons fous, c'est le GPU qui gère
  mandel = new Mandelbrot(-2.5, -1.5, 4, 300);
  mandel.dessiner();
}

void draw() {
  //mandel.zoom(423, 321, 1.01);
  //mandel.dessiner();
  //if (frameCount == 1000) {
  //  float fps = frameCount * 1000.0 / millis();
  //  println(fps, "fps");
  //  noLoop();
  //}
}

void mouseWheel(MouseEvent event) {
  mandel.zoom(mouseX, mouseY, 1 - event.getCount() / 10.0);
  mandel.dessiner();
}

void mouseDragged() {
  if (mouseButton == LEFT) {
    mandel.pan(pmouseX, pmouseY, mouseX, mouseY);
    mandel.dessiner();
  }
}

void mousePressed() {
  if (mouseButton == RIGHT) {
    mandel.switchJulia(mouseX, mouseY);
  }
  mandel.dessiner();
}
