void setup() {
  size(200, 200);
}

void draw() {
  background(255);
  stroke(0);
  line(width / 2, 0, width / 2, height);
  line(0, height / 2, width, height / 2);

  noStroke();
  fill(0);
  if (mouseX < width / 2 && mouseY < height / 2) {
    // quadrant supérieur gauche
    rect(0, 0, width / 2, height / 2);
  } else if (mouseX > width / 2 && mouseY < height / 2) {
    // quadrant supérieur droit
    rect(width / 2, 0, width / 2, height / 2);
  } else if (mouseX < width / 2 && mouseY > height / 2) {
    // quadrant inférieur gauche
    rect(0, height / 2, width / 2, height / 2);
  } else if (mouseX > width / 2 && mouseY > height / 2) {
    // quadrant inférieur droit
    rect(width / 2, height / 2, width / 2, height / 2);
  }
}