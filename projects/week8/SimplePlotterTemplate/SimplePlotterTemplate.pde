

import processing.pdf.*;

size(792,612);

beginRecord(PDF, "plot.pdf"); 
noFill();
//write code for whatever geometry you want to plot here.
float x; 
float y; 
x = 0.0; y = height/3; 
// smaller star shape (pink) 
for(int i=1;i<101;i++){
  for(int j=1;j<50;j++){ 
  float theta = 2*(PI/100)*(i);
  float theta_2 = 2*(PI/100)*(j/2);
 
  float px; float py; 
  px = x; 
  py = y; 
  
  float r = 1.0 + sin(6*theta)*0.2;  
  
  float r1 = 0.6 + sin(6*theta) * 0.1;
  float r2 = 0.2 + sin(4*theta_2)*0.05;
  
  float s = r2 * cos(theta_2) + r1; 
  
  x = 0.9 * s * sin(theta)*width/3;  
  y = 0.9 * s * cos(theta)*width/3;  
  
  stroke(0,0,0);    
  ellipse(x+width/2,y+height/2,1,1); 
  //line(px+width/2,py+height/2,x+width/2,y+height/2);
  } 
}


// outermost (orange)  

x = 0.0; y = height/3; 
for(int i=1;i<101;i++){
  
  float theta = 2*(PI/100)*(i);
  
  float px; float py; 
  px = x; 
  py = y; 
  
  float r = 1.0 + sin(6*theta)*0.2; 
  x = 0.9 * r * sin(theta)*width/3;
  y = 0.9 * r * cos(theta)*height/3; 
  ellipse(x+width/2,y+height/2,2,2); 
  //rect(px+width/2,py+height/2,2,2); 
} 

// middle (red) 
x = 0.0; y = height/3; 
for(int i=1;i<101;i++){
  for(int j=1;j<50;j++){ 
  float theta = 2*(PI/100)*(i);
  float theta_2 = 2*(PI/100)*(j/2);
 
  float px; float py; 
  px = x; 
  py = y;  
  
  float r1 = 0.6 + sin(6*theta) * 0.1;
  float r2 = 0.2 + sin(4*theta_2)*0.05;
  float r = 0.8 + sin(6*theta + 2*theta_2)*0.2;  
  
  float s = r2 * cos(theta_2) + r1; 
  
  x =  0.9 * r * sin(theta)*width/3;  
  y =  0.9 * r * cos(theta)*width/3;  
  
  stroke(0,0,0);
  int xDist = (int)(x+width/2-px);
  int yDist = (int)(y+height/2-py);
  float theta2 = atan2(xDist,yDist);

   
  ellipse(x+width/2,y+height/2,1,1); 
  
  
  r = 1.0 + sin(2*theta_2)*0.2;   
  s = cos(theta_2) + 1.0; 
  
  x = 0.12 * s * sin(theta)*width/3;  
  y = 0.12 * s * cos(theta)*width/3;  
  
  } 
}

x = 0.0; y = height/3; 
// seed (yellow) 
for(int i=1;i<101;i++){
  for(int j=1;j<50;j++){ 
  float theta = 2*(PI/100)*(i);
  float theta_2 = 2*(PI/100)*(j/2);
  //println(degrees(theta));
  
  
  /*float x = sin(theta)*width/2.25;
  float y = cos(theta)*height/2.25;*/
  float px; float py; 
  px = x; 
  py = y; 
  
  
  float r1 = 0.6 + sin(6*theta) * 0.1;
  float r2 = 0.2 + sin(4*theta_2)*0.05;
  float r = 0.8 + sin(6*theta + 2*theta_2)*0.2;  
  
  float s = r2 * cos(theta_2) + r1; 
  
  x =  0.9 * r * sin(theta)*width/3;  
  y =  0.9 * r * cos(theta)*width/3;  
  
  stroke(0,0,0);
  int xDist = (int)(x+width/2-px);
  int yDist = (int)(y+height/2-py);
  float theta2 = atan2(xDist,yDist);

   
  //ellipse(x+width/2,y+height/2,1,1); 
  
  
  r = 1.0 + sin(2*theta_2)*0.2;   
  s = cos(theta_2) + 1.0; 
  
  x = 0.12 * s * sin(theta)*width/3;  
  y = 0.12 * s * cos(theta)*width/3;  
  ellipse(x+width/2,y+height/2,1,1);
  
  } 
}

endRecord();
