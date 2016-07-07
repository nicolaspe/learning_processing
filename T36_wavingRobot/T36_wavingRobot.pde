int angle = 0;
int angleIncrement = 5;
int angleLimit = 135;

void setup(){
  size(200,200);
  smooth();
  frameRate(48);
}

void draw(){
  //background(255);
  fill(255,90);
  rect(0,0,width,height);
  pushMatrix();
  translate(50,50);
  drawRobot(angle);
  popMatrix();
  
  angle += angleIncrement;
  if(angle>=angleLimit || angle<0){
    angleIncrement = -angleIncrement;
    angle += angleIncrement;
  }
}

void drawRobot(int angle){
  noStroke();
  fill(200,20,20);
  rect(20,0,38,30);  // head
  rect(14,32,50,50); // body
  drawLeftArm(angle);
  drawRightArm(-angle);
  rect(22,84,16,50); // L leg
  rect(40,84,16,50); // R leg
  fill(222,222,35);
  ellipse(30,12,12,12);  // L eye
  ellipse(47,12,12,12);  // R eye
}

void drawLeftArm(int angle){
  pushMatrix();
  translate(12,32);
  rotate(radians(angle));
  rect(-12,0,12,37);
  popMatrix();
}
void drawRightArm(int angle){
  pushMatrix();
  translate(66,32);
  rotate(radians(angle));
  rect(0,0,12,37);
  popMatrix();
}
