PImage photo;
PImage back;
void setup() {
  size(1000, 1000);
  back= loadImage("space.jpg");
  back.resize(1000,1000);
  background(back);
  photo = loadImage("doge.png");
  photo.resize(200,200);
}

void draw() {
  if(mousePressed)
  image(photo,mouseX,mouseY);
}
