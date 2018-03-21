class Chip {
  // Le monde de Chip
  Monde monde;
  // La cellule vers laquelle il se dirige
  int iDest, jDest;

  // le reste des attributs ne change pas
  float x, y;
  float vitesse;
  float largeur;
  color couleur;
    
  Chip(Monde monde, float vitesse, float largeur, color couleur) {
    this.monde = monde;
    iDest = 0;
    jDest = 0;
    x = monde.xColonne(jDest);
    y = monde.yLigne(iDest);
    this.vitesse = vitesse;
    this.largeur = largeur;
    this.couleur = couleur;
  }
  
  void dessiner() {
    // l'unité de mon papier à carreaux
    float u = largeur / 7;
    
    // le corps
    stroke(0);
    strokeWeight(1);
    fill(couleur);
    rectMode(CENTER);
    rect(x, y + 3.5 * u, largeur, largeur);
    
    // les roues
    fill(255);
    ellipseMode(CENTER);
    ellipse(x - 2 * u, y + largeur, 2 * u, 2 * u);
    ellipse(x + 2 * u, y + largeur, 2 * u, 2 * u);
    
    // la tête
    fill(couleur);
    arc(x, y - u / 2, largeur, largeur, -PI, 0, CHORD);
    
    // la caméra
    fill(63, 0, 0);
    ellipse(x, y - 2 * u, 2 * u, 2 * u);
    
    // l'antenne
    strokeWeight(3);
    line(x, y - 4 * u, x, y - 8 * u);
  }
  
  void avancerVers(float cibleX, float cibleY) {
    float d = dist(x, y, cibleX, cibleY);
    if (d >= vitesse) {
      x += vitesse * (cibleX - x) / d;
      y += vitesse * (cibleY - y) / d;
    }
  }
  
  boolean estArrive() {
    float d = dist(x, y, monde.xColonne(jDest), monde.yLigne(iDest));
    return d < vitesse;
  }
  
  boolean tresorTrouve() {
    return estArrive() && monde.contientTresor(iDest, jDest);
  }

  
  void choisirDestination() {
    int[] di = { 1,  0, -1,  0};
    int[] dj = { 0,  1,  0, -1};
    int[] choix = new int[4];
    int nbChoix = 0;
    // parcourir les 4 voisins de la cellule courante
    for (int k = 0; k < 4; k++) {
      // si le voisin est accessibles, mettre son numéro dans le tableau des choix
      if (monde.estAccessible(iDest + di[k], jDest + dj[k])) {
        choix[nbChoix] = k;
        nbChoix++;
      }
    }
    // si nbChoix == 0, Chip est coincé
    if (nbChoix > 0) {
      // choisir au hasard une des possibilités
      int k = choix[int(random(nbChoix))];
      iDest += di[k];
      jDest += dj[k];
    }
  }
  
  void bouger() {
    if (estArrive() && !tresorTrouve()) {
      choisirDestination();
    }
    avancerVers(monde.xColonne(jDest), monde.yLigne(iDest));
  }
}
