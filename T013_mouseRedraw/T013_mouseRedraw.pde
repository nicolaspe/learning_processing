void setup(){
  size(200,200);
  noLoop();
}

void draw(){
  background(204);
  line(mouseX,0,mouseX,200);
  line(0,mouseY,200,mouseY);
}

void mousePressed(){
  redraw();
}
