color c;
int xsc,ysc;

void setup(){
  size(480,480);
  c = color(100);
  colorMode(RGB,100);
}

void draw(){
  xsc = int(mouseX*100/width);
  ysc = int(mouseY*100/height);
  c = color(xsc,0,ysc);
  background(c);
}

