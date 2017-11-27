int r = 25;
int x = r;
int y;
int v = 1;

void setup() {
  size(200, 200);
  y = height / 2;
}

void draw() {
  background(255);
  dessiner(); // 1.
  bouger();   // 2.
  rebondir(); // 3.
}

// Fonction qui affiche une balle.
void dessiner() {
  ellipseMode(RADIUS);
  stroke(0);
  fill(175);
  ellipse(x, y, r, r);    
}

// Fonction qui bouge la balle.
void bouger() {
  x += v;    
}

// Fonction qui fait rebondir la balle.
void rebondir() {
  if (x < r || x > width - r) {
    v = -v;
  }    
}