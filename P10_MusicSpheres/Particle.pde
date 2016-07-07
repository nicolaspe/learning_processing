class Particle{
  PVector pos;
  // Coordenadas esfericas
  float ra; // radio
  float th; // polar angle
  float ph; // azimuthal angle
 
 Particle(float radius, float theta, float phi){
   ra = radius;
   th = radians(theta);
   ph = radians(phi);
   // transf a coordenadas cartesianas
   calcCartesian();
 }
 
 // rota en coord esfericas el angulo theta
 void rotTh(float angle){
   th += radians(angle);
   calcCartesian();
 }
 // rota en coord esfericas el angulo pho
 void rotPh(float angle){
   ph += radians(angle);
   calcCartesian();
 }
 
 // aumenta el radio de la particula
 void grow(float inc){
   ra += inc;
   calcCartesian();
 }
 
 // calcula la posicion de la particula en coordenadas cartesianas
 void calcCartesian(){
   float px = ra*sin(th)*cos(ph);
   float py = ra*sin(th)*sin(ph);
   float pz = ra*cos(th);
   pos = new PVector(px, py, pz);
 }
 // calcula las coordenadas esfericas segun la posicion del vector
 void calcSpherical(){
   float px = pos.x;
   float py = pos.y;
   float pz = pos.z;
   ra = sqrt(px*px +py*py +pz*pz);
   th = acos(pz/ra);
   ph = atan2(py,px);
 }
 
 void display(){
   point(pos.x, pos.y, pos.z);
 }
 
 // Rota en torno al eje X
 void rotX(float angle){
   PVector aux = new PVector(pos.y, pos.z);
   aux.rotate(radians(angle));
   pos.set(pos.x, aux.x, aux.y);
   calcSpherical();
 }
 // Rota en torno al eje Y
 void rotY(float angle){
   PVector aux = new PVector(pos.x, pos.z);
   aux.rotate(radians(angle));
   pos.set(aux.x, pos.y, aux.y);
   calcSpherical();
 }
 // Rota en torno al eje Z
 void rotZ(float angle){
   PVector aux = new PVector(pos.x, pos.y);
   aux.rotate(radians(angle));
   pos.set(aux.x, aux.y, pos.z);
   calcSpherical();
 }
 
 float[] getCoords(){
   float[] result = new float[3];
   result[0] = ra;
   result[1] = th;
   result[2] = ph;
   return result;
 }
}
