PImage img;

void setup(){
  size(600,300);
  img = loadImage("Background.jpg"); //tamaño 594x274
  background(204);
  loadPixels();
  img.loadPixels();
  for (int y=0; y<img.height; y++){
    for (int x=0; x<img.width; x++){
      int loc = x+y*img.width;
      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);
      float lumin = sqrt(0.299*r*r+0.587*g*g+0.114*b*b);
      // calculo la ubicación global, puesto que estoy 
      // trabajando en la imagen, el índice loc, no
      // corresponde al índice para el canvas. 
      int loc_glob = x+y*width;
      pixels[loc_glob] = color(r,g*(1-lumin/255),lumin);
    }
  }
  updatePixels();
}

void draw(){
  
}
  
