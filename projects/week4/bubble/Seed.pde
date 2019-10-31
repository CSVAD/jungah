class Seed {
  PShape seedShape;
  PVector oldPosition; 
  PVector position;
  PVector velocity;
  float gravity; 
  PVector acceleration;
  float scale;
  int alpha;

  Seed(PVector l, PShape _seedShape, int _alpha) {
    acceleration = new PVector(0, 0.05);
    gravity = 0.005; 
    
    velocity = l.copy().normalize();
    position = l.copy();
    scale = 1;
    alpha = _alpha;
    //seedShape = _seedShape;
    //seedShape = createShape(RECT, 0, 0, initialShapeSize, initialShapeSize);
    seedShape = createShape(shapekind, 0, 0, initialShapeSize, initialShapeSize);
  }

  void run(color c) {
    velocity.y -= gravity; 
    update();
    display(c);
  }

  // Method to update position
  void update() {
    oldPosition = position; 
    
    //position.add(velocity);
    position.x += velocity.x; 
    position.y += velocity.y; 
    
    float mag = position.mag();
    //scale =  map(mag, 0,300,1.5,0.1);
    scale =  map(mag, 0, 300, 0.5, 1.5);
  }


  // Method to display
  void display(color c) {
    
    float theta = position.heading();
    pushMatrix();
    translate(position.x,position.y);
    rotate(theta);
    
    scale(scale/2,scale/2);
    
    noStroke();
    fill(c,alpha); 
    //fill(255,0,0,alpha);
    shape(seedShape,0,0);
    
    popMatrix();  
    
  }

  // Is the particle still useful?
  boolean isDead() {  
    if (scale > 5.0) {
      return true;
    } else {
      return false;
    }
  }
}
