Goutte[] gouttes = new Goutte[1000];
int totalGouttes = 0;

void setup() {
  size(400, 400);
  background(0);
}

void draw() {
  background(255);

  gouttes[totalGouttes] = new Goutte();
  totalGouttes++;
  if (totalGouttes >= gouttes.length) {
    totalGouttes = 0;
  }

  for (int i = 0; i < totalGouttes; i++) {
    gouttes[i].dessiner();
    gouttes[i].bouger();
  }
}