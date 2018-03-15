Chronometre chrono;

void setup() {
  size(200, 200);
  background(0);
  chrono = new Chronometre(5000);
  chrono.lancer();
}

void draw() {
  if (chrono.estTermine()) {
    background(random(255));
    chrono.lancer();
  }
}