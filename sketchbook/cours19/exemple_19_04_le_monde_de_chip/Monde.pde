class Monde {
  Cellule[][] cellules;
  int lignes, colonnes;

  Monde(float x, float y, float w, float h, int lignes, int colonnes, float pObstacle) {
    this.lignes = lignes;
    this.colonnes = colonnes;
    cellules = new Cellule[lignes][colonnes];

    float wCellule = w / colonnes;
    float hCellule = h / lignes;
    for (int i = 0; i < lignes; i++) {
      for (int j = 0; j < colonnes; j++) {
        float xCellule = x + wCellule * (j + 0.5);
        float yCellule = y + hCellule * (i + 0.5);
        
        // le type de la cellule est OBSTACLE avec probabilité pObstacle
        // et VIDE avec probabilité 1 - pObstacle
        int type = VIDE;
        if (random(1) < pObstacle) {
          type = OBSTACLE;
        }
        cellules[i][j] = new Cellule(xCellule, yCellule, wCellule, hCellule, type);
      }
    }
    
    // s'assurer que la cellule (0, 0) est vide, c'est là où Chip démarre
    cellules[0][0].type = VIDE;
    
    // cacher un trésor quelque part
    int iTresor = int(random(1, lignes));
    int jTresor = int(random(1, colonnes));
    cellules[iTresor][jTresor].type = TRESOR;
  }

  void dessiner() {
    for (int i = 0; i < lignes; i++) {
      for (int j = 0; j < colonnes; j++) {
        cellules[i][j].dessiner();
      }
    }
  }
  
  float yLigne(int i) {
    return cellules[i][0].y;
  }
  
  float xColonne(int j) {
    return cellules[0][j].x;
  }
  
  boolean estDedans(int i, int j) {
    return 0 <= i && i < lignes && 0 <= j && j < colonnes;
  }
  
  boolean estAccessible(int i, int j) {
    return estDedans(i, j) && cellules[i][j].type != OBSTACLE;
  }
  
  boolean contientTresor(int i, int j) {
    return estDedans(i, j) && cellules[i][j].type == TRESOR;
  }
}
