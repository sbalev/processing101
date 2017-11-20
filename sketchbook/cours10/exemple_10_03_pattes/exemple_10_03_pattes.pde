int xDebut = 50;
int xFin = 150;
int y = 80;
int ecart = 10;
int longueur = 20;

size(200, 200);
for(int x = xDebut; x <= xFin; x += ecart) {
  line(x, y, x, y + longueur);
}