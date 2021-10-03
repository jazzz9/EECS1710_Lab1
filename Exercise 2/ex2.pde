
 
int xspacing = 16;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave

float theta = 0.0;  // Start angle at 0
float amplitude = 50.0;  // Height of wave
float period = 500.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave
float m=100;
float speed=3;
PImage clouds;
PVector vclouds;

void setup() {
 
  size(1000, 800);
  w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
  clouds = loadImage("clouds.png");
  vclouds = new PVector(0,0);
}

void paraDraw(PImage img, PVector pos, float vel){
  pos.sub(vel, 0, 0);
  
  int r = (int)pos.x+img.width;

  if(r < width) image(img, r, pos.y);
  if(pos.x < width) image(img, pos.x-img.width, pos.y);  
  if(pos.x < -img.width) pos.x = width;
  //println("r: " + r + ", pos.x: " +pos.x);
  
  image(img, pos.x, pos.y);
}

void draw() {
  background(135,206,235);
  calcWave();
  renderWave();
  pushMatrix();
  translate(width/2, height*0.2);
  rotate(frameCount / -100.0);
  star(m, 0, 50, 60, 15); 
  popMatrix();
  
  paraDraw(clouds, vclouds, 1);
}

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.02;

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave() {
  noStroke();
  fill(255);
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < yvalues.length; x++) {
    ellipse(x*xspacing, height/2+yvalues[x], 16, 16);
  }
  
}
void star(float x, float y, float radius1, float radius2, int npoints) {
  fill(255,200,50);
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

void move()
{

  m=m+speed;
  if(m>width)
  {
    m=0;
  }
}
