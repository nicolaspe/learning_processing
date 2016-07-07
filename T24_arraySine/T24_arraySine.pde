float[] sineWave;

void setup(){
   size(200,200);
   sineWave = new float[width];
   for(int i=0; i<sineWave.length; i++){
     float r = map(i,0,width,0,TWO_PI);
     sineWave[i] = abs(sin(r));
   }
}

void draw(){
  for(int i=0; i<sineWave.length; i++){
    stroke(sineWave[i]*255);
    line(i,0,i,height);
  }
}
