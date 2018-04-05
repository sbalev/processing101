#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

// Variables communes pour tous les pixels
// C'est ici que les valeurs passées par shader.set(...) sont stockées
uniform vec2 size;
uniform int nMax;
uniform vec2 zMin;
uniform vec2 zMax;
uniform bool julia;
uniform vec2 juliaC;

// Conversion HSV -> RGB
// Sur le GPU on représente les couleurs uniquement en RGB
// et il faut convertir manuellement.
vec3 hsv2rgb(vec3 c) {
  vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
  vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
  return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}


int itererSuite(vec2 z0, vec2 c) {
  vec2 z = z0;
  int n = 0;
  while (n < nMax && dot(z, z) < 4.0) {
    z = vec2(z.x * z.x - z.y * z.y, 2 * z.x * z.y) + c;
    n++;
  }
  return n;
}

// Ce programme s'exécute par les unités du GPU
// pour chaque pixel de la fenêtre.
// gl_FragCoord contient les coordonnées du pixel.
// On écrit dans gl_FragColor la couleur calculée
void main() {
  // Calculer le nombre complexe correspondant à (x, y)
  vec2 z = zMin + (zMax - zMin) * gl_FragCoord.xy / size;
  int n;
  // Itérer la suite
  if (julia) {
    n = itererSuite(z, juliaC);
  } else {
    n = itererSuite(vec2(0.0), z);
  }
  // Si la suite n'a pas divergé, colorer le pixel en noir
  // sinon, colorer en fonction du nombre d'itérations
  // La couleur du pixel est un vecteur de 4 éléments (rgba)
  // entre 0 et 1
  if (n == nMax) {
    gl_FragColor = vec4(0.0, 0.0, 0.0, 1.0);
  } else {
    gl_FragColor = vec4(hsv2rgb(vec3(float(n) / nMax, 1.0, 1.0)), 1.0);
  }
}

