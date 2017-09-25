int cibleX;
int cibleY;
float chipX = 0;
float chipY = 0;
float distChipCible;
float distMax;

void setup() {
  size(600, 600);
  frameRate(30);
  cibleX = width / 2;
  cibleY = height / 2;
  distMax = dist(0, 0, width, height);
}

void draw() {
  background(255);
  
  // dessiner la cible
  stroke(255, 165, 0);
  strokeWeight(5);
  line(cibleX - 20, cibleY - 20, cibleX + 20, cibleY + 20);
  line(cibleX - 20, cibleY + 20, cibleX + 20, cibleY - 20);
  
  // calculer la distance entre Chip et la cible
  distChipCible = dist(chipX, chipY, cibleX, cibleY);

  // dessiner Chip

  // le corps
  stroke(0);
  strokeWeight(1);
  fill(191);
  rect(chipX - 35, chipY, 70, 70);

  // les trois LEDs
  // plus Chip ets proche de la cible, plus les couleurs sont brillantes
  colorMode(RGB, distMax, distMax, distMax);
  fill(distMax - distChipCible, 0, 0);
  rect(chipX - 25, chipY + 20, 10, 10);
  fill(0, distMax - distChipCible, 0);
  rect(chipX - 5, chipY + 20, 10, 10);
  fill(0, 0, distMax - distChipCible);
  rect(chipX + 15, chipY + 20, 10, 10);
  colorMode(RGB, 255, 255, 255);

  // les roues
  fill(255);
  ellipse(chipX - 20, chipY + 70, 20, 20);
  ellipse(chipX + 20, chipY + 70, 20, 20);

  // la tête
  fill(191);
  arc(chipX, chipY - 5, 70, 70, -PI, 0, CHORD);

  // la caméra
  fill(63, 0, 0);
  ellipse(chipX, chipY - 20, 20, 20);

  // l'antenne
  strokeWeight(3);
  line(chipX, chipY - 40, chipX, chipY - 80);

  
  // Chip se déplace une unité en direction vers la cible
  chipX += (cibleX - chipX) / distChipCible;
  chipY += (cibleY - chipY) / distChipCible;
}

void mousePressed() {
  cibleX = mouseX;
  cibleY = mouseY;
}