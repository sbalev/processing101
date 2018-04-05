class Mandelbrot {
  // rectangle du plan complexe qu'on veut afficher sur la fenêtre
  Complexe zMin;
  Complexe zMax;

  int nMax; // nombre maximal d'itérations
  
  boolean julia; // dessinr l'ensemble de Julia ou de Mandelbrot ?
  Complexe juliaC; // la constante c associé à l'ensemble de Julia
  
  PShader shader; // notre nouveau héro

  Mandelbrot(float reMin, float imMin, float largeur, int nMax) {
    float reMax = reMin + largeur;
    // Calculé en fonction de la taille de la fenêtre
    // pour garder la même échelle sur les deux axes
    float imMax = imMin + largeur * height / width;

    zMin = new Complexe(reMin, imMin);
    zMax = new Complexe(reMax, imMax);
    this.nMax = nMax;
    
    julia = false;
    juliaC = new Complexe();
    
    shader = loadShader("mandelbrot.glsl");
    shader.set("size", float(width), float(height));
    shader.set("nMax", nMax);
    setShaderZ();
    setShaderJulia();
  }
  
  void setShaderZ() {
    shader.set("zMin", zMin.re(), zMin.im());
    shader.set("zMax", zMax.re(), zMax.im());
  }
  
  void setShaderJulia() {
    shader.set("julia", julia);
    shader.set("juliaC", juliaC.re(), juliaC.im());
  }

  void dessiner() {
    shader(shader);
    noStroke();
    rect(0, 0, width, height);
  }

  // Transforme un pixel de la fenêtre en point du plan complexe
  Complexe zPlan(int x, int y) {
    float re = map(x, 0, width, zMin.re(), zMax.re());
    float im = map(y, 0, height, zMax.im(), zMin.im());
    return new Complexe(re, im);
  }
  
  void zoom(int x, int y, float factor) {
    Complexe z = zPlan(x, y);
    zMin = z.plus(zMin.moins(z).div(factor));
    zMax = z.plus(zMax.moins(z).div(factor));
    setShaderZ();
  }
  
  void pan(int px, int py, int x, int y) {
    Complexe delta = zPlan(px, py).moins(zPlan(x, y));
    zMin = zMin.plus(delta);
    zMax = zMax.plus(delta);
    setShaderZ();
  }
  
  void switchJulia(int x, int y) {
    if (!julia) {
      juliaC = zPlan(x, y);
    }
    julia = !julia;
    setShaderJulia();
  }
}
