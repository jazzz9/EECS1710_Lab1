//Name:Jasmin Moradia
//EECS 1710 Final project

import processing.sound.*;
SoundFile a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p;

PImage edm;
int value=0;
float phase = 0;
float zoff = 0;

void setup() {
  size(1920,1080);
  edm = loadImage("edm.png");
  edm.resize(width,height);
  
   a = new SoundFile(this, "a.wav");
   b = new SoundFile(this, "b.wav");
   c = new SoundFile(this, "c.wav");
   d = new SoundFile(this, "d.wav");
   e = new SoundFile(this, "e.wav");
   f = new SoundFile(this, "f.wav");
   g = new SoundFile(this, "g.wav");
   h = new SoundFile(this, "h.wav");
   i = new SoundFile(this, "i.wav");
   j = new SoundFile(this, "j.wav");
   k = new SoundFile(this, "k.wav");
   l = new SoundFile(this, "l.wav");
   m = new SoundFile(this, "m.wav");  
   n = new SoundFile(this, "n.wav");
   o = new SoundFile(this, "o.wav");
   //p = new SoundFile(this, "p.wav");
}


void keyPressed() {
  if (value == 0) {
    value = 255;
  } else {
    value = 0;
  }
}
void draw() {
  background(0);   
  image(edm,0,0);
  ellipse(mouseX,mouseY,20,20);

  stroke(118,76,200);
  strokeWeight(3);
  noFill();
  beginShape();
  translate(width/5, height /2);

  float noiseMax = map(mouseX, 0, width, 1, 0);
  for (float q = 0; q < TWO_PI; q += radians(5)) {
    float xoff = map(cos(q + phase), -1, 1, 0, noiseMax);
    float yoff = map(sin(q + phase), -1, 1, 0, noiseMax);
    float w = map(noise(xoff, yoff, zoff), 0, 1, 100, height / 2);
    float x = w * cos(q);
    float y = w * sin(q);
    vertex(x, y);
  }
  endShape(CLOSE);
  phase += 0.003;
  zoff += 0.01;
  
  
  stroke(253,102,107);
  strokeWeight(5);
  noFill();
  beginShape();
    float noiseMax1 = map(mouseX, 0, width, 1, 5);
    for (float q1 = 0; q1 < TWO_PI; q1 += radians(5)) {
    float xoff = map(cos(q1 + phase), -2, 1, 0, noiseMax1);
    float yoff = map(sin(q1 + phase), -2, 1, 0, noiseMax1);
    float w = map(noise(xoff, yoff, zoff), 0, 1, 100, height / 2);
    float x = w * cos(q1);
    float y = w * sin(q1);
    vertex(x, y);
  }
  endShape(CLOSE);
  phase += 0.003;
  zoff += 0.01;
  
if(keyPressed == true) {
     if(key == 'a'){
    a.play();
  }  if(key == 'b'){
    b.play();
  }  if(key == 'c'){
    c.play();
  }  if(key == 'd'){
    d.play();
  }  if(key == 'e'){
    e.play();
  }  if(key == 'f'){
    f.play();
  }  if(key == 'g'){
    g.play();
  }  if(key == 'h'){
    h.play();
  }  if(key == 'i'){
    i.play();
  }  if(key == 'j'){
    j.play();
  }  if(key == 'k'){
    k.play();
  }  if(key == 'l'){
    l.play();
  }  if(key == 'm'){
    m.play();
  }  if(key == 'n'){
    n.play();
  }  if(key == 'o'){
    o.play();
  }  if(key == 'p'){
    p.play();
  }
  
}
}


//reference: The Coding Train's youtube tutorial for noiseloop effect
