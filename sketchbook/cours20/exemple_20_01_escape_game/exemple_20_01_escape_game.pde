// rectangle du plan complexe qu'on veut afficher sur la fenêtre
Complexe zMin = new Complexe(-2.1, -2.1);
Complexe zMax = new Complexe(2.1, 2.1);

int nMax = 100; // nombre maximal d'itérations

Complexe c;
Complexe z;
int n;

int xFenetre(float re) {
  return int(map(re, zMin.re(), zMax.re(), 0, width));
}

int yFenetre(float im) {
  return int(map(im, zMin.im(), zMax.im(), height, 0));
}

void setup() {
  size(400, 400);
  background(255);
  
  // dessiner les axes
  int x0 = xFenetre(0);
  int y0 = yFenetre(0);
  stroke(0);
  line(0, y0, width, y0);
  line(x0, 0, x0, height);
  
  // dessiner un cercle de rayon 2
  int x2 = xFenetre(2);
  int d = 2 * (x2 - x0);
  noFill();
  ellipse(x0, y0, d, d);
  
  // Générer un c aléatoire
  c = new Complexe(random(-1, 1), random(-1, 1));
  fill(0);
  textAlign(LEFT, TOP);
  textSize(12);
  text("c = " + c.toString(), 0, 0);
  
  // z(0) = 0
  n = 0;
  z = new Complexe();
}

void draw() {
  // z(n+1) = z(n)^2 + c
  Complexe zSuiv = z.mult(z).plus(c);
  
  // tracer une ligne entre z(n) et z(n+1)
  stroke(255, 0, 0);
  line(xFenetre(z.re()), yFenetre(z.im()), xFenetre(zSuiv.re()), yFenetre(zSuiv.im()));
  
  n++;
  z = zSuiv;
  
  if (n == nMax || z.mod() > 2) {
    println(n);
    noLoop();
  }
}
