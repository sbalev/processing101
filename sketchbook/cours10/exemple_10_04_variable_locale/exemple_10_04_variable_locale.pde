void setup() {
  size(200, 200);
  // la variable x n'est pas utilisable ici.
}

void draw() {
  background(0);
  // Déclaration de la variable locale x.
  int x = 0;
  // x est utilisable dans ce bloc à partir de là.
  // Elle est utilisable dans le bloc du while car
  // ce dernier est imbriqué dans celui de draw.
  while(x < width) {
    stroke(255);
    line(x, 0, x, height);
    x += 5;
  }
}

void mousePressed() {
  // La variable x n'est pas utilisable ici.
  println("Un bouton de la souris est pressé !");
}