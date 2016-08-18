void setup(){
  size(200,200);
  noStroke();
  fill(0);
  textSize(40);
}
void draw(){
  if (mousePressed==true){
    if (mouseButton==LEFT){ fill(255,0,0);}
    else if (mouseButton==RIGHT){ fill(180,0,0);}
    else{ fill(80,0,0);}    
  }
  else { fill(0);}
  background(214);
  char[] c = new char[1];
  c[0] = key;
  String s = new String(c);
  if (mouseX<width/3 && mouseY<height/2){ // caso 1
    rect(0,0,width/3,height/2);
    fill(0,0,200,150);
    text(s,0,0,width/3,height/2);
  }
  else if (mouseX<width*2/3 && mouseY<height/2){ // caso 2
    rect(width/3,0,width/3,height/2);
    fill(0,0,200,150);
    text(s,width/3,0,width/3,height/2);
  }
  else if (mouseY<height/2){ // caso 3
    rect(width*2/3,0,width/3,height/2);
    fill(0,0,200,150);
    text(s,width*2/3,0,width/3,height/2);
  } 
  else if (mouseX<width/3){ // caso 4
    rect(0,height/2,width/3,height/2);
    fill(0,0,200,150);
    text(s,0,height/2,width/3,height/2);
  }
  else if (mouseX<width*2/3){ // caso 5
    rect(width/3,height/2,width/3,height/2);
    fill(0,0,200,150);
    text(s,width/3,height/2,width/3,height/2);
  }
  else{ // caso 6
    rect(width*2/3,height/2,width/3,height/2);
    fill(0,0,200,150);
    text(s,width*2/3,height/2,width/3,height/2);
  }
}
