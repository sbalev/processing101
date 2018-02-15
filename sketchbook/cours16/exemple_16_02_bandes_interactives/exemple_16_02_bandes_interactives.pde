Bande[] bandes = new Bande[10];

void setup() {
  size(200, 200);
  for (int i = 0; i < bandes.length; i++) {
    bandes[i] = new Bande();
  }
}

void draw() {
  background(100);
  for (int i = 0; i < bandes.length; i++) {
    bandes[i].bouger();
    bandes[i].rollover(mouseX, mouseY);
    bandes[i].afficher();
  }
}