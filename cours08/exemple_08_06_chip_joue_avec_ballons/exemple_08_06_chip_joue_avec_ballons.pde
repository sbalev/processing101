// Variables de Chip
float chipX, chipY;
float antenneLongueur = 10;
float antenneAngle = -HALF_PI;

// Variables du ballon
float ballonRayon = 20;
float ballonX, ballonY;
color ballonCouleur = color(random(256), random(256), random(256), 127);
float ballonVitesse = 0.5;

// Variables du jeu
int score = 0;

// Variables utilsées pour stocker des résultats intermédiaires
float antenneX, antenneY;
boolean ballonCreve;

void setup() {
  size(400, 400);
  
  // initialisation des variables qui dépendent de width et height
  chipX = width / 2;
  chipY = height - 100;
  ballonX = random(ballonRayon, width - ballonRayon);
  ballonY = height;
}

void draw() {
  background(255);

  // Dessiner Chip
  // le corps
  stroke(0);
  strokeWeight(1);
  fill(191);
  rect(chipX - 35, chipY, 70, 70);

  // bouton UP
  fill(65, 105, 255);
  rect(chipX - 10, chipY + 5, 20, 20);
  if (chipX - 10 < mouseX && mouseX < chipX + 10 && chipY + 5 < mouseY && mouseY < chipY + 25) {
    antenneLongueur++;
  }

  // bouton DOWN
  fill(255, 215, 0);
  rect(chipX - 10, chipY + 45, 20, 20);
  if (chipX - 10 < mouseX && mouseX < chipX + 10 && chipY + 45 < mouseY && mouseY < chipY + 65) {
    antenneLongueur--;
  }

  // bouton LEFT
  fill(50, 205, 50);
  rect(chipX - 30, chipY + 25, 20, 20);
  if (chipX - 30 < mouseX && mouseX < chipX - 10 && chipY + 25 < mouseY && mouseY < chipY + 45) {
    antenneAngle -= radians(0.5);
  }

  // bouton RIGHT
  fill(220, 20, 60);
  rect(chipX + 10, chipY + 25, 20, 20);
  if (chipX + 10 < mouseX && mouseX < chipX + 30 && chipY + 25 < mouseY && mouseY < chipY + 45) {
    antenneAngle += radians(0.5);
  }

  // les roues
  ellipseMode(CENTER);
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
  antenneLongueur = constrain(antenneLongueur, 10, dist(0, 0, chipX, chipY - 40));
  antenneAngle = constrain(antenneAngle, -PI, 0);
  // coordonnées du bout de lantenne
  antenneX = chipX + antenneLongueur * cos(antenneAngle);
  antenneY = chipY - 40 + antenneLongueur * sin(antenneAngle);
  strokeWeight(3);
  line(chipX, chipY - 40, antenneX, antenneY);

  // dessiner le ballon
  ballonY -= ballonVitesse;
  noStroke();
  fill(ballonCouleur);
  ellipseMode(RADIUS);
  ellipse(ballonX, ballonY, ballonRayon, ballonRayon);
  stroke(0);
  strokeWeight(1);
  line(ballonX, ballonY + ballonRayon, ballonX, ballonY + 2 * ballonRayon);

  // Chip a-t-il crevé le ballon ?
  ballonCreve = dist(ballonX, ballonY, antenneX, antenneY) < ballonRayon;
  if (ballonCreve) {
    score++;
  }
  // si le balon est crevé ou hors de portée, on'en fait un nouveau
  if (ballonCreve || ballonY < 0) {
    ballonX = random(ballonRayon, width - ballonRayon);
    ballonY = height;
    ballonCouleur = color(random(256), random(256), random(256), 127);
    // le nouveau ballon est plus rapide
    ballonVitesse += 0.025;
    // ... et plus petit
    ballonRayon -= 0.1;
  }
  
  // affichage
  fill(0);
  textAlign(LEFT);
  text("Score " + score, 20, 20);
  textAlign(RIGHT);
  // le jeu dure 2 min
  if (millis() < 120000) {
    text("Time " + millis() / 1000, width - 20, 20);
  } else {
    text("Game over", width - 20, 20);
    noLoop();
  }
}