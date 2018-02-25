import processing.sound.*;

// AUDIO
String filename = "somnus.mp3";
SoundFile song;

// FFT
FFT fft;
int bands = 512;

void setup(){
  size(512, 360);
  // initialize and play audiofile
  song = new SoundFile(this, filename);
  song.loop();
  // initialize fft
  fft = new FFT(this, bands);
  fft.input(song);
}

void draw(){
  background(255);
  
  fft.analyze();
  
  for(int i=0; i<fft.size(); i++){
    stroke(0);
    float y = map(fft.spectrum[i], 0, 1, height*.9, 0);
    line(i, height*0.9, i, y);
    //point(i, y);
  }
}