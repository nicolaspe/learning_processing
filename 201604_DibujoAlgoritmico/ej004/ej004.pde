size(400, 400);
colorMode(HSB);
background(255);
rectMode(CENTER);
noFill();

int total=40;

for(int i=0; i<total; i++){
  float ancho = random(20, 300);
  float alto  = random(20, 300);
  float xoff  = random(-20, 20);
  float yoff  = random(-20, 20);
  rect(width/2+xoff, height/2+yoff, ancho, alto);
}

String date = nf(year(),4) +nf(month(),2) +nf(day(),2) +nf(minute(),2) +nf(second(),2);
save("dibujoVeraMolnar_"+date+".png");
