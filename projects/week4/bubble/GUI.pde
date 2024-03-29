// M_1_5_03_TOOL.pde
// Agent.pde, GUI.pde
// 
// Generative Gestaltung, ISBN: 978-3-87439-759-9
// First Edition, Hermann Schmidt, Mainz, 2009
// Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
// Copyright 2009 Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
//
// http://www.generative-gestaltung.de
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

void setupGUI(){
  color activeColor = color(0,130,164);
  controlP5 = new ControlP5(this);
  //controlP5.setAutoDraw(false);
  controlP5.setColorActive(activeColor);
  controlP5.setColorBackground(color(170));
  controlP5.setColorForeground(color(50));
  controlP5.setColorCaptionLabel(color(50));
  controlP5.setColorValueLabel(color(255));

  ControlGroup ctrl = controlP5.addGroup("menu",15,25,35);
  ctrl.setColorLabel(color(255));
  ctrl.close();

  sliders = new Slider[10];

  int left = 0;
  int top = 5;
  int len = 300;

  int si = 0;
  int posY = 0;

  sliders[si++] = controlP5.addSlider("dandelionCount",1,50,left,top+posY+0,len,15);
  posY += 20;
  sliders[si++] = controlP5.addSlider("seedCount",20,100,left,top+posY+0,len,15);
  posY += 20;
  sliders[si++] = controlP5.addSlider("rotationVariance",10,100,left,top+posY+0,len,15);
  posY += 20;
  sliders[si++] = controlP5.addSlider("velocityScaling",10,100,left,top+posY+0,len,15);
  posY += 20;
  sliders[si++] = controlP5.addSlider("initialShapeSize",10,100,left,top+posY+0,len,15);

  posY += 50;
  
  controlP5.addButton("ellipse") 
      .setPosition(left, top+posY+0)
      .setSize(len/2,15) 
      ; 
      
  posY += 20;    
      
  controlP5.addButton("rect") 
      .setPosition(left, top+posY+0) 
      .setSize(len/2,15) 
      ; 
      
  //customize(d1); 

  for (int i = 0; i < si; i++) {
    sliders[i].setGroup(ctrl);
    sliders[i].setId(i);
    sliders[i].getCaptionLabel().toUpperCase(true);
    sliders[i].getCaptionLabel().getStyle().padding(4,3,3,3);
    sliders[i].getCaptionLabel().getStyle().marginTop = -4;
    sliders[i].getCaptionLabel().getStyle().marginLeft = 0;
    sliders[i].getCaptionLabel().getStyle().marginRight = -14;
    sliders[i].getCaptionLabel().setColorBackground(0x99ffffff);
  }

}

void drawGUI(){
  controlP5.show();
  controlP5.draw();
}

// called on every change of the gui
void controlEvent(ControlEvent theEvent) {
  //println("got a control event from controller with id "+theEvent.getController().getId());
  // noiseSticking changed -> set new values
  if(theEvent.isController()) {
    if (theEvent.getController().getId() == 3) {
      for(int i=0; i<seedSystems.size(); i++) seedSystems.get(i);
    }
  }
  println(theEvent.getController().getName());
}

public void ellipse(int theValue) {
  println("a button event from ellipse");
  shapekind = ELLIPSE;  
}

public void rect(int theValue) {
  println("a button event from rect");
  shapekind = RECT;  
}
