class Population {
  Individu[] individus;
  int xStat;

  Population(int taille) {
    individus = new Individu[taille];
    for (int i = 0; i < taille; i++) {
      individus[i] = new Individu();
    }
    individus[0].infecter();
    xStat = 0;
  }

  void dessiner() {
    for (int i = 0; i < individus.length; i++) {
      individus[i].dessiner();
    }
  }

  void bouger() {
    for (int i = 0; i < individus.length; i++) {
      individus[i].bouger();
    }
  }

  void guerir() {
    for (int i = 0; i < individus.length; i++) {
      individus[i].guerir();
    }
  }

  void confiner(float tauxConfinement) {
    for (int i = 0; i < individus.length; i++) {
      if (random(1) < tauxConfinement) {
        individus[i].confiner();
      }
    }
  }

  void contact() {
    for (int i = 0; i < individus.length; i++) {
      for (int j = i + 1; j < individus.length; j++) {
        individus[i].contact(individus[j]);
      }
    }
  }
  
  void dessinerStats() {
    int[] nbParEtat = new int[3];
    for (int i = 0; i < individus.length; i++) {
      nbParEtat[individus[i].etat]++;
    }
    float y1 = map(nbParEtat[INFECTE], 0, individus.length, 100, 0);
    float y2 = map(nbParEtat[INFECTE] + nbParEtat[SAIN], 0, individus.length, 100, 0);
    stroke(COULEURS[INFECTE]);
    line(xStat, 100, xStat, y1);
    stroke(COULEURS[SAIN]);
    line(xStat, y1, xStat, y2);
    stroke(COULEURS[REMIS]);
    line(xStat, y2, xStat, 0);
    xStat++;
  }
}
