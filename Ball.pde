class Ball {
  int number;
  double x;
  double y;
  double xvel;
  double yvel;
  
  Ball(int number, double x, double y, double xvel, double yvel) {
    this.number = number;
    this.x = x;
    this.y = y;
    this.xvel = xvel;
    this.yvel = yvel;
  }
  
  void draw_() {
    noFill();
    stroke(0);
    strokeWeight(1);
    ellipseMode(CENTER);
    ellipse((float)this.x, (float)this.y, (float)__DIAMETER, (float)__DIAMETER);
    
    if(number > 0) {
      fill(0);
      textAlign(CENTER,CENTER);
      textSize(18);
      text(number, (float)this.x, (float)this.y-3);
    }
  }
  
  void detectCollision(int curr) {
    for(int i = 0; i < __NUM_BALLS; ++i) {
      if(i == curr) {continue;}
      double distanceBetweenCirclesSquared = 
      (this.x - balls[i].x) * (this.x - balls[i].x) + 
      (this.y - balls[i].y) * (this.y - balls[i].y);
      
      if(distanceBetweenCirclesSquared < __DIAMETER * __DIAMETER) {
         reposition(balls[curr], balls[i]);
      }
    }
  }
  
  void reposition(Ball circle1, Ball circle2) {
    double angle = Math.atan2( circle2.y - circle1.y, circle2.x - circle1.x);
    
    double distanceBetweenCircles = 
    (double)Math.sqrt(
      (circle2.x - circle1.x) * (circle2.x - circle1.x) + 
      (circle2.y - circle1.y) * (circle2.y - circle1.y)
    );
    
    double distanceToMove = __DIAMETER - distanceBetweenCircles;
    
    circle2.x += (double)(Math.cos(angle) * distanceToMove);
    circle2.y += (double)(Math.sin(angle) * distanceToMove);
    
    rebound(circle1, circle2);
  }
  
  void rebound(Ball circle1, Ball circle2) {
    Vector2 tangentVector = new Vector2();
    // Vector perpendicular to (x, y) is (-y, x)
    tangentVector.y = (float)-( circle2.x - circle1.x );
    tangentVector.x = (float)(circle2.y - circle1.y);
    
    tangentVector.nor();
    
    Vector2 relativeVelocity = 
    new Vector2((float)(circle1.xvel - circle2.xvel), 
                (float)(circle1.yvel - circle2.yvel));
                
    float length = relativeVelocity.dot(tangentVector);
    
    Vector2 velocityComponentOnTangent = tangentVector.scl(length);
    
    Vector2 velocityComponentPerpendicularToTangent = relativeVelocity.sub(velocityComponentOnTangent);
    
    Vector2 velocityComponentPerpendicularToTangentWithEnergyLost = velocityComponentPerpendicularToTangent.scl(.98);
    
    circle1.xvel -= velocityComponentPerpendicularToTangent.x;
    circle1.yvel -= velocityComponentPerpendicularToTangent.y;
    
    circle2.xvel += velocityComponentPerpendicularToTangentWithEnergyLost.x;
    circle2.yvel += velocityComponentPerpendicularToTangentWithEnergyLost.y;
  }
  
  void move() {
    if(this.x + (__DIAMETER/2) >= 600 ||
       this.x - (__DIAMETER/2) <= 100) {
      this.xvel *= -1;
    }
    if(this.y + (__DIAMETER/2) >= 800 ||
       this.y - (__DIAMETER/2) <= 100) {
      this.yvel *= -1;
    }
    
    this.x += this.xvel;
    this.y += this.yvel;
    
    if(this.xvel < 0) {this.xvel /= (__FRICTION);}
    else if(this.xvel > 0) {this.xvel /= (__FRICTION);}
    
    if(this.yvel < 0) {this.yvel /= (__FRICTION);}
    else if(this.yvel > 0) {this.yvel /= (__FRICTION);}
  }
  
  void shoot(int currx, int curry) {
    double angle = Math.atan2(curry - this.y, currx - this.x);
    
    double power = 
    (double)Math.sqrt(
      (currx - this.x) * (currx - this.x) + 
      (curry - this.y) * (curry - this.y)
    );
    
    this.xvel += -(double)(Math.cos(angle) * power/5);
    this.yvel += -(double)(Math.sin(angle) * power/5);
  }
  
  void drawLine(int currx, int curry) {
    double angle = Math.atan2(curry - this.y, currx - this.x);
    
    double power = 
    (double)Math.sqrt(
      (currx - this.x) * (currx - this.x) + 
      (curry - this.y) * (curry - this.y)
    );
    
    fill(0);
    stroke(0);
    strokeWeight(1);
    line((float)this.x, (float)this.y, (float)(this.x - (Math.cos(angle) * power)), (float)(this.y - Math.sin(angle) * power));
  }
}
