class ParticlePlane {
  int np;
  float radio;
  ArrayList<Particle> parts;

  ParticlePlane(int num, float ra) {
    parts = new ArrayList<Particle>();
    np = num;  // # particulas
    radio = ra;
  }

  void create() {
    for(int i=0; i<np; i++) {
      // Radio, angulo theta y phi
      float ra = random(0.1, radio);
      float th = random(-180, 180);
      Particle p = new Particle(ra, th, 0);
      parts.add(p);
    }
  }

  void display() {
    stroke(255);
    for (Particle p : parts) {
      p.display();
    }
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
  
}

