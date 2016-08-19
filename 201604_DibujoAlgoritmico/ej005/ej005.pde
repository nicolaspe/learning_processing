size(800, 600);
colorMode(HSB);
background(255);
rectMode(CENTER);
noFill();

int total=100;

for (int i=20; i<width-20; i+=30) {
  for (int j=20; j<height-20; j+=30) {
    strokeWeight( map(j,0,height,2.5,0.5) +random(-0.5,0.5));
    pushMatrix();
    translate(i, j);
    float rotacion = map(i, 0, width, 0, PI) +random(-PI/20,PI/20);
    rotate(rotacion);
    for(int k=0; k<10; k++){
      float xoff = random(-2,2);
      float yoff = random(-2,2);
      float ancho= random(10,55);
      stroke( map(j,0,height,0,128) +random(-20,20));
      rect(xoff, yoff, ancho, ancho);
    }
    popMatrix();
  }
}

String date = nf(year(), 4) +nf(month(), 2) +nf(day(), 2) +nf(minute(), 2) +nf(second(), 2);
save("dibujoGrilla_"+date+".png");

