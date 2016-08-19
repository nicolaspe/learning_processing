size(851,315);
colorMode(HSB);
background(255);

for(int i=0; i<width; i+=8){
  strokeWeight(map(i,0,width,3,0.5));
  stroke( map(i,0,width,0,255), random(190,230), 240 );
  line(i, 0, i/3, height);
  line(i, height, i/3, 0);
  line(width-i, 0, width-i/3, height);
  line(width-i, height, width-i/3, 0);
}

String date = nf(year(),4) +nf(month(),2) +nf(day(),2) +nf(minute(),2) +nf(second(),2);
save("dibujo_"+date+".png");
