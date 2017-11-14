int xDebut = 50; // Où est-ce qu'on commence ?
int xFin = 150; // Où est-ce qu'on s'arrête ?
int x;
int y = 80;
int ecart = 10;
int longueur = 40;

size(200, 200);
background(255);
stroke(0);

// Pattes
x = xDebut;
while (x <= xFin) {
  line(x, y, x, y + longueur);
  x += ecart;
}