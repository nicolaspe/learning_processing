float angle = 0;

void setup(){
  size(200,200);
  fill(0);
  noStroke();
  background(235);
}
void draw(){
  if(keyPressed==true){
    if(key == CODED){
      if(keyCode==UP){ fill(0,255,0,150);}
      else if(keyCode==DOWN){ fill(0,0,255,150);}
      else if(key<32 || key>=127){ fill(0);}
    }
    if( (key>=32) && (key<127)){
      background(235);
      angle = (key-32)*3;
    }
    arc(width/2,height/2,66,66,0,radians(angle));
  }
}
