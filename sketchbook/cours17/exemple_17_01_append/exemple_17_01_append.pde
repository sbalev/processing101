Balle[] balles = new Balle[1];

void setup() {
  size(200, 200);
  frameRate(30);
  balles[0] = new Balle(50, 0, 10);
}

void draw() {
  background(100);
  for (int i = 0; i < balles.length; i++) {
    balles[i].bouger();
    balles[i].dessiner();
  }
}

void mousePressed() {
  Balle b = new Balle(mouseX, mouseY, 10);
  balles = (Balle[]) append(balles, b);
  // Voici la fonction append() qui ajoute un élément (ici b) à la fin d'un tableau donné
  // (ici balles). Il faut faire très attention à remplacer l'ancien tableau (qui n'a pas
  // changé de taille) par le nouveau créé par append() et renvoyé en résultat, ce qui
  // explique le signe = utilisé. De plus si les éléments du tableau sont des objets,
  // il faut re-préciser le type du tableau avec une projection (plus souvent appelée "cast"), 
  // en plaçant ce type entre parenthèses après le signe =.
}