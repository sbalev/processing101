class Mandelbrot {
  // rectangle du plan complexe qu'on veut afficher sur la fenêtre
  //Complexe zMin;
  float zMinRe, zMinIm;
  //Complexe zMax;
  float zMaxRe, zMaxIm;

  int nMax; // nombre maximal d'itérations
  
  boolean julia; // dessinr l'ensemble de Julia ou de Mandelbrot ?
  //Complexe juliaC; // la constante c associé à l'ensemble de Julia
  float juliaCRe, juliaCIm;

  Mandelbrot(float reMin, float imMin, float largeur, int nMax) {
    float reMax = reMin + largeur;
    // Calculé en fonction de la taille de la fenêtre
    // pour garder la même échelle sur les deux axes
    float imMax = imMin + largeur * height / width;

    //zMin = new Complexe(reMin, imMin);
    zMinRe = reMin;
    zMinIm = imMin;
    //zMax = new Complexe(reMax, imMax);
    zMaxRe = reMax;
    zMaxIm = imMax;
    
    this.nMax = nMax;
    
    julia = false;
    //juliaC = new Complexe();
    juliaCRe = 0;
    juliaCIm = 0;
  }

  void dessiner() {
    colorMode(HSB, nMax, 1, 1);
    //Complexe zero = new Complexe();
    loadPixels();
    // On calcule z plus rapidement que avec map()
    float dRe = (zMaxRe - zMinRe) / width;
    float dIm = (zMaxIm - zMinIm) / height;
    // Pour chaque pixel (x, y) de la fenêtre
    int i = 0;
    float zIm = zMinIm;
    for (int y = 0; y < height; y++) {
      float zRe = zMinRe;
      for (int x = 0; x < width; x++) {
        // Calculer le nombre complexe correspondant à (x, y)
        //Complexe z = zPlan(x, y);
        // remplacé par zRe += dRe et zIm += dIm;
        // Itérer la suite
        int n;
        if (julia) {
          //n = itererSuite(z, juliaC);
          n = itererSuite(zRe, zIm, juliaCRe, juliaCIm);
        } else {
          //n = itererSuite(zero, z);
          n = itererSuite(0, 0, zRe, zIm);
        }
        // Si la suite n'a pas divergé, colorer le pixel en noir
        // sinon, colorer en fonction du nombre d'itérations
        if (n == nMax) {
          pixels[i] = color(0);
        } else {
          pixels[i] = color(n, 1, 1);
        }
        i++;
        zRe += dRe;
      }
      zIm += dIm;
    }
    updatePixels();
  }

  // Transforme un pixel de la fenêtre en point du plan complexe
  //Complexe zPlan(int x, int y) {
  //  float re = map(x, 0, width, zMin.re(), zMax.re());
  //  float im = map(y, 0, height, zMin.im(), zMax.im());
  //  return new Complexe(re, im);
  //}
  float zPlanRe(int x) {
    return map(x, 0, width, zMinRe, zMaxRe);
  }
  
  float zPlanIm(int y) {
    return map(y, 0, height, zMinIm, zMaxIm);
  }

  // Itère la suite z(0) = z0, z(n+1) = f(z(n)) pendant nMax itérations
  // ou jusqu'à ce qu'elle sorte du cercle de rayon 2
  // Renvoie le nombre d'itérations effectuées
  //int itererSuite(Complexe z0, Complexe c) {
  int itererSuite(float z0Re, float z0Im, float cRe, float cIm) {
    //Complexe z = z0;
    float zRe = z0Re;
    float zIm = z0Im;
    int n = 0;
    //while (n < nMax && z.mod2() < 4) {
    while (n < nMax && zRe * zRe + zIm * zIm < 4) {
      //z = z.mult(z).plus(c);
      float t = zRe * zRe - zIm * zIm + cRe;
      zIm = 2 * zRe * zIm + cIm;
      zRe = t;
      
      n++;
    }
    return n;
  }

  
  void zoom(int x, int y, float factor) {
    //Complexe z = zPlan(x, y);
    float zRe = zPlanRe(x);
    float zIm = zPlanIm(y);
    //zMin = z.plus(zMin.moins(z).div(factor));
    zMinRe = zRe + (zMinRe - zRe) / factor;
    zMinIm = zIm + (zMinIm - zIm) / factor;
    //zMax = z.plus(zMax.moins(z).div(factor));
    zMaxRe = zRe + (zMaxRe - zRe) / factor;
    zMaxIm = zIm + (zMaxIm - zIm) / factor;
  }
  
  void pan(int px, int py, int x, int y) {
    //Complexe delta = zPlan(px, py).moins(zPlan(x, y));
    float deltaRe = zPlanRe(px) - zPlanRe(x);
    float deltaIm = zPlanIm(py) - zPlanIm(y);
    //zMin = zMin.plus(delta);
    zMinRe += deltaRe;
    zMinIm += deltaIm;
    //zMax = zMax.plus(delta);
    zMaxRe += deltaRe;
    zMaxIm += deltaIm;
  }
  
  void switchJulia(int x, int y) {
    if (!julia) {
      //juliaC = zPlan(x, y);
      juliaCRe = zPlanRe(x);
      juliaCIm = zPlanIm(y);
    }
    julia = !julia;
  }
}
