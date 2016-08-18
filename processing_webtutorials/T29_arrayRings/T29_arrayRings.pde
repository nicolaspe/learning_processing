Ring[] rings;
int numRings = 100;
int indexPos = 0;

void setup(){
  size(400,400);
  rings = new Ring[numRings];
  for(int i=0; i<numRings; i++){ rings[i]=new Ring();}
}

void draw(){
  background(0);
  for(int i=0; i<numRings; i++){
    rings[i].grow();
    rings[i].display();
  }
}

void mousePressed(){
  rings[indexPos].start(mouseX,mouseY);
  indexPos++;
  if(indexPos>=numRings){ indexPos=0;}
}

class Ring{
  float x, y;// position
  float d;   // diameter
  boolean on = false;  // display ON/OFF
  
  void start(float posX, float posY){
    x = posX;
    y = posY;
    on = true;
    d = 1;
  }
  void grow(){
    if(on == true){
      d += 2.5;
      if(d>=2*width){ 
        d=0;
        on=false;
      }
    }
  }
  void display(){
    if(on == true){
      noFill();
      strokeWeight(4);
      stroke(155,100);
      ellipse(x,y,d,d);
    }
  }
}
