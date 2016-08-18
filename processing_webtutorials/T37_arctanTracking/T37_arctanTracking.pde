float cX, cY, largo, rad;

void setup(){
  size(400,400);
  cX = width/2;
  cY = height/2;
  largo = 50;
  rad = 25;
  noStroke();
  rectMode(CENTER);
}

void draw(){
  //background(255);
  fill(255,175);
  rect(width/2,height/2,width,height);
  float angle = atan2(mouseX-cX,mouseY-cY);
  
  pushMatrix();
  translate(cX,cY);
  rotate(-angle);
  
  fill(150,0,200);
  rect(0,largo/2,largo/5,largo);
  ellipse(0,0,largo/5,largo/5);
  translate(0,largo +3/4*rad);
  ellipse(0,0,rad,rad);
  translate(0,rad);
  ellipse(0,0,rad/3,rad/3);
  translate(0,rad/2);
  ellipse(0,0,rad/6,rad/6);
  
  popMatrix();
}
