
ArrayList<Circle> circles = new ArrayList<Circle>();

void setup() {
  size(600, 500);
  background(255);
  
  for(float y = 15; y < height; y += 30) {
    for(float x = 15; x < width; x += 30) {
      circles.add(new Circle(x, y));
    }
  }
}

void draw() {
  background(0, 0, 100);
  for(Circle currentCircle : circles) {
    currentCircle.reflect(mouseX, mouseY);
    currentCircle.draw();
  }
}

class Circle {
  static final float noise_factor = 0.01f;
  
  final float pX;
  final float pY;

  float radius;

  float hue_factor;
  final float sat_factor;
  final float bri_factor;
  
  Circle(float posX, float posY) {
    pX = posX;
    pY = posY;
    sat_factor = 80;
    bri_factor = 100;
  }
  
  void draw() {
    colorMode(RGB, 100);
    noStroke();
    fill(hue_factor, sat_factor, bri_factor);
    ellipseMode(RADIUS);
    ellipse(pX, pY, radius, radius);
  }
  
  void reflect(float x, float y) {
    radius = 1 + 2 * noise(pX * noise_factor, pY * noise_factor, (x - y) * 0.5  * noise_factor);
    radius += sin(frameCount * 0.05) * 0.05;
    radius = pow(radius, 3);

    hue_factor = 500 * noise(pX * noise_factor, pY * noise_factor, (x + y) * 0.5 * noise_factor);
    hue_factor += frameCount * 0.2;
    hue_factor = hue_factor % 100;
  }
}
