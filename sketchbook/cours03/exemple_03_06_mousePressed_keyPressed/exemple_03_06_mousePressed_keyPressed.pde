void setup() {
  size(400, 400);
  background(255);
}

void draw() {
  // rien ne se passe ici
}

// un cercle est dessiné à chaque clic de souris
void mousePressed() {
  fill(127);
  ellipse(mouseX, mouseY, 20, 20);
}

// la fenêtre est nettoyée lorsque l'utilisateur appuie sur une touche
void keyPressed() {
  background(255);
}