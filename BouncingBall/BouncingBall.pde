ArrayList<Ball> balls;
//int ballWidth = 48;

float min = 0.5;
float max = 1.25;
int fontSize;
String fps;
PFont font;

int counter = 1;

void setup() {
  size(640, 360);
  noStroke();

  rectMode(CENTER);

  font = loadFont("ComicSansMS-24.vlw");    //eller din egen font
  textFont(font);
  fontSize = 24;
  // Create an empty ArrayList (will store Ball objects)
  balls = new ArrayList<Ball>();

  // Start by adding one element
  //balls.add(new Ball(width/2, 0, ballWidth, random(min,max)));
  balls.add(new Ball(0, 0, random(36, 60), random(min, max), counter));
}

void draw() {
  background(255);

  fps = nf(frameRate, 0, -1);
  fill(0, 255, 0);
  textAlign(LEFT);
  text(fps, width-fontSize*1.5, fontSize);

  // With an array, we say balls.length, with an ArrayList, we say balls.size()
  // The length of an ArrayList is dynamic
  // Notice how we are looping through the ArrayList backwards
  // This is because we are deleting elements from the list  
  for (int i = balls.size()-1; i >= 0; i--) { 
    // An ArrayList doesn't know what it is storing so we have to cast the object coming out
    Ball ball = balls.get(i);
    ball.move();
    ball.display();
    if (ball.finished()) {
      // Items can be deleted with remove()
      balls.remove(i);
    }
  }
}

void mousePressed() {
  // A new ball object is added to the ArrayList (by default to the end)
  balls.add(new Ball(mouseX, mouseY, random(36, 60), random(min, max), counter));
  counter++;
  if (counter > 3){
     counter = 1; 
  }
  println(balls.size());
}
