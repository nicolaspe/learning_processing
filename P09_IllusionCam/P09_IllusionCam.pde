import processing.video.*;
Capture video;
int camX = 640;
int camY = 480;
int[][] baseImg;  // guarda valores RGB de img base
int[] imgIllu;    // guarda valores grayscale de ilusion
boolean base, illusion; // para saber si existen
boolean trBase, trIllu; // triggers para capturar imagenes

void setup(){
  size(640,480);
  baseImg = new int[camX*camY][3];
  imgIllu = new int[camX*camY];
  base = false;
  illusion = false;
  trBase = false;
  trIllu = false;
  video = new Capture(this, camX, camY);
  video.start();
}

void draw(){
  if(video.available() == true){
    video.read();
    
    // trigger de capturar img base
    if(trBase){
      baseImg = captureBase(video);
      base = true;
      trBase = false;
    }
    // trigger de capturar ilusion
    if(trIllu){
      imgIllu = captureIllu(video);
      illusion = true;
      trIllu = false;
    }
    
    // si no hay imagen base, muestra el feed de la cámara
    if(!base){
      image(video, 0, 0);
    }
    else{
      PImage a0 = crearImg(baseImg, camX, camY);
      image(a0, 0, 0);
      if(illusion){
        PImage a1 = crearImg(imgIllu, camX, camY);
        //tint(255,120);
        image(a1, 0, 0);
      }
    }
  }
}

void keyPressed(){
  if(key == 'b' || key == 'B'){
    if(!base){  // no se puede reemplazar a base
      trBase = true;
    }
  }
  if(key == 'n' || key == 'N'){
    if(base){  // si no hay base, no se puede capturar ilusion
      trIllu = true;
    }
  }
}

int[][] captureBase(PImage img){
  int[][] result = new int[img.width*img.height][3];
  for(int x=0; x<camX; x++){
    for(int y=0; y<camY; y++){
      int loc = x+y*camX;
      result[loc][0] = (int) red(img.pixels[loc]);
      result[loc][1] = (int) green(img.pixels[loc]);
      result[loc][2] = (int) blue(img.pixels[loc]);
    }
  }
  return result;
}
int[] captureIllu(PImage img){
  int[] result = new int[img.width*img.height];
  for(int x=0; x<camX; x++){
    for(int y=0; y<camY; y++){
      int loc = x+y*camX;
      int dr = (int) red(img.pixels[loc])   -baseImg[loc][0];
      int dg = (int) green(img.pixels[loc]) -baseImg[loc][1];
      int db = (int) blue(img.pixels[loc])  -baseImg[loc][2];
      if(dr==0 && dg==0 && db==0){
        //result[loc] = 255;
      }
      else{
        result[loc] = (int) brightness(img.pixels[loc]);
      }
    }
  }
  return result;
}

PImage crearImg(int[][] colors, int dimX, int dimY){
  PImage result = new PImage(dimX, dimY, RGB);
  result.loadPixels();
  for(int x =0; x<dimX; x++){
    for(int y=0; y<dimY; y++){
     int loc = x +y*dimX;
     color c = color(colors[loc][0], colors[loc][1], colors[loc][2]);
     result.pixels[loc] = c;
    }
  }
  result.updatePixels();
  return result;
}
PImage crearImg(int[] grayscale, int dimX, int dimY){
  PImage result = new PImage(dimX, dimY, RGB);
  result.loadPixels();
  for(int x =0; x<dimX; x++){
    for(int y=0; y<dimY; y++){
     int loc = x +y*dimX;
     color c = color(grayscale[loc]);
     result.pixels[loc] = c;
    }
  }
  result.updatePixels();
  return result;
}
