class ParticleSphere{
  int np, stepP, stepB, transp;
  ArrayList<Particle> parts;
  ArrayList<Particle> pulseSphere;
  boolean pulse, blink;
  PVector center;
  
  ParticleSphere(int num, PVector cen){
    np = num;  // # particulas
    center = cen;
    parts = new ArrayList<Particle>();
    pulse = false;
    blink = false;
    stepP = 0;  // pasos de pulse
    stepB = 0;  // pasos de blink
    transp = 250;
  }
  
  // ri = radio interno, re = radio externo
  void create(float ri, float re){
    for(int i=0; i<np; i++){
      // Radio, angulo theta y phi
      float ra = random(ri, re);
      float th = random(0,180);
      float ph = random(-180,180);
      Particle p = new Particle(ra, th, ph);
      parts.add(p);
    }
  }
  
  void display(){
    pushMatrix();
    translate(center.x, center.y, center.z);
    // dibujar el pulso
    if(pulse){
      transp = transp - 5*stepP;
      float increment = 10;
      stroke(255,transp);
      this.grow(pulseSphere,increment);
      for(Particle p: pulseSphere){
        p.display();
      }
      stepP++;
      if(transp <= 0){
        pulse = false;
        transp = 250;
      }
    }
    // dibujar la esfera
    stroke(255);
    for(Particle p : parts){
      p.display();
    }
    popMatrix();
  }
  
  // metodos que se ven desde afuera, no hacen realmente la rotacion
  void rot(float th, float ph){
    if(pulse){ rot(pulseSphere, th, ph);}
    rot(parts, th, ph);
  }
  void rot(float ax, float ay, float az){
    if(pulse){ rot(pulseSphere, ax, ay, az);}
    rot(parts, ax, ay, az);
  }
  
  // metodos que hacen finalmente la rotacion al arreglo especifico 
  void rot(ArrayList<Particle> list, float th, float ph){
    for(Particle p : list){
      // num random entre 0.5 y 1.5
      //float rand = constrain(randomGaussian(),-3.0,3.0)/6.0 +1.0;
      float rand = 1.0;
      p.rotTh(th*rand);
      p.rotPh(ph*rand);
    }
  }
  void rot(ArrayList<Particle> list, float ax, float ay, float az){
    for(Particle p : list){
      // num random entre 0.5 y 1.5
      //float rand = constrain(randomGaussian(),-3.0,3.0)/6.0 +1.0;
      float rand = 1.0;
      p.rotX(ax*rand);
      p.rotY(ay*rand);
      p.rotZ(az*rand);
    }
  }
  
  void grow(ArrayList<Particle> array, float inc){
    for(Particle p : array){
      p.grow(inc);
    }
  }
  
  void pulse(){
    pulse = true;
    transp = 250;
    pulseSphere = clone();
  }
  
  void blink(){
    blink = true;
  }
  
  ArrayList<Particle> clone(){
    ArrayList<Particle> result = new ArrayList<Particle>();
    for(Particle p : parts){
      float[] coords = p.getCoords();
      Particle p1 = new Particle(coords[0], coords[1], coords[2]);
      result.add(p1);
    }
    return result;
  }
  
  /*ParticleSphere clone(ParticleSphere orig){
    ParticleSphere result = new ParticleSphere(np, center);
    ArrayList<Particle> list = orig.getList();
    for(Particle p : list){
      float[] coords = p.getCoords();
      Particle p1 = new Particle(coords[0], coords[1], coords[2]);
      result.addParticle(p1);
    }
    return result;
  }
  ArrayList<Particle> getList(){
    return parts;
  }
  void addParticle(Particle p){
    parts.add(p);
  }*/
  
  int getListSize(){
    return parts.size();
  }
}
