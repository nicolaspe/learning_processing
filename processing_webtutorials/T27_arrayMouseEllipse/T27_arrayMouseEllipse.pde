int track = 50;
int[] posX = new int[track];
int[] posY = new int[track];

void setup(){
  size(400,400);
  noStroke();
  fill(255,100);
}

void draw(){
  background(0);
  for(int i=track-1; i>0; i--){
    posX[i] = posX[i-1];
    posY[i] = posY[i-1];
  }
  posX[0] = mouseX;
  posY[0] = mouseY;
  
  for(int i=0; i<track; i++){
    ellipse(posX[i],posY[i],i/2.0,i/2.0);
  }
}
