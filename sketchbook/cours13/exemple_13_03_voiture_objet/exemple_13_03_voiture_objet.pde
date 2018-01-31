Voiture maVoiture;

void setup() {
  size(400, 400);
  
  // initialiser la voiture
  maVoiture = new Voiture();
}

void draw() {
  background(0);
  
  maVoiture.dessiner();
  maVoiture.bouger();
}