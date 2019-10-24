class SeedSystem {
  ArrayList<Seed> seeds;
  PVector origin;
  PShape seedShape;
  PVector stemCurvePosition;
  color c; 
  int alpha;
  float sd;

  SeedSystem(PShape _seedShape, PVector position, int seedCount, float _sd, color _c, int _alpha) {
    origin = position.copy();
    seeds = new ArrayList<Seed>();
    seedShape = _seedShape;
    //seedShape = createShape(ELLIPSE, 0, 0, initialShapeSize, initialShapeSize);
    seedShape.disableStyle();
    c = _c; 
    alpha = _alpha;
    sd = _sd;
    PVector gausVector = new PVector(randomGaussian(),randomGaussian());
     stemCurvePosition = gausVector.mult(100);
     generateSeeds();
  }

  void generateSeeds(){
     for(int i =0;i<seedCount;i++){
       this.addSeed(sd);  
     }
  }

  void addSeed(float sd) {
    float xVal = randomGaussian();
    float yVal = randomGaussian();
    PVector gauss = new PVector(xVal,yVal);
    PVector position = gauss.mult(sd).add(origin);
    PVector delta = origin.copy().sub(position);
    seeds.add(new Seed(delta,seedShape,alpha));
  }

  void update() {
    
    if(seeds.size()==0){
     generateSeeds(); 
    }   
    drawStem();
    pushMatrix();
      translate(origin.x,origin.y);
      //drawStem();
    for (int i = seeds.size()-1; i >= 0; i--) {
      Seed s = seeds.get(i);
      
      
      s.run(c);
      
      if (s.isDead()) {
        seeds.remove(i);
      }
    }
    popMatrix();
  }
  
  void drawStem(){

    noFill();
    //stroke(255,255,255,alpha);
    
    fill(102,178,255, alpha);
    rect(0, 570, 1400, 750); 
    //arc(650, 570, 1400, 750, 0, PI, CHORD);
    //arc(479, 300, 280, 280, PI+QUARTER_PI, OPEN);
    
    noStroke(); 
  }
  
}
