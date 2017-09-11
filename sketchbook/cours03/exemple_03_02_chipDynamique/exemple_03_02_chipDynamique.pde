// setup() s'exécute en premier une seule fois
// size() doit toujours être la première instruction
void setup() {
  size(400, 400);
}

// draw() boucle en continu jusqu'à ce qu'on ferme la fenêtre
void draw() {
  background(255);
  strokeWeight(1);

  // le corps
  fill(191);
  rect(165, 200, 70, 70);

  // les trois LEDs
  fill(255, 0, 0);
  rect(175, 220, 10, 10);
  fill(0, 255, 0);
  rect(195, 220, 10, 10);
  fill(0, 0, 255);
  rect(215, 220, 10, 10);

  // les roues
  fill(255);
  ellipse(180, 270, 20, 20);
  ellipse(220, 270, 20, 20);

  // la tête
  fill(191);
  arc(200, 195, 70, 70, -PI, 0, CHORD);

  // la caméra
  fill(63, 0, 0);
  ellipse(200, 180, 20, 20);

  // l'antenne
  strokeWeight(3);
  line(200, 160, 200, 120);
}