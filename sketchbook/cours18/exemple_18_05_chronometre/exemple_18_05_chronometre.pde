int start;
int tempsTotal = 5000;

void setup() {
  size(200, 200);
  background(0);
  start = millis();
}

void draw() {
  float tempsEcoule = millis() - start;
  if (tempsEcoule > tempsTotal) {
    background(random(255));
    start = millis();
  }
}