PImage img;

void setup(){
  size(420,420);
  img = loadImage("charmander.png");
}

void draw(){
  background(204);
  image(img,0,0,420,420); //image resized to 420x420
}
