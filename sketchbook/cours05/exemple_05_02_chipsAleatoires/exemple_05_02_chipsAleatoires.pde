float couleurCorps;
float largeur;
float hauteurCorps;
float tailleLED;
float niveauLED;
float ledR, ledG, ledB;
float couleurRoue;
float diamRoue;
float hauteurTete;
float rCamera;
float diamCamera;
float hauteurAntenne;

void setup() {
  size(600, 600);
  background(255);
}

void draw() {
}

void mousePressed() {
  // dessiner un Chip aléatoire
  
  // le corps
  stroke(0);
  strokeWeight(1);
  couleurCorps = random(32, 224);
  fill(couleurCorps);
  largeur = random(50, 100);
  hauteurCorps = random(largeur, 3 * largeur / 4);
  rectMode(CORNER);
  rect(mouseX - largeur / 2, mouseY, largeur, hauteurCorps);
  
  // les trois LEDS
  rectMode(CENTER);
  tailleLED = random(10, largeur / 4);
  niveauLED = random(tailleLED, hauteurCorps / 2);
  ledR = random(64,255);
  fill(ledR, 0, 0);
  rect(mouseX - (largeur + tailleLED) / 4, mouseY + niveauLED, tailleLED, tailleLED);
  ledG = random(64,255);
  fill(0, ledG, 0);
  rect(mouseX, mouseY + niveauLED, tailleLED, tailleLED);
  ledB = random(64,255);
  fill(0, 0, ledB);
  rect(mouseX + (largeur + tailleLED) / 4, mouseY + niveauLED, tailleLED, tailleLED);
  
  // les roues
  couleurRoue = random(couleurCorps, 255);
  fill(couleurRoue);
  diamRoue = random(15, largeur / 3);
  ellipse(mouseX - (2 * largeur - diamRoue) / 6, mouseY + hauteurCorps, diamRoue, diamRoue);
  ellipse(mouseX + (2 * largeur - diamRoue) / 6, mouseY + hauteurCorps, diamRoue, diamRoue);
  
  // la tête
  fill(couleurCorps);
  hauteurTete = random(largeur / 4, 3 * largeur / 4);
  arc(mouseX, mouseY - 5, largeur, 2 * hauteurTete, -PI, 0, CHORD);
  
  // la caméra
  rCamera = random(32, 96);
  fill(rCamera, 0, 0);
  diamCamera = random(hauteurTete / 2, 3 * hauteurTete / 4);
  ellipse(mouseX, mouseY - 5 - hauteurTete / 2, diamCamera, diamCamera);
  
  // l'antenne
  strokeWeight(3);
  hauteurAntenne = random(hauteurTete, 2 * hauteurTete);
  line(mouseX, mouseY - 5 - hauteurTete, mouseX, mouseY - 5 - hauteurTete - hauteurAntenne);
}

void keyPressed() {
  background(255);
}