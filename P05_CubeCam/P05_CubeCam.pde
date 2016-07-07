import processing.video.*;
Capture video;
int dimX = 640;
int dimY = 480;
int rot = 0;

void setup(){
  size(960,480,P3D);
  background(0);
  smooth();
  video = new Capture(this,dimX,dimY);
  video.start();
}

void draw(){
  if(video.available()==true){
    video.read();
    background(0);
    
    pushMatrix();
    rotateY(PI/2);
    translate(0,0,-400);
    for(int i=0;i<10;i++){ image(video,i*dimX,0);}
    popMatrix();
    
    pushMatrix();
    translate(width,0,0);
    rotateY(-PI/2);
    translate(0,0,-400);
    for(int i=0;i<10;i++){ image(video,-i*dimX,0);}
    popMatrix();
    
    pushMatrix();
    translate((width-dimX)/2,0,-700);
    image(video,0,0);
    translate(0,0,1400);
    image(video,0,0);
    popMatrix();
    
    pushMatrix();
    translate((width-dimX)/2,0,0);
    rotateX(-PI/2);
    translate(0,0,-100);
    for(int i=0;i<10;i++){ image(video,0,i*dimY);}
    popMatrix();
    
    pushMatrix();
    translate((width-dimX)/2,height,0);
    rotateX(-PI/2);
    translate(0,0,100);
    for(int i=0;i<10;i++){ image(video,0,i*dimY);}
    popMatrix();
    
  }
  //camera(0, height/2, (height/2)/tan(PI/6), 0, height/2, 0, 0, 1, 0);
}
