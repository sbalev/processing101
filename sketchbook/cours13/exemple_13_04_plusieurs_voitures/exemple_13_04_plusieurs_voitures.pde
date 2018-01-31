Voiture v1, v2, v3;

void setup() {
  size(400, 400);
  
  v1 = new Voiture(100, height / 4, 5, 255, 30);
  v2 = new Voiture(); // on utilise le constructeur "par défaut" sans arguments
  v3 = new Voiture(50, 3 * height / 4, 3, color(0, 126, 198), 80);
}

void draw() {
  background(0);
  
  v1.dessiner();
  v1.bouger();
  
  v2.dessiner();
  v2.bouger();
  
  v3.dessiner();
  v3.bouger();
}