PImage img;
float[] sinWave, cosWave;

void setup(){
  size(200,200);
  
  
  sinWave = new float[width];
  cosWave = new float[width];
  
  for(int i=0; i<sinWave.length; i++){
    float r = map(i,0,width,0,TWO_PI);
    sinWave[i] = abs(sin(r));
    cosWave[i] = abs(cos(r));
  }
  
  img = createImage(height,width,RGB);
  img.loadPixels();
  
  for(int x=0; x<width; x++){
    for(int y=0; y<height; y++){
      int loc = x +y*width;
      float c1 = max(sinWave[x],cosWave[y])*255;
      int c2 = (int) c1;
      img.pixels[loc] = color(c2);
    }
  }
  img.updatePixels();
}

void draw(){
  image(img,0,0);
}
