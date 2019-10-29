import controlP5.*;
import drawing.library.*;
import processing.pdf.*;

int shapeType = 0; 
int changeShape = 0; 

// control P5 vars
ControlP5 controlP5;

DropdownList type;

DrawingManager drawingManager;
DShape shape; 

void setup() {
  size(1056,816,P3D);
  background(255);
  
  controlP5 = new ControlP5(this);

  drawingManager = new DrawingManager(this);
  
  color activeColor = color(0,130,164);
  
  //controlP5.setAutoDraw(true);
  controlP5.setColorActive(activeColor);
  controlP5.setColorBackground(color(170));
  controlP5.setColorForeground(color(50));
  controlP5.setColorCaptionLabel(color(50));
  controlP5.setColorValueLabel(color(255));
  
  type = controlP5.addDropdownList("shapeType")
          .setBackgroundColor(color(190))
          .setSize(110, 500) 
          .setPosition(50, 50)
          .addItem("Ellipse", 0)
          .addItem("Rectangle", 1) 
          .addItem("Triangle", 2) 
          .addItem("Ellipse_inside_Ellipse", 3) 
          .addItem("Bubble",4) 
          .addItem("Ellipse_and_Rect",5) 
          .addItem("Check",6)   
          ; 
           
  type.setColorActive(color(255, 128));
   
 }

void draw() {
  controlP5.show();
  controlP5.draw();
}

void controlEvent(ControlEvent theEvent) {
  /*if (theEvent.isGroup()) {
    // check if the Event was triggered from a ControlGroup
    println("event from group : "+theEvent.getGroup().getValue()+" from "+theEvent.getGroup());
  } 
  else if (theEvent.isController()) {
    println("event from controller : "+theEvent.getController().getValue()+" from "+theEvent.getController());
  }*/
  
  if(theEvent.isFrom("shapeType")) { 
    background(255);
  } 
}

void keyPressed() {
  if(key == ' '){
    drawingManager.savePDF();
  }
   if(key == 'c'){
    drawingManager.clear();
  }
}

void mousePressed(){
   shape = drawingManager.addShape(); 
 
}

void mouseDragged(){
   //ArrayList<DShape> drips = new ArrayList<DShape>();
   ArrayList<DPoint> savedVerticies = new ArrayList<DPoint>();
   for(int i=0;i<shape.vertices.size();i+=1){
       savedVerticies.add(shape.vertices.get(i)); 
  }
  
   
   
   drawingManager.stroke(0,0,0);
   
   variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
   
}

void variableEllipse(int x, int y, int px, int py) {
  float speed = abs(x-px) + abs(y-py);
  //drawingManager.ellipse(x,y,speed,speed); 
  //drawingManager.noFill();  
  
  //drawingManager.fill(0,0,0);
  println(speed); 
  
  if (shapeType == 0) {
      drawingManager.ellipse(x,y,speed,speed); 
  } 
  else if (shapeType == 1) { 
      drawingManager.rect(x,y,speed,speed);
  }
  else if (shapeType == 2) {
      drawingManager.stroke(0,0,0);
      int xDist = mouseX-pmouseX;
      int yDist = mouseY-pmouseY;
      float theta = atan2(xDist,yDist);
      
      drawingManager.pushMatrix();
      drawingManager.translate(mouseX,mouseY);
      drawingManager.rotate(TWO_PI-theta);
      //drawingManager.triangle(-10,0, 10, 0, 0,random(10,100));
      //drawingManager.triangle(-10,0, 10, 0, 0,random(10,100));
      int alpha = round(map(speed,0,40,10,100));
      drawingManager.triangle(-10,0, 10, 0, 0, alpha); 
      //drawingManager.triangle(-10,0, 10, 0, 0, sqrt(300));
      drawingManager.popMatrix();
  } 
  else if (shapeType == 3) { 
      /*drawingManager.rect(x,y,speed,speed); 
      drawingManager.fill(0,0,0);
      drawingManager.ellipse(x-speed/3,y-speed/3,speed/1.5,speed/1.5);
      drawingManager.noFill();*/ 
      
      drawingManager.ellipse(x,y,speed,speed); 
      drawingManager.fill(0,0,0);
      
      drawingManager.ellipse(x,y,speed/2,speed/2);
      drawingManager.noFill(); 
  } 
  else if (shapeType == 4) { 
      drawingManager.fill(0,0,0);
      drawingManager.ellipse(x,y,speed,speed); 
      drawingManager.fill(255,255,255);
      drawingManager.ellipse(x,y,speed/1.5,speed/1.5); 
  } 
  else if (shapeType == 5) {
      drawingManager.rect(x,y,speed,speed);
      drawingManager.fill(0,0,0);
      drawingManager.ellipse(x,y,speed/2,speed/2);
      drawingManager.noFill();
  } 
  else { 
      /*drawingManager.pushMatrix();
      drawingManager.translate(mouseX,mouseY);
      //drawingManager.line(-10,0, 10, 0);
      //drawingManager.line(0,-10, 0, 10);
      drawingManager.line(-10,-10, 10, 10);
      drawingManager.popMatrix();
      */
      
      //drawingManager.ellipse(x,y,speed,speed); 
      drawingManager.pushMatrix();
      drawingManager.translate(mouseX,mouseY);
      //drawingManager.line(-10,0, 10, 0);
      //drawingManager.line(0,-10, 0, 10);
      //drawingManager.line(0,-speed/2, 0, speed/2);
      drawingManager.line(-speed/2, -speed/2, speed/2,speed/2);
      drawingManager.line(-speed/2, speed/2, speed/2, -speed/2);
      drawingManager.popMatrix();
      
  } 
 }
 
 
