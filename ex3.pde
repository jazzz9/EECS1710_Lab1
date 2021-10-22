
float theta = 0;

void setup() {
  size(800, 500);
  
}

void draw() {
  PImage earth;
  earth = loadImage("earth.png");
  earth.resize(100,80);

  background(0);
  stroke(0);

  
  translate(width/2, height/2);
  fill(255, 200, 50);
  ellipse(0, 0, 64, 64);


  pushMatrix();
  rotate(theta);
  translate(100, 0);
  fill(0, 200, 255);
  image(earth,0,0);


  popMatrix();
  theta += 0.01;
}
