class Chronometre {
  int start;
  int tempsTotal;
  
  Chronometre(int tempsTotal) {
    start = millis();
    this.tempsTotal = tempsTotal;
  }
  
  void lancer() {
    start = millis();
  }
  
  boolean estTermine() {
    return millis() - start > tempsTotal;
  }
}