PImage imgSource, imgDest;
float threshold = 127;

void setup(){
  size(534,400);
  imgSource = loadImage("book.jpg");
  imgSource.resize(0,400);
  imgDest = createImage(imgSource.width,imgSource.height,RGB);
}

void draw(){
  imgSource.loadPixels();
  imgDest.loadPixels();
  
  for(int y=0; y<imgSource.height; y++){
    for(int x=0; x<imgSource.width; x++){
      int iLoc = x + y*imgSource.width;
      if(brightness(imgSource.pixels[iLoc])>threshold){
        imgDest.pixels[iLoc] = color(255);}
      else{
        imgDest.pixels[iLoc] = color(0);}
    }
  }
  imgDest.updatePixels();
  image(imgDest,0,0);
  
  // función de Processing de threshold
  // image(img,0,0);
  // int porcentaje_bright = 0.5;
  // filter(THRESHOLD,porcentaje_bright);
}

void keyPressed(){
  if(key=='+'){ threshold++;}
  else if(key=='-'){ threshold--;}
  threshold = constrain(threshold,10,150);
}
