/**

 * Added general color picker from online to pick initial value (upper left corner)  
*/ 


int temp;
int wd, ht; 
float mousepos_x, mousepos_y; 
int cnt = 0; 
 
ColorPicker cp; 


import controlP5.*;
import drawing.library.*;
 
DrawingManager drawingManager; 
DShape shape;  

ArrayList<String> drops; 

 

ControlP5 cp5;

 

void setup() {

  size(1056, 816);
  

  frameRate(20); 

  cp5 = new ControlP5(this);
  drawingManager = new DrawingManager(this);

 

  drops = new ArrayList<String>();

  for(int i=0;i<100;i++) {

    drops.add("item "+i);

  }

  

  color activeColor = color(0,130,164);

  

  //controlP5.setAutoDraw(true);

  cp5.setColorActive(activeColor);

  cp5.setColorBackground(color(170));

  cp5.setColorForeground(color(50));

  cp5.setColorCaptionLabel(color(50));

  cp5.setColorValueLabel(color(255));


  

  // add mousewheel support, now hover the slide with your mouse

  // and use the mousewheel (or trackpad on a macbook) to change the 

  // value of the slider.   

  addMouseWheelListener();

  smooth();

 

  ellipseMode(RADIUS);

 

  noStroke();

 
  wd = 200; 
  ht = 200; 
  

  //cp = new ColorPicker( 10, 10, 400, 400, 255 );
  rect(0,0, wd-60, ht);
  cp = new ColorPicker( 0, 0, wd, ht, 255 );
  
  noStroke();
 fill(0x000000);  
 rect(0,height-60, width, 60);
 
}

 

 

void draw() {

 // background(255);
 cp.render(); 
 
} 

 

public class ColorPicker 

{

  int x, y, w, h, c;

  PImage cpImage;


  public ColorPicker ( int x, int y, int w, int h, int c )

  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;

    cpImage = new PImage( w, h );

    init();

  }  

  private void init ()
  {
    // draw color.
    //createWheel(width/2, height/2, SHADE);

    int cw = w - 60;

    for( int i=0; i<cw; i++ ) 
    {

      float nColorPercent = i / (float)cw;

      float rad = (-360 * nColorPercent) * (PI / 180);

      int nR = (int)(cos(rad) * 127 + 128) << 16;

      int nG = (int)(cos(rad + 2 * PI / 3) * 127 + 128) << 8;

      int nB = (int)(Math.cos(rad + 4 * PI / 3) * 127 + 128);

      int nColor = nR | nG | nB;

      

      setGradient( i, 0, 1, h/2, 0xFFFFFF, nColor );

      setGradient( i, (h/2), 1, h/2, nColor, 0x000000 );

    }

  }

 

  private void setGradient(int x, int y, float w, float h, int c1, int c2 )

  {

    float deltaR = red(c2) - red(c1);

    float deltaG = green(c2) - green(c1);

    float deltaB = blue(c2) - blue(c1);

 

    for (int j = y; j<(y+h); j++)

    {

      int c_ = color( red(c1)+(j-y)*(deltaR/h), green(c1)+(j-y)*(deltaG/h), blue(c1)+(j-y)*(deltaB/h) );

      cpImage.set( x, j, c_ );

    }

  }

  

  private void drawRect( int rx, int ry, int rw, int rh, int rc )

  {

    for(int i=rx; i<rx+rw; i++) 

    {

      for(int j=ry; j<ry+rh; j++) 

      {

        cpImage.set( i, j, rc );

      }

    }

  }  

  

  public void render ()

  {

    image( cpImage, x, y );

    if( mousePressed &&
    mouseX >= x && 
    mouseX < x + w &&
    mouseY >= y &&
    mouseY < y + h )
    {
      c = get( mouseX, mouseY );
      mousepos_x = mouseX; 
      mousepos_y = mouseY; 
    }
        
    temp = c; 
    fill(c);

    rect( x, y+h+10, 20, 20 );

  }

}

 

void controlEvent(ControlEvent event) {

  println(event);
}

 

// When working in desktop mode, you can add mousewheel support for 

// controlP5 by using java.awt.event.MouseWheelListener and 

// java.awt.event.MouseWheelEvent

 

void addMouseWheelListener() {

  frame.addMouseWheelListener(new java.awt.event.MouseWheelListener() {

    public void mouseWheelMoved(java.awt.event.MouseWheelEvent e) {

      cp5.setMouseWheelRotation(e.getWheelRotation());

    }

  }

  );

}

void mousePressed(){
  
  
  if (mouseButton == LEFT){ 
    
    {
   shape = drawingManager.addShape(); 
   //variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
   
   int newcolor = get((int)(mousepos_x), (int)(mousepos_y )); 
  
  int R = (newcolor >> 16) & 0xff;
   int G = (newcolor >>  8) & 0xff;
   int B = (newcolor      ) & 0xff;
   
  
  drawingManager.noStroke();     
    
  drawingManager.fill(R, G, B);
  drawingManager.ellipse(mouseX,mouseY,20,20);
    }
  } 
  else { 
    //rect(0,height-60, width, 60);
    
    int palletecolor = get((int)(mouseX), (int)(mouseY)); 
  
    int R = (palletecolor >> 16) & 0xff;
    int G = (palletecolor >>  8) & 0xff;
    int B = (palletecolor      ) & 0xff;
    fill(R,G,B); rect(0+ 60*cnt,height-60,60,60); 
    
    cnt = cnt + 1; 
    if (cnt == 18) {
      cnt = 0; 
    } 
  } 
}

void mouseDragged(){
  if (mouseButton == LEFT){ 
   //ArrayList<DShape> drips = new ArrayList<DShape>();
   ArrayList<DPoint> savedVerticies = new ArrayList<DPoint>();
   for(int i=0;i<shape.vertices.size();i+=1){
       savedVerticies.add(shape.vertices.get(i)); 
   }
  
   drawingManager.stroke(0,0,0);
   
   variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
  } 
   
}

void variableEllipse(int x, int y, int px, int py) {
  float speed = abs(x-px) + abs(y-py);   
  
  // Change colors 
  
  int dist_x = x - px; 
  int dist_y = y - px; 
  
  float new_x =  speed * wd * dist_x/width;  
  float new_y =  speed * ht * dist_y/height; 
  
  float update_x; 
  float update_y; 
  
  update_x = (mousepos_x + new_x); 
  update_y = (mousepos_y + new_y);
    
    if ((update_x) < 0.0){
      update_x = 0.0;  
    }  
    else if ((update_x) > wd){ 
      update_x = wd;   
    }
    if ((update_y) < 0.0){  
      update_y = 0.0;    
    }
    else if ((update_y) > ht){  
      update_y = ht;    
    }
     
  
  int newcolor = get((int)(update_x), (int)(update_y)); 
  int R = (newcolor >> 16) & 0xff;
  int G = (newcolor >>  8) & 0xff;
  int B = (newcolor      ) & 0xff;
  
  drawingManager.noStroke(); 
      
    
  
  drawingManager.fill(R, G, B);
  drawingManager.ellipse(x,y,20,20);
 }
 
int sgn(float f) {
  if (f > 0) 
    return 1;
  else if (f <= 0) 
    return -1;
  return 1; 
  //return 0;
} 
