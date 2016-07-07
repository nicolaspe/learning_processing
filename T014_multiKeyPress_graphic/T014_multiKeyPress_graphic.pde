boolean[] teclas;
color c;
int tam;

void setup(){
  size(400,400);
  teclas = new boolean[2];
  teclas[0] = false;
  teclas[1] = false;
  background(204);
}

void draw(){
  background(204);
  if(teclas[0]==false){ tam=100;}
  else{ tam=200;}
  if(teclas[1]==false){ c=color(255,0,0);}
  else{ c=color(0,255,255);}
  rectMode(CENTER);
  fill(c);
  rect(width/2,height/2,tam,tam);
}

void keyPressed(){
  if(keyCode==UP){ teclas[0]=true;}
  else if(keyCode==DOWN){ teclas[1]=true;}
}
void keyReleased(){
  if(keyCode==UP){ teclas[0]=false;}
  else if(keyCode==DOWN){ teclas[1]=false;}
}
