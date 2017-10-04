void setup() {
  size(200, 200);
  frameRate(30);
}

void draw() {
  background(255);
  rectMode(RADIUS);
  // on utilise frameCount pour colorer le rectangle
  fill(frameCount % 256, 0, 0);
  // le rectangle est centré dans la fenêtre
  // sa taille est determinée par la position de la souris
  rect(width / 2, height / 2, abs(mouseX - width / 2), abs(mouseY - height / 2));
}

void keyPressed() {
  // on affiche la dernière touche
  println(key);
}
