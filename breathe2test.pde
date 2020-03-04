int cx, cy;
float millisRadius;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;

// An array of objects
Breather[] breathers = new Breather[1];

void setup() {   
  size(1920, 1080);  
  noStroke();
  int radius = min(width, height) / 2;
  // millisRadius = radius * 0.72;
  secondsRadius = radius * 0.72;
  minutesRadius = radius * 0.60;
  hoursRadius = radius * 0.50;
  clockDiameter = radius * 1.8;

  cx = width / 2;
  cy = height / 2;
  // Initialize all objects
  for (int i = 0; i < breathers.length; i++) {
    breathers[i] = new Breather();
  }
}   

void draw() {   
  background(255, 255, 255);  
  // Run all objects
  for (int i = 0; i < breathers.length; i++) {
    breathers[i].breath();
    breathers[i].display();
  }
  // fill(80);
  // noStroke();
  // ellipse(cx, cy, clockDiameter, clockDiameter);

  // Angles for sin() and cos() start at 3 o'clock;
  // subtract HALF_PI to make them start at the top
  // float i = map(millis(), 0, 1000 * 60, 0, TWO_PI) - HALF_PI;
  // float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;

  //Draw the hands of the clock
  //stroke(255,0,255);
  //strokeWeight(5);
  //line(cx, cy, cx + cos(i) * secondsRadius, cy + sin(i) * millisRadius);
  //strokeWeight(1);
  //stroke(204, 219, 238);
  //line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
  strokeWeight(5);
  stroke(204, 219, 238);
  line(cx, cy, cx + cos(m) * minutesRadius, cy + sin(m) * minutesRadius);
  strokeWeight(7);
  stroke(204, 219, 238);
  line(cx, cy, cx + cos(h) * hoursRadius, cy + sin(h) * hoursRadius);

  // Draw the minute ticks
  stroke(204, 219, 238);
  strokeWeight(7.5);
  beginShape(POINTS);
  for (int a = 0; a < 360; a+= 6) {
    float angle = radians(a);
    float x = cx + cos(angle) * secondsRadius;
    float y = cy + sin(angle) * secondsRadius;
    vertex(x, y);
  } 
  endShape();
}