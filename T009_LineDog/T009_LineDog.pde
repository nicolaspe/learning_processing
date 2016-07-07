float l = 10; // largo de linea
float dx = 0;
float dy = 0;

void setup(){
  size(200,200);
  strokeWeight(8);
  stroke(0,210,210);
}

void draw(){
  dx = mouseX - pmouseX;
  dy = mouseY - pmouseY;
  float mod = sqrt(dx*dx+dy*dy);
  dx = dx/mod*l;
  dy = dy/mod*l;
  frameRate(24);
  background(128);
  line(mouseX,mouseY,mouseX-dx,mouseY-dy);
}
