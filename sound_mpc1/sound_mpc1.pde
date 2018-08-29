import processing.sound.*;
SoundFile[] file = new SoundFile[16];
Button[] button = new Button[16];
char[] keyName = new char[16];

void setup() {
  size(800, 600);
  background(255);
  noStroke();

  // Load a soundfile from the /data folder of the sketch and play it back
  file[0] = new SoundFile(this, "such1.wav");
  file[1] = new SoundFile(this, "such2.wav");
  file[2] = new SoundFile(this, "such3.wav");
  file[3] = new SoundFile(this, "clap1.wav");
  file[4] = new SoundFile(this, "gt1.wav");
  file[5] = new SoundFile(this, "gt2.wav");
  file[6] = new SoundFile(this, "gt3.wav");
  file[7] = new SoundFile(this, "gt4.wav");
  file[8] = new SoundFile(this, "snare2.wav");
  file[9] = new SoundFile(this, "stayturning.wav");
  file[10] = new SoundFile(this, "tokyo.wav");
  file[11] = new SoundFile(this, "fridaynight.wav");
  file[12] = new SoundFile(this, "kick1.wav");
  file[13] = new SoundFile(this, "shaker1.wav");
  file[14] = new SoundFile(this, "goodnight1.wav");
  file[15] = new SoundFile(this, "goodnight2.wav");

  keyName[0] = '1';
  keyName[1] = '2';
  keyName[2] = '3';
  keyName[3] = '4';
  keyName[4] = 'q';
  keyName[5] = 'w';
  keyName[6] = 'e';
  keyName[7] = 'r';
  keyName[8] = 'a';
  keyName[9] = 's';
  keyName[10] = 'd';
  keyName[11] = 'f';
  keyName[12] = 'z';
  keyName[13] = 'x';
  keyName[14] = 'c';
  keyName[15] = 'v';

  int lengthCount = 0;
  for (int y=50; y<=50+133*3; y+=133) {
    for (int x=100; x<=100+160*3; x+=160) {
      //println("x: "+x+" y: "+y+" lengthCount: "+lengthCount);
      button[lengthCount] = new Button(x, y, file[lengthCount], keyName[lengthCount]);
      lengthCount++;
    }
  }
}
int yoko = 120;
int tate = 90;


void draw() {
  for (int i=0; i<button.length; i++)button[i].put();
}

void keyPressed() {
  for (int i=0; i<button.length; i++){
    if(key==button[i].keyName()) button[i].play();
  }
  if(key==ENTER){
  for (int i=0; i<button.length; i++)button[i].sound.stop();
  }
}

void keyReleased(){
  for (int i=0; i<button.length; i++){
    if(key==button[i].keyName()) button[i].block=color(230);
  }
}

class Button {
  int x, y, w, h;
  SoundFile sound;
  char kej;
  color block;

  Button(int rectx, int recty, SoundFile soundFile, char keyName) {
    x = rectx;
    y = recty;
    w = yoko;
    h = tate;
    sound = soundFile;
    kej = keyName;
    block = color(230);
  }

  void put() {
    fill(block);
    rect(this.x, this.y, this.w, this.h);
    fill(0);
    textSize(40);
    text(kej, this.x+(this.w/3), this.y+(this.h*2/3));
  }

  void play() {
    block = color(200,0,0);
    sound.stop();
    sound.play();
  }
  
  char keyName(){
    return this.kej;
  }
  
}