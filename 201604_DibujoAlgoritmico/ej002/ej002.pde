size(851,315);
colorMode(HSB);
background(240,200,255);

/*strokeWeight(4);
point(200,100);
strokeWeight(2);
point(200,120);*/

for(int i=0; i<5000; i++){
  //println(i);
  stroke(random(180,250),255,random(255));
  strokeWeight(random(1,2));
  line(random(width),random(height), random(width),random(height));
}
String date = nf(year(),4) +nf(month(),2) +nf(day(),2) +nf(minute(),2) +nf(second(),2);
save("dibujolin_"+date+".png");
