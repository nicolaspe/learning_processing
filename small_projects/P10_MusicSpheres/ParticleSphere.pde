class ParticleSphere {
  int np;
  PVector center;
  float radio;
  color cFill, cStroke;
  ArrayList<Particle> parts;
  boolean pulse, blink;
  int stepP, stepB, transp;

  ParticleSphere(int num, PVector cen, float ra, color cF, color cS) {
    parts = new ArrayList<Particle>();
    np = num;  // # particulas
    center = cen;
    radio = ra;
    cFill = cF;
    cStroke = cS;
    pulse = false;
    blink = false;
    stepP = 0;  // pasos de pulse
    stepB = 0;  // pasos de blink
    transp = 255;
  }

  // ri = radio interno, re = radio externo
  void create() {
    for(int i=0; i<np; i++) {
      // Radio, angulo theta y phi
      float ra = radio +20;
      float th = random(0, 180);
      float ph = random(-180, 180);
      Particle p = new Particle(ra, th, ph);
      parts.add(p);
    }
  }

  void display() {
    pushMatrix();
    translate(center.x, center.y, center.z);
    // ejecutar el pulso
    if (pulse) {
      stepP++;
      if (stepP >= 20) {
        pulse = false;
      }
    }
    // dibujar la esfera
    stroke(cStroke);
    fill(cFill);
    //sphere(radio);
    for (Particle p : parts) {
      p.display();
    }
    popMatrix();
  }

  // rotacion de las particulas
  void rot(float th, float ph) {
    for (Particle p : parts) {
      // num random entre 0.5 y 1.5
      //float rand = constrain(randomGaussian(),-3.0,3.0)/6.0 +1.0;
      float rand = 1.0;
      p.rotTh(th*rand);
      p.rotPh(ph*rand);
    }
  }
  void rot(float ax, float ay, float az) {
    for (Particle p : parts) {
      // num random entre 0.5 y 1.5
      //float rand = constrain(randomGaussian(),-3.0,3.0)/6.0 +1.0;
      float rand = 1.0;
      p.rotX(ax*rand);
      p.rotY(ay*rand);
      p.rotZ(az*rand);
    }
  }

  void grow(float inc) {
    for (Particle p : parts) {
      p.grow(inc);
    }
  }

  void pulse() {
    pulse = true;
  }

  void blink() {
    blink = true;
  }
}

