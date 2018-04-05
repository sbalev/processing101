Mandelbrot mandel;
int pressX, pressY;

void setup() {
  size(840, 480);
  mandel = new Mandelbrot(-2.5, -1, 3.5, 100);
  mandel.dessiner();
}

void draw() {
}

void mouseWheel(MouseEvent event) {
  mandel.zoom(mouseX, mouseY, 1 - event.getCount() / 10.0);
  mandel.dessiner();
}

void mousePressed() {
  if (mouseButton == LEFT) {
    pressX = mouseX;
    pressY = mouseY;
  }
}

void mouseReleased() {
  if (mouseButton == LEFT) {
    mandel.pan(pressX, pressY, mouseX, mouseY);
  } else if (mouseButton == RIGHT) {
    mandel.switchJulia(mouseX, mouseY);
  }
  mandel.dessiner();
}
