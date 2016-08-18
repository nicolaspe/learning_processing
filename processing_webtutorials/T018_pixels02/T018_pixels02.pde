void setup(){
  size(255,255);
  PImage img = createImage(255,255,RGB);
  for(int x=0; x<width; x++){
    for(int y=0; y<height; y++){
      int loc = x+y*width;
      int intense = max(x,y);
      if(intense<0){ intense=0;}
      if(intense>255){ intense=255;}
      img.pixels[loc]=color(intense,255,255);
    }
  }
  background(img);
}
void draw(){
  
}
