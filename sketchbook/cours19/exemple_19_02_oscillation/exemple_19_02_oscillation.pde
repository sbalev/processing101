// Un tableau 2D d'objets
Cellule[][] grille;

// Nombre de lignes et de colonnes de la grille
int lignes = 20;
int colonnes = 20;

void setup() {
  size(400, 400);
  grille = new Cellule[lignes][colonnes];
  for (int i = 0; i < lignes; i++) {
    for (int j = 0; j < colonnes; j++) {
      // Instantiation de chaque objet
      grille[i][j] = new Cellule(20 * j, 20 * i, 20, 20, i + j);
    }
  }
}

void draw() {
  background(0);
  for (int i = 0; i < lignes; i++) {
    for (int j = 0; j < colonnes; j++) {
      // Dessiner et faire osciller chaque objet
      grille[i][j].dessiner();
      grille[i][j].osciller();
    }
  }
}
