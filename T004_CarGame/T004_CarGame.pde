Car myCar, enem1, enem2;
boolean crash = false;

void setup(){
  size(240,120);
  color tColor = color(random(255),random(255),random(255));
  myCar = new Car(tColor,0,height/2,1);
  enem1 = new Car(color(255,0,0),width-20,random(10,50),-1);
  enem2 = new Car(color(255,0,0),width-20,random(60,height-10),-1);
}
void draw(){
  background(255);
  myCar.control();
  enem1.kill(1);
  enem2.kill(2);
  crash = checkCrash(myCar,enem1,enem2);
  if(!crash){
    myCar.display();
    enem1.display();
    enem2.display();
  }
  //if(crash){stopCars(myCar,enem1,enem2);}
}


class Car{
  color c;
  float xpos, ypos, xspeed;
  
  Car(color tColor, float tXpos, float tYpos, float tSpeed){
    c = tColor;
    xpos = tXpos;
    ypos = tYpos;
    xspeed = tSpeed;
  }
  void display(){
    rectMode(CENTER);
    fill(c);
    rect(xpos,ypos,20,10);
  }
  void drive(){
    xpos = xpos+xspeed;
    if(xpos>width){xpos=0;}
  }
  void control(){
    if(key==CODED){
      if(keyCode == UP){ypos=ypos-2;}
      else if(keyCode==DOWN){ypos=ypos+2;}
      else if(keyCode==LEFT){xspeed-=0.10;}
      else if(keyCode==RIGHT){xspeed+=0.05;}
    }
    if(ypos<10){ypos=10;}
    if(ypos>height-10){ypos=height-10;}
    if(xspeed>4){xspeed=4;}
    if(xspeed<0.4){xspeed=0.4;}
    drive();
  }
  void kill(int franja){
    if(xpos<=1){
      int min,max;
      xpos = width-10;
      if(franja==1){min=10; max=height/2-5;}
      else{min=height/2+5; max=height-10;}
      ypos = random(min,max);
      xspeed = random(10,30)/10*(-1);
    }
    drive();
  }
  float[] getPos(){
    float[] pos = new float[2];
    pos[0] = xpos;
    pos[1] = ypos;
    return pos;
  }
  void stopCar(){
    xspeed = 0;
  }
}

boolean checkCrash(Car c1, Car c2, Car c3){
  boolean cr = false;
  float dx2,dx3,dy2,dy3;
  float[] pos1 = c1.getPos();
  float[] pos2 = c2.getPos();
  float[] pos3 = c3.getPos();
  dx2 = abs(pos1[0]-pos2[0]);
  dx3 = abs(pos1[0]-pos3[0]);
  dy2 = abs(pos1[1]-pos2[1]);
  dy3 = abs(pos1[1]-pos3[1]);
  if(dx2<10 && dy2<5){cr = true;}
  if(dx3<10 && dy3<5){cr = true;}
  return cr;
}
void stopCars(Car c1, Car c2, Car c3){
  c1.stopCar();
  c2.stopCar();
  c3.stopCar();
}

void keyReleased(){
  keyCode=0;
}
