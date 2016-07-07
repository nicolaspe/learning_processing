Ball bbgun;
boolean[] keys;

void setup() {
  size(480, 480);
  frameRate(5);
  bbgun = new Ball();
  keys = new boolean[4];
  keys[0] = false;
  keys[1] = false;
  keys[2] = false;
  keys[3] = false;
}
void draw() {
  background(255);
  bbgun.control();
  bbgun.display();
}

class Ball {
  color c;
  float dim, xpos, ypos, xspeed, yspeed, acel, friction;

  Ball() {
    dim = 20;
    c = color(random(255), random(255), random(255));
    xpos = random(dim/2, width-dim/2);
    ypos = random(dim/2, height-dim/2);
    acel = 0.5;
    friction = 0.1;
  }
  void control() {
    if (keys[2]) {
      xspeed-=acel;
    } else if (keys[3]) {
      xspeed+=acel;
    } else if (xspeed>0) {
      xspeed-=acel;
    } else if (xspeed<0) {
      xspeed+=acel;
    }
    if (keys[0]) {
      yspeed-=acel;
    } else if (keys[1]) {
      yspeed+=acel;
    } else if (yspeed>0) {
      yspeed-=acel;
    } else if (yspeed<0) {
      yspeed+=acel;
    }
    xpos +=xspeed;
    ypos +=yspeed; 
    if (xpos>=width-dim/2 || xpos<=-dim/2) {
      xspeed=xspeed*(-1);
      c = color(random(255), random(255), random(255));
    }
    if (ypos>=height-dim/2 || ypos<=-dim/2) {
      yspeed=yspeed*(-1);
      c = color(random(255), random(255), random(255));
    }
  }
  void display() {
    fill(c);
    ellipse(xpos, ypos, dim, dim);
  }
}

void keyPressed() {
  if(key==CODED){if (key==UP) {
    keys[0]=true;
  }}
  if(key==CODED){if (key==DOWN) {
    keys[1]=true;
  }}
  if(key==CODED){if (key==LEFT) {
    keys[2]=true;
  }}
  if(key==CODED){if (key==RIGHT) {
    keys[3]=true;
  }}
}
void keyReleased() {
  if(key==CODED){if (key==UP) {
    keys[0]=false;
  }}
  if(key==CODED){if (key==DOWN) {
    keys[1]=false;
  }}
  if(key==CODED){if (key==LEFT) {
    keys[2]=false;
  }}
  if(key==CODED){if (key==RIGHT) {
    keys[3]=false;
  }}
}

