PImage img;
float timer = 1;
int mod = 1;

void setup(){
  size(604,284);
  img = loadImage("Background.jpg"); //tamaño 594x274
  background(06);
  frameRate(48);
}

void draw(){
  loadPixels();
  img.loadPixels();
  if (timer==255||timer==0){
    mod = mod*(-1);
  }
  println("timer = "+timer);
  for (int y=0; y<img.height; y++){
    for (int x=0; x<img.width; x++){
      int loc = x+y*img.width;
      float intense = constrain(timer/255,0,1);
      float r = intense*red(img.pixels[loc]);
      float g = intense*green(img.pixels[loc]);
      float b = intense*blue(img.pixels[loc]);
      // calculo la ubicación global, puesto que estoy 
      // trabajando en la imagen, el índice loc, no
      // corresponde al índice para el canvas. 
      int loc_glob = x+y*width;
      pixels[loc_glob] = color(r,g,b);
    }
  }
  updatePixels();
  timer += mod;
}

