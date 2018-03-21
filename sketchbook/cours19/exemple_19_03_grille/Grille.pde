class Grille {
  Cellule[][] cellules;
  int lignes, colonnes;
  
  Grille(int lignes, int colonnes) {
    this.lignes = lignes;
    this.colonnes = colonnes;
    cellules = new Cellule[lignes][colonnes];
    
    float w = float(width) / colonnes;
    float h = float(height) / lignes;
    for (int i = 0; i < lignes; i++) {
      for (int j = 0; j < colonnes; j++) {
        cellules[i][j] = new Cellule(w * j, h * i, w, h);
      }
    }
  }
  
  void dessiner() {
    for (int i = 0; i < lignes; i++) {
      for (int j = 0; j < colonnes; j++) {
        cellules[i][j].dessiner();
      }
    }
  }

  void click(int mx, int my) {
    for (int i = 0; i < lignes; i++) {
      for (int j = 0; j < colonnes; j++) {
        cellules[i][j].click(mx, my);
      }
    }
  }
}
