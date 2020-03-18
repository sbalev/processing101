// Ce code accompagne la vidéo : https://youtu.be/21-5d9BOAh8

Population pop;

void setup() {
  pixelDensity(displayDensity());
  size(1000, 800);
  pop = new Population(200);
  background(255);
}

void draw() {
  noStroke();
  fill(255);
  rect(0, 100, width, height - 100);
  pop.dessiner();
  pop.bouger();
  pop.contact();
  pop.guerir();
  if (frameCount % 5 == 0) {
    pop.dessinerStats();
  }
  /*if (frameCount == 600) {
   pop.confiner(0.9);
   stroke(0);
   line(pop.xStat, 100, pop.xStat, 0);
   }*/
}
