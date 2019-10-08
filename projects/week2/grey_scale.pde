//modified truchet tiling 1

float rW = 70;
float rH = 70;
float[] pattern = {1,0.25,0.5,0.75};

int repeat = 5;

void setup(){
  size(800,800);
  background(0);
  noFill();
  //stroke(192,192,192);
  stroke(255);
  noStroke();
   for(int j=0;j<height/rH;j++){
      int t = 0;
      float trans = 0.0; 
     //check to see if row is even or odd
      if(j%2 !=0){
        t = pattern.length/2;
        trans = rH;  
      }
      for(int i=0;i<width/rW;i++){
        float v = pattern[0];
        float r = toQuadrant(v)/2;
      
        if (j%2 != 0){  
          drawSeed(i*rW*2 + rW,j*rH*2,r,trans, 1, 128, repeat); // 1st call (diamond)
        } 
        else{
          drawSeed(i*rW*2,j*rH*2,r,trans, 1, 128, repeat); // 1st call (diamond)
        } 
        
        t++;
        if(t>pattern.length-1){
          t = 0;
        }
      }
   }
    
    
  for(int j=0;j<height/rH;j++){
      int t = 0;
      float trans = 0.0; 
     //check to see if row is even or odd
      if(j%2 !=0){
        t = pattern.length/2;
        trans = rH;  
      }
      for(int i=0;i<width/rW;i++){
        float v = pattern[0];
        float r = toQuadrant(v)/2;
        
       
       if (j%2 != 0){  
          drawSeed(i*rW*2 - rW,j*rH*2 + rH ,r,trans, 2, 96, repeat); // 2nd call
        } 
        else{
          drawSeed(i*rW*2,j*rH*2 + rH,r,trans, 2, 96, repeat); // 2nd call
        } 
         
        t++;
        if(t>pattern.length-1){
          t = 0;
        }
      }
  }
  
  
  
  for(int j=0;j<height/rH;j++){
      int t = 0;
      float trans = 0.0; 
     //check to see if row is even or odd
      if(j%2 !=0){
        t = pattern.length/2;
        trans = rH;  
      }
      for(int i=0;i<width/rW;i++){
        float v = pattern[0];
        float r = toQuadrant(v)/2;
        // println(v,degrees(r),i);
        //drawSeed(i*rW,j*rH,r);
       
        
        if (j%2 != 0){  
          drawSeed(i*rW*2,j*rH*2 + rH,r,trans, 3, 192, repeat); // 3rd call (white side)
        } 
        else{
           drawSeed(i*rW*2+rW,j*rH*2 + rH,r,trans, 3, 192, repeat);   // 3rd call (white side)
        } 
        
        t++;
        if(t>pattern.length-1){
          t = 0;
        }
      }
  }
  
  
}

void draw(){
  
}

float toQuadrant(float v){
  if(v <=0.25){
    return 2*PI*0.25;
  }
  else if(v >0.25 && v<=0.5){
    return  2*PI*0.5;
  }
  else if(v >0.5 && v<=0.75){
    return  2*PI*0.75;
  }
  else{
     return 2*PI;
  }
}


void drawSeed(float x, float y,float r, float trans, int callnum, int col, int rep){
  int scale = 2; 
  int sheerangle = 1;  
  int s_quad = 2; 
  pushMatrix();
   float fixrW = 40; 
   float fixrH = 40; 
   translate(x-fixrW/2,y-fixrH/2); 
   
   //translate(x-rW/2,y-rH/2);
   shearX(PI/sheerangle);
   //shearY(PI/4);
   rotate(r);
   rectMode(CENTER);
   
   if(callnum == 2) {
     fill(col,col,col); 
     sheerangle = 4; 
     //rotate(PI/(sheerangle)); 
     shearY(PI/sheerangle);
     rotate(PI/2);
     rect(0,0,rW,rH); 
     
    // scale(1, -1);
    for(int k =0;k<(rep-1);k++){ 
     
       rectMode(CORNER);    
      
       fill(col*(k + 0.5)/2, col*(k + 0.5)/2, col*(k + 0.5)/2); //grey 
       
       sheerangle = 4;
       
       rect(0,0,rW/(k+2),rH/(k+2));
   
     } 
     
     popMatrix();
   } 
   else if(callnum == 1){  
   
     fill(col,col,col); //grey 
     sheerangle = 4; 
     translate(-rW/2,0);
     rotate(PI/(sheerangle)); 
     rotate(PI); 
     rect(0,0,sqrt(2)*rW,sqrt(2)*rH); 
     
     for(int k =0;k<(rep-1);k++){ 
     rectMode(CORNER);
     fill(col*(k + 0.5)/2, col*(k + 0.5)/2, col*(k + 0.5)/2); //diamond (middle color) 
     sheerangle = 4; 
     
     rect(0,0,sqrt(2)*rW/(k+2),sqrt(2)*rH/(k+2)); 
     } 
      
     popMatrix(); 
   }
   else{ 
     fill(col, col, col); 
     sheerangle = 4; 
     //rotate(PI/(sheerangle)); 
     shearY(2*PI - PI/sheerangle);
     rect(0,0,rW,rH); 
     
     for(int k =0;k<(rep-1);k++){ 
     rectMode(CORNER);
     fill(col*(k + 0.5)/2, col*(k + 0.5)/2, col*(k + 0.5)/2); //grey 
     sheerangle = 4;
     rect(0,0,rW/(k+2),rH/(k+2)); 
     } 
     popMatrix();
   } 
 //popMatrix();
  
}
