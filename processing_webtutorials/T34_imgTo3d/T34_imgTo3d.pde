PImage img;
int cellsize = 2; // Dimension of each cell in the grid
int cols, rows;   // # of columns and rows

void setup(){
  img = loadImage("gol.jpg");
  size(400, 300, P3D);
  cols = width/cellsize;
  rows = height/cellsize;
}
void draw(){
  background(255);
  loadPixels();
  for(int i=0; i<cols; i++){
    for(int j=0; j<rows; j++){
      int x = i*cellsize *cellsize/2; // x position
      int y = j*cellsize +cellsize/2; // y position
      int loc = x +y*width;
      color c = img.pixels[loc];
      // z = f(mouseX, brightness)
      float bright = 255.0-brightness(img.pixels[loc]);
      bright = constrain(bright,0,255);
      float z = (mouseX/(float)width)*bright -100.0;
      // "Translate to location, set fill and stroke, and draw the rest"
      pushMatrix();
      translate(x,y,z);
      fill(c);
      noStroke();
      rectMode(CENTER);
      rect(0,0,cellsize,cellsize);
      popMatrix();
    }
  }
}