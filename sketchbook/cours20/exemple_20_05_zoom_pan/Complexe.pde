class Complexe {
  float a; // partie réelle
  float b; // partie imaginaire

  // Constructeurs

  Complexe(float re, float im) {
    a = re;
    b = im;
  }

  Complexe(float re) {
    // On peut appeler un constructeur à partir d'un autre
    this(re, 0);
  }

  Complexe() {
    this(0);
  }

  Complexe(Complexe z) {
    this(z.a, z.b);
  }

  // Représentation sous forme de chaîne de caractères
  String toString() {
    if (b == 0) {
      return "" + a;
    }
    String s = "";
    if (a != 0) {
      s += a;
      if (b > 0) {
        s += "+";
      }
    }
    if (b == -1) {
      s += "-";
    } else if (b != 1) {
      s += b;
    }
    s += "i";
    return s;
  }
  
  // Accesseurs
  
  float re() {
    return a;
  }
  
  float im() {
    return b;
  }
  
  // Comparaisons
  
  boolean egal(float c) {
    return a == c && b == 0;
  }
  
  boolean egal(Complexe z) {
    return a == z.a && b == z.b;
  }
  
  // Addition
  
  Complexe plus(float c) {
    return new Complexe(a + c, b);
  }
  
  Complexe plus(Complexe z) {
    return new Complexe(a + z.a, b + z.b);
  }
  
  // Soustraction
  
  Complexe moins(float c) {
    return plus(-c);
  }
  
  Complexe moins(Complexe z) {
    return new Complexe(a - z.a, b - z.b);
  }
  
  // Multiplication
  
  Complexe mult(float c) {
    return new Complexe(a * c, b * c);
  }
  
  Complexe mult(Complexe z) {
    return new Complexe(a * z.a - b * z.b, a * z.b + b * z.a);
  }
  
  // Module au carré
  float mod2() {
    return a * a + b * b;
  }
  
  // Module
  float mod() {
    return sqrt(mod2());
  }
  
  // Conjugué
  Complexe conj() {
    return new Complexe(a, -b);
  }
  
  // Division
  
  Complexe div(float c) {
    return mult(1 / c);
  }
  
  Complexe div(Complexe z) {
    return mult(z.conj()).div(z.mod2());
  }
  
  // Argument  
  float arg() {
    return atan2(b, a);
  }
  
  // Puissance
  Complexe puissance(int n) {
    float rn = pow(mod(), n);
    float thetan = n * arg();
    return new Complexe(rn * cos(thetan), rn * sin(thetan));
  }
}
