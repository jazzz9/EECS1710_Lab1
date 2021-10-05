//Project 1: by Jasmin Moradia (218474486)
//What is happening here: Male Dog and Female Dog jump around in the surrounding.
//When they meet, they give birth to a Baby Dog.
//We can also hover over the baby dog to tickle it.

PVector locationA;  // Location of shape
PVector locationB;
PVector locationC;
PVector velocityA;  // Velocity of shape
PVector velocityB;
PVector velocityC;
PVector gravity;   // Gravity acts at the shape's acceleration
PImage boy;
PImage girl;
PImage baby;
PImage background;
PImage back, middle, front;
PVector vback, vmiddle, vfront;
float x, y; 
float hr, vr;  
float m=100;
float speed=3;

void setup() {
  size(2000,1000);
  hr = 250/ 2;
  vr = 200/ 2;
  noStroke();
  x = width / 2;
  y = height / 2;
  locationA = new PVector(100,100);
  velocityA = new PVector(1.5,2.1);
  locationB = new PVector(1800,100);
  velocityB = new PVector(-1.5,2.1);
  locationC = new PVector(1000,100);
  velocityC = new PVector(random(1.5,-1.5),2.1);
  
  gravity = new PVector(0,0.2);
  boy = loadImage ("boy.png");
  boy.resize(300,350);
  girl = loadImage ("girl.png");
  girl.resize(200,250);
  baby = loadImage ("baby.png");
  baby.resize(250,200);
  background = loadImage("background.jpg");
  background.resize(2000,1000);

  back = loadImage("back.png");
  middle = loadImage("middle.png");
  front = loadImage("front.png");
  front.resize(1000,500);
  
  vback = new PVector(0, 0);
  vmiddle = new PVector(0, 400);
  vfront = new PVector(0,580); // fixing the position of the image
  
  frameRate(60);
}

void paraDraw(PImage img, PVector pos, float vel){
  pos.sub(vel, 0, 0);
  
  int r = (int)pos.x+img.width;

  if(r < width) image(img, r, pos.y);
  if(pos.x < width) image(img, pos.x-img.width, pos.y);  
  if(pos.x < -img.width) pos.x = width;
  
  image(img, pos.x, pos.y);
}

void draw() {
  background(background);
  //sun
  pushMatrix();
  translate(1500, height*0.2);
  rotate(frameCount / -100.0);
  star(m, 0, 50, 60, 15); 
  popMatrix();
  //parallax 
  paraDraw(back, vback, -0.5);
  paraDraw(middle, vmiddle, -2);
  paraDraw(front, vfront, 3);
  
  // Add velocity to the location.
  locationA.add(velocityA);
  locationB.add(velocityB);
  locationC.add(velocityC);
  // Add gravity to velocity
  velocityA.add(gravity);
  velocityB.add(gravity);
  velocityC.add(gravity);

  
  // Bounce off edges
  //A
  if ((locationA.x > width) || (locationA.x < 0)) {
    velocityA.x = velocityA.x * -1;
  }
  if (locationA.y > height) {
    // We're reducing velocity ever so slightly 
    // when it hits the bottom of the window
    velocityA.y = velocityA.y * -0.95; 
    locationA.y = height;
  }
  
  //B
  if ((locationB.x > width) || (locationB.x < 0)) {
    velocityB.x = velocityB.x * -1;
  }
  if (locationB.y > height) {
    // We're reducing velocity ever so slightly 
    // when it hits the bottom of the window
    velocityB.y = velocityB.y * -0.95; 
    locationB.y = height;
  }
  
  //C
  if ((locationC.x > width) || (locationC.x < 0)) {
    velocityC.x = velocityC.x * -1;
  }
  if (locationC.y > height) {
    // We're reducing velocity ever so slightly 
    // when it hits the bottom of the window
    velocityC.y = velocityC.y * -0.98; 
    locationC.y = height;
  }
    
  // Display creatures
  image(boy,locationA.x,locationA.y);
  image(girl,locationB.x,locationB.y);
  
  
  //if male and female come in close proximity, female gives birth to baby
   if((locationA.x-locationB.x)>200)
  {
    locationC.x = locationB.x;
    {//instruction for user
      textSize(30);
      fill(0);
      text("They just had a baby! Now hover over the baby to tickle it!", 600, 100);
    }
    // If the cursor is over the baby, change the position (tickle effect)
    if (abs(mouseX - locationC.x) < hr &&
        abs(mouseY - locationC.y) < vr) {
    locationC.x += random(-10, 10);
    locationC.y += random(-10, 10);
  }
    image(baby,locationC.x,locationC.y);
}}
//sun animation
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
