PImage image;

void setup() {
  size(1080,1060,P3D);
  image = loadImage("image.jpg");
  image.resize(width,height);
  background(0);
}

void draw() {
  for(int i = 0; i<= 100; i++) {
  float x = random(width);
  float y = random(height);
  color c = image.get(int(x),int(y));
  fill(c,25);
  noStroke();
  float factor = random(20,mouseX/5);    //Slide mouse horizontally for blur-unblur effect
  ellipse(x,y,factor,factor);
}
}

//Reference: The Coding Train's tutorials
