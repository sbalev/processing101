Snake leader;
Snake[] followers = new Snake[10];

void setup() {
  size(800, 800);
  leader = new Snake(50, color(255, 0, 0), 0, 0, 0);
  for (int i = 0; i < followers.length; i++) {
    followers[i] = new Snake(int(random(20, 80)), 
      color(random(255), random(255), random(255)), random(2, 10), 
      random(width), random(height));
  }
}

void draw() {
  background(0);
  leader.deplacer(mouseX, mouseY);
  leader.dessiner();

  for (int i = 0; i < followers.length; i++) {
    followers[i].avancerVers(leader.getXQueue(), leader.getYQueue());
    followers[i].dessiner();
  }
}