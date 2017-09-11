size(150, 150);
// fond blanc
background(255);

stroke(0);
fill(127);
// contour noir et intérieur gris
rect(10, 10, 100, 100);

stroke(255);
// le contour devient blanc mais l'intérieur ne change pas
rect(20, 20, 100, 100);

stroke(0);
noFill();
// contour noir et pas d'intérieur
rect(30, 30, 100, 100);