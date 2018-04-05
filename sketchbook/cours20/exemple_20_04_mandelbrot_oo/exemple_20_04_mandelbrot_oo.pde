Mandelbrot mandel;

void setup() {
  size(840, 480);
  mandel = new Mandelbrot(-2.5, -1, 3.5, 100);
  int start = millis();
  mandel.dessiner();
  int stop = millis();
  println("Image rendue en", stop - start, "millisecondes");
}
