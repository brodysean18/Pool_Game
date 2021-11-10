import java.util.Random;
import java.lang.Math;

final int __DIAMETER = 30;
final int __NUM_BALLS = 16;
final float __FRICTION = 1.015;
Ball[] balls = new Ball[__NUM_BALLS];

boolean validStartPosition = false;

void initializeBalls() {
  Random rand = new Random();
  
  for(int i = 0; i < __NUM_BALLS; ++i) {
    balls[i] = new Ball(i, rand.nextInt(500 - __DIAMETER) + (100 + __DIAMETER/2), rand.nextInt(700 - __DIAMETER) + (100 + __DIAMETER/2), 0, 0);//((rand.nextDouble() * 100) % 20) - 10, ((rand.nextDouble() * 100) % 20) - 10);
  }
  
  //balls[0] = new Ball(200, 200, 0, 0);
  //balls[1] = new Ball(230, 200, 0, 0);
  //balls[2] = new Ball(260, 200, 0, 0);
  //balls[3] = new Ball(290, 200, 0, 0);
  //balls[4] = new Ball(320, 200, 0, 0);
  //balls[5] = new Ball(215, 225, 0, 0);
  //balls[6] = new Ball(245, 225, 0, 0);
  //balls[7] = new Ball(275, 225, 0, 0);
  //balls[8] = new Ball(305, 225, 0, 0);
  //balls[9] = new Ball(230, 250, 0, 0);
  //balls[10] = new Ball(260, 250, 0, 0);
  //balls[11] = new Ball(290, 250, 0, 0);
  //balls[12] = new Ball(245, 275, 0, 0);
  //balls[13] = new Ball(275, 275, 0, 0);
  //balls[14] = new Ball(260, 300, 0, 0);
  
  //balls[15] = new Ball(260, 700, -0.000001, -1);
}

void drawBalls() {
  for(int i = 0; i < __NUM_BALLS; ++i) {
    balls[i].draw_();
  }
}

void detectCollisions() {
  for(int i = 0; i < __NUM_BALLS ; ++i) {
      balls[i].detectCollision(i);
  }
}

void moveBalls() {
  for(int i = 0; i < __NUM_BALLS; ++i) {
    balls[i].move();
  }
}

void refreshScreen() {
  background(120);
  fill(255);
  rect(100, 100, 500, 700);
  drawRefreshButton();
}

void drawRefreshButton() {
  fill(#E52020);
  stroke(255);
  ellipseMode(CENTER);
  ellipse(350, 850, 80, 80);
}

void printMouse() {
  println("mouseX: " + mouseX);
  println("mouseY: " + mouseY);
}

void setup() {
  size(700, 900);
  refreshScreen();
  initializeBalls();
  
  //balls[0] = new Ball(150, 150, 0.1, 0.1);
  //balls[1] = new Ball(155, 155, 0, 0);
}

void draw() {
  //printMouse();
  
  refreshScreen();
  
  drawBalls();
  detectCollisions();
  moveBalls();
  if(validStartPosition) {balls[0].drawLine(mouseX, mouseY);}
}

void mousePressed() {
  double distance = Math.sqrt(((mouseX - 350) * (mouseX - 350)) + ((mouseY - 850) * (mouseY - 850)));
  
  if(distance <= 40) {
    setup();
  }
  
  //for(int i = 0; i < __NUM_BALLS; ++i) {
    distance = Math.sqrt(((mouseX - balls[0].x) * (mouseX - balls[0].x)) + ((mouseY - balls[0].y) * (mouseY - balls[0].y)));
    if(distance <= __DIAMETER/2) {
      validStartPosition = true;
    }
  //}
}

void mouseReleased() {
  if(validStartPosition) {
    balls[0].shoot(mouseX, mouseY);
    validStartPosition = false;
  }
}
