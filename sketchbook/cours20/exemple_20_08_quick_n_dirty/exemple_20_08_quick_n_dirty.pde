Mandelbrot mandel;

void setup() {
  size(840, 480);
  mandel = new Mandelbrot(-2.5, -1, 3.5, 100);
}

void draw() {
  mandel.zoom(424, 193, 1.1);
  mandel.dessiner();
  if (frameCount == 100) {
    float fps = frameCount * 1000.0 / millis();
    println(fps, "fps");
    noLoop();
  }
}
