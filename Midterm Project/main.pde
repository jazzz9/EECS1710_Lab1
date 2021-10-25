//Midterm Project by : Jasmin Moradia (218474486)
//Reference: based on basketball game algorithms

float xpos, ypos, xvel, yvel, acclr, n, xblock, yblock, boardHeight,give, space, i;
int value = 0, dir = 1, score, highscore;
boolean fall, Shoot, backboard, reset;
PShader blur;
PImage bird;
PImage back;

void setup() {
  size (1000, 800 );
  xpos = width/5;
  ypos = height-300;
  yvel = .5;
  xvel = .5;
  acclr = 2;
  fall = false;
  Shoot = false;
  xblock = random(400, 800);
  yblock = random(200, 600);
  backboard = false;
  give = 20;
  score = 0;
  space =  0;
  highscore = 0;
  reset = false;
  back = loadImage("back.jpg");
  back.resize(width,height);
}

void draw() {
  background(back);
  textSize(20);
  fill(255);
  
  fill(255);
  boardHeight = 180;
  n = 180;

  noStroke();
  fill(255);
  if (score > highscore){
    highscore = score;
  }
  text("HIGHSCORE: " + highscore, 10, height - 70);   
  text("SCORE: " + score, 10, height - 30); 
  rect(xblock, yblock, n, 5);      
  println(score); 
  if (xpos >= width||ypos >= height){
     reset = true;
  }
  if (xvel > 25){
    xvel = 25;
  }
  if (yvel >25){
    yvel = 25;
  }
  rect(0, 0, yvel*20, 5);
  rect(0, 10, xvel*20, 5);
  rect(xblock+n, yblock - boardHeight, 5, boardHeight+5);
if (Shoot == false||fall==false){
  xvel = (mouseX-width/5)/7;
  yvel = (height-300 - mouseY)/7;
  stroke(255);
  line(xpos, ypos, xpos+xvel*5, ypos-yvel*5);
  noStroke();
}
if (Shoot == true||fall==true) {
  fall = true;
  if (backboard) {
    yvel -= 5 ;
    xpos -= 1.25*xvel;
    give = 40;
  }
  else {
    xpos+= xvel;
  }

  yvel -= acclr;
  ypos -= yvel;
}
  if (xpos > xblock-20 + n && xpos < xblock + n + 30 && ypos > yblock -boardHeight-5 && ypos < yblock) {
     backboard = true;
  }  
  if(xpos>xblock-10 && xpos<xblock+20 && ypos < (yblock + give) && ypos > (yblock -10)){
    yvel = -yvel;
    xvel = -xvel;
  }
if (xpos>xblock+20 && xpos<(xblock+n) && ypos < (yblock + give) && ypos > (yblock -10) && yvel < 1 ) {
  xpos = width/5;
  ypos = height-300;
  yvel = .1;
  xvel = .1;
  acclr = 1;
  fall = false;
  Shoot = false;
  yblock = random(300, 700);
  xblock = random(400, 800);


  backboard = false;

  score += 1;
}
bird = loadImage("bird.png");
bird.resize(75,75);
image(bird,xpos-50,ypos-50);
 
  if (reset == true){
    xpos = width/5;
    ypos = height-300;
    yvel = .1;
    xvel = .1;
    acclr = 1;
    n = 150;
    fall = false;
    Shoot = false;
    yblock = random(200, 500);
    xblock = random(400, 800);
    backboard = false;
    boardHeight = 150;
    give = 15;
    score = 0;
    i = 0;
    space = 0;  
    reset = false;
  }
}

void mouseClicked() {
  if (value == 0) {
    Shoot = true;
  }
}




