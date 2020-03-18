final int SAIN = 0;
final int INFECTE = 1;
final int REMIS = 2;

final int TEMPS_INFECTION = 500;

final color[] COULEURS = {
  color(174, 239, 252),
  color(239, 51, 64),
  color(117, 59, 189)
};

class Individu {
  float r;
  float x, y;
  float vx, vy;
  int etat;
  int tempsRestant;
  
  Individu() {
    r = 5;
    x = random(width);
    y = random(100 + 2 * r, height);
    float alpha = random(TWO_PI);
    vx = cos(alpha);
    vy = sin(alpha);
    etat = SAIN;
  }
  
  void dessiner() {
    noStroke();
    fill(COULEURS[etat]);
    ellipseMode(RADIUS);
    ellipse(x, y, r, r);
  }
  
  void bouger() {
    x += vx;
    y += vy;
    if (x < 0 || x > width) {
      vx = -vx;
    }
    if (y < 100 + 2 * r || y > height) {
      vy = -vy;
    }
  }
  
  void infecter() {
    if (etat == SAIN) {
      etat = INFECTE;
      tempsRestant = TEMPS_INFECTION;
    }
  }
  
  void contact(Individu autre) {
    float d = dist(x, y, autre.x, autre.y);
    if (d < r + autre.r) {
      if (etat == INFECTE) {
        autre.infecter();
      } else if (autre.etat == INFECTE) {
        infecter();
      }
    }
  }
  
  void guerir() {
    if (etat == INFECTE) {
      tempsRestant--;
      if (tempsRestant == 0) {
        etat = REMIS;
      }
    }
  }
  
  void confiner() {
    vx = 0;
    vy = 0;
  }
}
