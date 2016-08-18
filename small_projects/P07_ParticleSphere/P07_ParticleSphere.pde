ParticleSphere ps;
int np = 1000;

void setup(){
  size(940, 560, P3D);
  background(42);
  lights();
  noCursor();
  
  PVector centro = new PVector(0, 0, 0);
  ps = new ParticleSphere(np, centro);
  ps.create(400, 410);
}

void draw(){
  background(42);
  float camX = 2*mouseX -width;
  float camY = 2*mouseY -height;
  camera(camX,camY,(height/2)/tan(PI/6), 0,0,0, 0,1,0);
  stroke(255,220);
  fill(0);
  box(400);
  ps.rot(0.0, 1.0, 0.0);
  ps.display();
}

void keyPressed(){
  if(key == CODED){
    if(keyCode == UP){
    }
    else if(keyCode == DOWN){
    }
  }
  else if(key == 'p' || key == 'P'){
    ps.pulse();
  }
  else if(key == 'a' || key == 'A'){
  }
}
