Spot[] spots;
int numSpots;

void setup(){
  size(700,200);
  numSpots = 70;
  int diam = width/numSpots;
  spots = new Spot[numSpots];
  for(int i=0; i<numSpots; i++){
    float x = diam/2 +i*diam;
    //float vel = random(0.5, 2);
    float vel = map(i, 0, numSpots, 0.2, 2.0);
    spots[i] = new Spot(x, 50, diam, vel);
    println(vel);
  }
  noStroke();
}

void draw(){
  fill(0,12);
  rect(0, 0, width, height);
  fill(255);
  for(Spot s : spots){
    s.move();
    s.display();
  }
}

class Spot{
  float posX, posY, d, velocity, dir;
    
  Spot(float x, float y, float diam, float vel){
    posX = x;
    posY = y;
    d = diam;
    velocity = vel;
    dir = -1;
  }
  
  void move(){
    posY = posY+dir*velocity;
    if((posY+d/2)>=height || (posY-d/2)<=0){
      dir = dir*(-1);
    }
  }
  void display(){ ellipse(posX, posY, d, d);}
}
