PImage img1, img2;

void setup(){
  size(680,420);
  img1 = loadImage("Background.jpg");
  img2 = loadImage("Charizard.png");
  img1.resize(680,420);
  img2.resize(0,300);
}

void draw(){
  background(img1);
  tint(255,100,50,200);
  image(img2,20,20);
}
  
