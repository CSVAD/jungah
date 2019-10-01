//Draw SpongeBob 
//created by Jungah Son September 30 2019.
//modified Jennifer Jacobs's 'Hello World Portrait' code. 

//set the size of the canvas to 600 x 600 pixels
size(600,600);

//set the background color to black
background(0,0,0);

//set the rect mode to center. All calls to rect() will now interpret the first two parameters as the shape's center point, while the third and fourth parameters are its width and height.
rectMode(CENTER);

//set the fill to red. Whatever will be drawn after that will have a fill color of red.
fill(255,255,0);
//draw a 300 x 300 rectangle in the center of the canvas
rect(width/2,height/2,300,300);

//set the fill to white
strokeWeight(4);
fill(255,255,255);
//draw two white circles (the eyes)
circle(width/2-40,height/2-60, 80);
circle(width/2+40,height/2-60, 80);

//set the fill to black
fill(113,206,206);
strokeWeight(4); 
//draw two blue circles (the pupils)
circle(width/2-25,height/2-60,28);
circle(width/2+25,height/2-60,28);

//draw two black circles (the pupils)
fill(0,0,0);
circle(width/2-25,height/2-60,10);
circle(width/2+25,height/2-60,10);

//set ellipse mode to center
ellipseMode(CENTER);

//draw an ellipse in the center of the canvas (the mouth)
noFill();
strokeWeight(3); 
arc(width/2, height/2-10, 160, 70, 0, PI);
//arc(50, 55, 80, 80, PI+QUARTER_PI, TWO_PI);

//draw a nose 
arc(width/2, height/2-14, 37, 45, PI, TWO_PI+PI/6);
//arc(50, 55, 80, 80, PI+QUARTER_PI, TWO_PI);

//set the stroke weight to two pixels. 
strokeWeight(2); 
//draw two lines at the edge of the mouth
arc(width/2.7, height/2-7, 15, 10, PI, TWO_PI);
arc(width/1.58, height/2-7, 15, 10, PI, TWO_PI);

// red cheeks 
strokeWeight(4); 
stroke(255,0,0); 
arc(width/2.76, height/2-20, 40, 30, PI/1.4, TWO_PI/0.97);
arc(width/1.58, height/2-20, 40, 30, PI/1.4, TWO_PI/0.97);

// Teeth 
stroke(0,0,0); 
strokeWeight(2.5);
fill(255,255,255);
rect(width/1.85, height/1.762, 30, 30, 0, 9.5, 0, 0);
rect(width/2.15, height/1.762, 30, 30, 9.5, 0, 0, 0);

// freckles 
fill(139,191,87);
noStroke(); 
ellipse(width/1.5, height/1.762, 30, 40);
ellipse(width/1.47, height/1.57, 20, 30);
ellipse(width/2.9, height/1.57, 30, 40);
ellipse(width/3.3, height/1.762, 20, 30);
ellipse(width/2.9, height/3.5, 30, 40);
ellipse(width/3.0, height/2.9, 20, 25);
ellipse(width/1.5, height/3.5, 20, 25);
