PImage img;
int pointy = 16;

void setup(){
  img = loadImage("sunsetPurple.jpg");
  size(640,480);
  background(0);
  smooth();
}

void draw(){
  int x = int(random(img.width));
  int y = int(random(img.height));
  int loc = x+y*width;
  
  loadPixels();
  float r = red(img.pixels[loc]);
  float g = green(img.pixels[loc]);
  float b = blue(img.pixels[loc]);
  
  noStroke();
  fill(r,g,b);
  ellipse(x,y,pointy,pointy);
}