int track = 50;
int[] posX = new int[track];
int[] posY = new int[track];
int indexPos = 0;

void setup(){
  size(400,400);
  noStroke();
  fill(255,100);
}

void draw(){
  background(0);
  posX[indexPos]=mouseX;
  posY[indexPos]=mouseY;
  indexPos = (indexPos+1) % track;
  
  for(int i=0; i<track; i++){
    int pos = (indexPos+i) % track;
    float r = (track-i)/2.0;
    ellipse(posX[pos],posY[pos],r,r);
  }
}
