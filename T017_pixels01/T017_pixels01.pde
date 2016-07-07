void setup(){
  size(200,200);
  background(255);
  loadPixels();
  for(int x=0; x<width; x++){
    for(int y=0; y<height; y++){
      int loc = x+y*width;
      if((x+y)%2==0){ pixels[loc]=color(255);}
      else{ pixels[loc]=color(0);}
    }
  } 
  updatePixels();
}

void draw(){
  
}
