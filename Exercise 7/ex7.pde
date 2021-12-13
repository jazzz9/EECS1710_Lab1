
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
  
  final float positionX;
  final float positionY;

  float radius;

  float hue_factor;
  final float sat_factor;
  final float bri_factor;
  
  Circle(float posX, float posY) {
    positionX = posX;
    positionY = posY;
    sat_factor = 70f;
    bri_factor = 90f;
  }
  
  void draw() {
    colorMode(HSB, 100f);
    noStroke();
    fill(hue_factor, sat_factor, bri_factor);
    ellipseMode(RADIUS);
    ellipse(positionX, positionY, radius, radius);
  }
  
  void reflect(float x, float y) {
    radius = 1f + 2f * noise(positionX * noise_factor, positionY * noise_factor, (x - y) * 0.5f  * noise_factor);
    radius += sin(frameCount * 0.05f) * 0.05f;
    radius = pow(radius, 3);

    hue_factor = 500f * noise(positionX * noise_factor, positionY * noise_factor, (x + y) * 0.5f * noise_factor);
    hue_factor += frameCount * 0.2f;
    hue_factor = hue_factor % 100;
  }
}
