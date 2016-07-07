import processing.video.*;
Capture video;
int dimX = 400;
int dimY = 400;
int dxCam = 640;
int dyCam = 480;
int[] posX, posY;
int mult = 1;
int cont = 0;
boolean[] lock;

void setup() {
  size(960, 480, P3D);
  background(0);
  posX = new int[6];
  posY = new int[6];
  lock = new boolean[6];
  for (int i=0; i<6; i++) {
    posX[i] = 0;
    posY[i] = 0;
    lock[i] = false;
  }
  smooth();
  video = new Capture(this, dxCam, dyCam);
  video.start();
}

void draw() {
  if (video.available()==true) {
    video.read();
    background(cont);
    cont = cont+mult;
    if(cont<=0 || cont>=255){ mult=(-1)*mult;}

    for (int i=0; i<6; i++) {
      if (lock[i]==false) {
        int[] aux = getIni(mouseX, mouseY);
        posX[i] = (int) aux[0];
        posY[i] = (int) aux[1];
      }
    }

    // LADO IZQ
    pushMatrix();
    rotateY(PI/2);
    translate(0, 0, -400);
    for(int i=0; i<10; i++){ image(video, i*dxCam, 0);}
    popMatrix();

    // LADO DER 
    pushMatrix();
    translate(width, 0, 0);
    rotateY(-PI/2);
    translate(0, 0, -400);
    for (int i=0; i<10; i++) { image(video, -i*dxCam, 0);}
    popMatrix();

    // CENTRO
    pushMatrix();
    translate((width-dxCam)/2, 0, -700);
    image(video, 0, 0);
    translate(0, 0, 1400);
    image(video, 0, 0);
    popMatrix();

    // ARRIBA
    pushMatrix();
    translate((width-dxCam)/2, 0, 0);
    rotateX(-PI/2);
    translate(0, 0, -100);
    for (int i=0; i<10; i++) { image(video, 0, i*dyCam);}
    popMatrix();

    // ABAJO
    pushMatrix();
    translate((width-dxCam)/2, height, 0);
    rotateX(-PI/2);
    translate(0, 0, 100);
    for (int i=0; i<10; i++) { image(video, 0, i*dyCam);}
    popMatrix();
  }
  camera(width/2, height/2, (height/2)/tan(PI/6), mouseX, mouseY, 0, 0, 1, 0);
}

int[] getIni(float mX, float mY) {
  int[] result = new int[2];
  result[0] = (int) constrain(mX-dimX/2, 0, dxCam-dimX);
  result[1] = (int) constrain(mY-dimY/2, 0, dyCam-dimX);
  return result;
}

/* Entrega la porcion de imagen de imgBase de dimensiones dX*dY
 * con punto de partida en iniX, iniY */
PImage copyImage(PImage imgBase, int iniX, int iniY, int dX, int dY){
  PImage imagen = createImage(dX, dY, RGB);
  imagen.loadPixels();
  for (int x=0; x<dX; x++) {
    for (int y=0; y<dY; y++) {
      int curLoc  = y*dX +x;
      int globLoc = (y+iniY)*dxCam +(x+iniX);
      color c = imgBase.pixels[globLoc];
      imagen.pixels[curLoc] = c;
    }
  }
  imagen.updatePixels();
  return imagen;
}

void keyPressed() {
  int num = (int) key;
  if (lock[num-1]==true) { 
    lock[num-1]=false;
  } else { 
    lock[num-1]=true;
  }
}

