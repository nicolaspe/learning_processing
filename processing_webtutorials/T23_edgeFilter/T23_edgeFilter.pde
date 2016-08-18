PImage img00, img01;
float color_r = 240;
float color_g = 0;
float color_b = 122;

void setup(){
  img00 = loadImage("book.jpg");
  img00.resize(0,400);
  img01 = createImage(img00.width,img00.height,RGB);
  size(img00.width,img00.height);
}

void draw(){
  img00.loadPixels();
  img01.loadPixels();
  for(int x=1; x<img00.width; x++){
    for(int y=0; y<img00.height; y++){
      int imgLoc = x +y*img00.width;
      int imgLeftLoc = (x-1) +y*img00.width;
      
      color pix = img00.pixels[imgLoc];
      color leftPix = img00.pixels[imgLeftLoc];
      
      float diff = abs(brightness(pix) -brightness(leftPix));
      
      float r2 = (diff/255)*color_r;
      float g2 = (diff/255)*color_g;
      float b2 = (diff/255)*color_b;
      
      img01.pixels[imgLoc] = color(r2,g2,b2);
    }
  }
  img01.updatePixels();
  image(img01,0,0);
}

void keyPressed(){
  if(key=='r'||key=='R'){
    int rx = (int) color_r+1;
    color_r =(float) constrain(rx,0,255);
  } else if(key=='e'||key=='E'){
    int rx = (int) color_r-1;
    color_r =(float) constrain(rx,0,255);
  } if(key=='g'||key=='G'){
    int gx = (int) color_g+1;
    color_g =(float) constrain(gx,0,255);
  } else if(key=='f'||key=='F'){
    int gx = (int) color_g-1;
    color_g =(float) constrain(gx,0,255);
  } if(key=='b'||key=='B'){
    int bx = (int) color_b+1;
    color_b =(float) constrain(bx,0,255);
  } else if(key=='v'||key=='V'){
    int bx = (int) color_b-1;
    color_b =(float) constrain(bx,0,255);
  }
}
