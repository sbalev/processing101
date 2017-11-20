float chipX;
float chipY;
float couleur = 0;
float vitesse = 1;

void setup() {
  size(400, 400);
  frameRate(30);
  chipX = 35;
  chipY = height / 2;
}

void draw() {
  background(255);

  // dessiner Chip
  // le corps
  stroke(0);
  strokeWeight(1);
  fill(191);
  rect(chipX - 35, chipY, 70, 70);

  // chip k2000
  for (float x = chipX - 30; x < chipX + 30; x += 4) {
    fill(couleur, 0, 0);
    rect(x, chipY + 10, 4, 8);
    couleur = (couleur + 15) % 255;
  }
  couleur += 15;

  // les roues
  stroke(0);
  fill(255);
  ellipse(chipX - 20, chipY + 70, 20, 20);
  ellipse(chipX + 20, chipY + 70, 20, 20);

  // la tête
  fill(191);
  arc(chipX, chipY - 5, 70, 70, -PI, 0, CHORD);

  // la caméra
  fill(0);
  ellipse(chipX, chipY - 20, 20, 20);

  // l'antenne
  strokeWeight(3);
  line(chipX, chipY - 40, chipX, chipY - 80);

  // Chip bouge
  chipX += vitesse;
  if (chipX < 35 || chipX > width - 35) {
    vitesse = -vitesse;
  }
}