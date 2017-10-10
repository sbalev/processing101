float r = 0;
float b = 0;
float g = 0;

void setup() {
  size(200, 200);
}

void draw() {
  background(r, g, b);
  stroke(0);

  line(width / 2, 0, width / 2, height);
  line(0, height / 2, width, height / 2);

  if (mouseX > width / 2) {
    r++;
  } else {
    r--;
  }

  if (mouseY > height / 2) {
    b++;
  } else {
    b--;
  }

  if (mousePressed) {
    g++;
  } else {
    g--;
  }

  r = constrain(r, 0, 255);
  g = constrain(g, 0, 255);
  b = constrain(b, 0, 255);
}