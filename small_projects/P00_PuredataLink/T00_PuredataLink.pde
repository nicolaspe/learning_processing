import oscP5.*;
import netP5.*;

OscP5 oscP5_s;    // Objeto OSC send
OscP5 oscP5_r;    // Objeto OSC receive
NetAddress remoteDir;
int portS, portR;
String ip;

float hue, sat, bri;  // Parámetros a controlar desde pd

void setup(){
  size(480, 480);
  colorMode(HSB, 360, 100, 100);
  
  ip = "127.0.0.1";  // Home IP Address
  portS = 10111;
  portR = 10112;
  oscP5_s = new OscP5(this, portS);
  oscP5_r = new OscP5(this, portR);
  remoteDir = new NetAddress(ip, portS);
  
  hue = 0;
  sat = 80;
  bri = 80;
  
  color c = color(hue, sat, bri);
  background(c);
}

void draw(){
  // Creación de etiquetas de msjs
  OscMessage msg1 = new OscMessage("/mouse/position");
  OscMessage msg2 = new OscMessage("/mouse/posNorm");
  // Añadir datos
  msg1.add(mouseX);
  msg1.add(mouseY);
  msg2.add(map(mouseX, 0, width, 0.0, 1.0));
  msg2.add(map(mouseY, 0, width, 0.0, 1.0));
  // Enviar msjs
  oscP5_s.send(msg1, remoteDir);
  oscP5_s.send(msg2, remoteDir);
  
  color c = color(hue, sat, bri);
  background(c);
}

void oscEvent(OscMessage oscMsg){
  // Chequeamos la dirección del msj
  if(oscMsg.checkAddrPattern("/hue") == true){
    // Chequeamos si el msj es un float
    if(oscMsg.checkTypetag("f")){
      hue = oscMsg.get(0).floatValue();  // extraemos el 1er valor (0)
      hue = constrain(hue, 0, 359);
      return;
    }
  }
  
  if(oscMsg.checkAddrPattern("/sat") == true){
    // Chequeamos si el msj es un float
    if(oscMsg.checkTypetag("f")){
      sat = oscMsg.get(0).floatValue();  // extraemos el 1er valor (0)
      sat = constrain(sat, 0, 99);
      return;
    }
  }
  
  if(oscMsg.checkAddrPattern("/bri") == true){
    // Chequeamos si el msj es un float
    if(oscMsg.checkTypetag("f")){
      bri = oscMsg.get(0).floatValue();  // extraemos el 1er valor (0)
      bri = constrain(bri, 0, 99);
      return;
    }
  }
}