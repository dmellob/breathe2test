class Breather {   

  // Location and size
  float x, y;
  float rad;
  // Angle for oscillation
  float theta;  
  float dtheta;

  Breather() { 
    // Initialize variables randomly
    x = width/2;
    y = height/2;  
    rad =random(270,0);
    theta = 0;  
    dtheta = 0.015;
  }   

  // Increment theta
  void breath() {
    theta += dtheta;
  }   

  void display() { 
    // Map size based on sine function  
    float r = rad + rad * (sin(theta) + 1);
    // Display circle
    
    noStroke();
    fill(35, 60, 103);
    ellipse(x, y, 835, 835);
    fill(68, 112, 173);
    ellipse(x, y, r, r);
    
  }
}