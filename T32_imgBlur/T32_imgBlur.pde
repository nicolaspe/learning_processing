PImage img;
int dim = 100;

float[][] matrix ={{1.0/9, 1.0/9, 1.0/9},
                   {1.0/9, 1.0/9, 1.0/9},
                   {1.0/9, 1.0/9, 1.0/9}};

void setup(){
  img = loadImage("sunsetPurple.jpg");
  size(img.width, img.height);
  noCursor();
  frameRate(48);
}

void draw(){
  image(img,0,0);
  int x1 = constrain(mouseX-dim/2, 0, img.width);
  int x2 = constrain(mouseX+dim/2, 0, img.width);
  int y1 = constrain(mouseY-dim/2, 0, img.height);
  int y2 = constrain(mouseY+dim/2, 0, img.height);
  int matrixSize = 3;
  loadPixels();
  for(int x=x1; x<x2; x++){
    for(int y=y1; y<y2; y++){
     color c = convolution(x,y,matrix,matrixSize,img);
     int loc = x +y*width;
     pixels[loc] = c;
    }
  }
  updatePixels();
}

color convolution(int x, int y, float[][] matrix, int mSize, PImage img){
  float r = 0.0;
  float g = 0.0;
  float b = 0.0;
  int offset = mSize/2;
  for(int i=0; i<mSize; i++){
    for(int j=0; j<mSize; j++){
      int xloc = x+i-offset;
      int yloc = y+j-offset;
      int loc = xloc +yloc*img.width;
      loc = constrain(loc, 0, img.pixels.length -1);
      
      r += (float) (red(img.pixels[loc]) *matrix[i][j]);
      g += (float) (green(img.pixels[loc]) *matrix[i][j]);
      b += (float) (blue(img.pixels[loc]) *matrix[i][j]);
    }
  }
  r = constrain(r,0,255);
  g = constrain(g,0,255);
  b = constrain(b,0,255);
  return color(r,g,b);
}

void keyPressed(){
  if(key == '+'){ dim++;}
  if(key == '-'){ dim--;}
  dim = constrain(dim,50,200);
}
