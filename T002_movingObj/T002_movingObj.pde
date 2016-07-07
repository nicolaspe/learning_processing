color c = color(255);
float x = 0;
float y = 0;
float r = 1;
float dir = 1;
float speedX = 1;
float speedY = 1;

void setup(){size(480,120);}
void draw(){
  background(200);
  move();
  if (mousePressed){randomColor();}
  display();
}
void move(){
  x = x+speedX;
  if (x>width){x=0;}
  y = y+speedY*r;
  if (y<=0){y=0;}
  if (y>height-10){y=height-10;}
  if (y>=height-10 || y<=0){
    r = random(5,15)/10;
    speedY = speedY*(-1)*r;
  }
}

void display(){
  fill(c);
  rect(x,y,30,10);
}

void randomColor(){
  c = color(random(255),random(255),random(255));
}
