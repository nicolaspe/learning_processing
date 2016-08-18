ParticleSphere[] ps;
ParticlePlane pp;
int nps = 3;     // # esferas
int npa = 1000;  // # particulas
float camRa, camTh, camPh;  // coordenadas de la camara 
float mdx, mdy;  // posición del mouse cuando se apreta
boolean drag;    // se activa cuando se apreta el mouse 

void setup(){
  size(940, 560, P3D);
  background(0);
  lights();
  //noCursor();
  camRa = 1000.0;
  camTh = radians(150.0);
  camPh = radians(-150.0);
  mdx = 0.0;
  mdy = 0.0;
  drag = false;
  
  // centro y radio de las esferas
  PVector[] pCenter = new PVector[nps];
  float[] pRadio  = new float[nps];
  color[] pColorF = new color[nps];
  color[] pColorS = new color[nps];
  pCenter[0] = new PVector(0, 0, 500);
  pRadio[0]  = 50;
  pColorF[0] = color(180,   0, 0);
  pColorS[0] = color(255, 200, 0);
  pCenter[1] = new PVector(-300, 0, -300);
  pRadio[1]  = 80;
  pColorF[1] = color(0,   0, 180);
  pColorS[1] = color(0, 255,   0);
  pCenter[2] = new PVector(500, 0, 0);
  pRadio[2]  = 70;
  pColorF[2] = color(0);
  pColorS[2] = color(255);
  
  // se crea el plano
  pp = new ParticlePlane(npa, 1000.0);
  pp.create();
  // se crean las esferas
  ps = new ParticleSphere[nps];
  for(int i=0; i<nps; i++){
    ps[i] = new ParticleSphere(npa, pCenter[i], pRadio[i], pColorF[i], pColorS[i]);
    ps[i].create();
  }
}

void draw(){
  background(42);
  noFill();
  stroke(100);
  sphere(1000);
  
  // posicion de la camara
  float cRa = camRa;
  float cTh = camTh;
  float cPh = camPh;
  if(drag){
    // el movimiento de la camara es proporcional a la diferencia del
    // movimiento del mouse
    // dx: azimuth angle; dy: polar angle
    float dx = mouseX -mdx;
    float dy = mouseY -mdy;
    // maximo movimiento de 150°
    dx = radians(map(dx, 0, width,  0, 150));
    dy = radians(map(dy, 0, height, 0, 150*height/width));
    //cPh = camPh -dy;
    cTh = camTh +dx;
  }
  PVector cam = calcCartesian(cRa, cTh, cPh);
  camera(cam.x,cam.y,cam.z, 0,0,0, 0,1,0);
  
  pp.rot(0.0, 1.5, 0.0);
  pp.display();
  for(ParticleSphere p : ps){
    p.rot(0.0, 1.0, 0.0);
    p.display();
  }
  
}

void mousePressed(){
  if(!drag){
    mdx = mouseX;
    mdy = mouseY;
  }
  drag = true;
}
void mouseReleased(){
  drag = false;
  float dx = radians(map(mouseX-mdx, 0, width,  0, 150));
  float dy = radians(map(mouseY-mdy, 0, height, 0, 150*height/width));
  //camPh -= dy;
  camTh += dx;
}
void mouseWheel(MouseEvent event){
  float e = event.getCount();
  camRa += 10*e;
}

PVector calcCartesian(float ra, float th, float ph){
   float px = ra*sin(th)*cos(ph);
   float py = ra*sin(th)*sin(ph);
   float pz = ra*cos(th);
   PVector pos = new PVector(px, py, pz);
   return pos;
}
