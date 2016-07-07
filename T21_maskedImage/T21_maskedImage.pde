PImage img;
int ra = 50;  // radio del círculo

void setup(){
  size(594,274);
  img = loadImage("Background.jpg"); //tamaño 594x274
  background(06);
}

void draw(){
  loadPixels();
  img.loadPixels();
  for (int y=0; y<img.height; y++){
    for (int x=0; x<img.width; x++){
      int iLoc = x+y*img.width;
      int dLoc = x+y*width;
      float dl = dist(x,y,mouseX,mouseY);
      float intense = constrain((ra-dl)/ra,0,1);
      float r = intense* red(img.pixels[iLoc]);
      float g = intense* green(img.pixels[iLoc]);
      float b = intense* blue(img.pixels[iLoc]);
      pixels[dLoc] = color(r,g,b);
    }
  }
  updatePixels();
}

void keyPressed(){
  if(key=='+'){ ra++;}
  else if(key=='-'){ ra--;}
  ra = constrain(ra,10,150);
}
