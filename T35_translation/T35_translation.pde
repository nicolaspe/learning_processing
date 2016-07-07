void setup(){
  size(200,200);
  background(255);
  noStroke();
  
  // Original rectangle
  fill(200,200,0);
  rect(20,20,40,40);
  
  // Coordinate displacement (translucent red)
  fill(255,0,0,128);
  rect(20+60,20+60,40,40);
  
  // Translation (translucent blue)
  fill(0,0,255,128);
  pushMatrix();
  translate(60,60);
  //rotate(radians(45));
  //scale(2.0);
  rect(20,20,40,40);
  popMatrix();
}

