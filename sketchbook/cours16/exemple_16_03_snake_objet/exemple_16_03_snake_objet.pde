Snake snake;

void setup() {
  size(800, 800);
  snake = new Snake(50, color(255, 0, 0), 0, 0);
}

void draw() {
  background(0);
  snake.deplacer(mouseX, mouseY);
  snake.dessiner();
}