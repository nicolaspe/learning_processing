int frame = 0;
boolean cur = false;

void setup(){
  size(400,400);
  noCursor();
}
void draw(){
  if(frame==120){
    noLoop();
    background(0);
  } else {
    background(204);
    fill(255,0,0);
    ellipse(mouseX,mouseY,10,10);
    fill(0);
    line(mouseX,0,mouseX,width);
    line(0,mouseY,height,mouseY);
    frame++;
  }
}

void mousePressed(){
  loop();
  frame = 0;
}
void keyPressed(){
  if(key=='c'||key=='C'){ cursor(); }
  else if(key=='z'||key=='Z'){ cursor(WAIT); }
  else if(key=='x'||key=='X'){ cursor(CROSS); }
  else if(key=='v'||key=='V'){ cursor(HAND); }
  else { noCursor(); }
}
void keyReleased(){
  noCursor();
}
  
