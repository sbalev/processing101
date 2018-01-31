// données de la voiture
float x, y;
float vitesse;
color couleur;
float taille;

// fonctionnalités de la voiture

void dessiner() {
  rectMode(CENTER);
  fill(couleur);
  rect(x, y, taille, taille / 2);
}

void bouger() {
  x += vitesse;
  if (x > width) {
    x = 0;
  }
}

void setup() {
  size(400, 400);

  // initialiser la voiture
  x = 0;
  y = height / 2;
  vitesse = 1;
  couleur = color(255, 0, 0);
  taille = 50;
}

void draw() {
  background(0);
  
  dessiner();
  bouger();
}