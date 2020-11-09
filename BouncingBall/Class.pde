// Simple bouncing ball class

class Ball {

  float x;
  float y;
  float xSpeed;
  float xAcc;
  float ySpeed;
  float gravity;
  float w;
  float life = 255;
  float ownHeight;
  float r = random(200, 250);
  float g = random(150, 200);
  float b = random(100, 150);
  int shape;

  Ball(float _X, float _Y, float _W, float _S, int _shape) {
    x = _X;
    y = _Y;
    w = _W;
    ownHeight = height - w/2;
    ySpeed = 0;
    xSpeed = _S;
    xAcc = _S;
    gravity = 0.08;
    shape = _shape;
  }

  void move() {
    // Add gravity to ySpeed
    ySpeed = ySpeed + gravity;
    // Add ySpeed to y locationx
    x = x + xSpeed + xAcc;
    y = y + ySpeed;
    // If square reaches the bottom
    // Reverse ySpeed
    if (y > ownHeight) {
      // Dampening
      ySpeed = ySpeed * -0.92;
      xAcc = xAcc * 0.95;
      y = ownHeight;
    }
  }

  boolean finished() {
    // Balls fade out
    //life--;
    //if (life < 0) {
    //println(x);
    if (x > width + w) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    // Display the circle
    fill(r, g, b);
    //stroke(0,life);
    if (shape == 1) {
      ellipse(x, y, w, w);
    } else if (shape == 2) {
      rect(x, y, w, w);
    } else if (shape == 3){
      triangle(x,y-w/2, x-w/2,y+w/2, x+w/2, y+w/2);
    }
  }
}  
