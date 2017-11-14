// ATTENTION : Ceci est un mauvais exemple. Ne faites jamais ça !

int xDebut; // Où est-ce qu'on commence ?
int xFin; // Où est-ce qu'on s'arrête ?
int x;
int y = 80;
int ecart;
int longueur = 40;

void setup() {
  size(200, 200);
  xDebut = 0;
  xFin = width;
}

void draw() {
  background(255);
  stroke(0);
  
  // La position horizontale de la souris contrôle l'écart entre les pattes
  ecart = mouseX / 2;
  
  // Pattes
  x = xDebut;
  while (x <= xFin) {
    line(x, y, x, y + longueur);
    x += ecart;
  }
}