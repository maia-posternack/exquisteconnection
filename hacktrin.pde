// created by maia posternack and elizabeth ting during hacktrin XII
//import libraries
import controlP5.*;
ControlP5 cp5;
Accordion accordion;

//declare global variables
int typeOfDrawing; 
PGraphics head;
PGraphics body;
PGraphics feet;
int x,y;
int thickness = 2;
int outline_thickness = 2;
int eraser_thickness = 2;
int r = 250;
int g = 100;
int b = 100;
int greyscale = 100;
int r_2 = 100;
int g_2 = 250;
int b_2 = 250;
int greyscale_2 = 100;
color c1 = color(r,0,0);
color c2 = color(0,g_2,0);
int circY = 10 ;
int dotOneX1 = 10;
int dotOneY1 = 130;
int dotTwoX1 = 60;
int dotTwoY1 = 130;
int dotOneX2 = 10;
int dotOneY2 = 130;
int dotTwoX2 = 60;
int dotTwoY2 = 130;
int theme1 = int(random(0,24));
int theme2 = int(random(0,24));
int theme3 = int(random(0,24));
int partOfBody = 1; 
String [] themes =  {"alien","smile","cowboy","spongebob","fireman","docter", "sad", "bright", "smart", "happy","under the sea", "fish", "star", "baby", "plant", "flower","courage","valor","computer","digital","mouse","cat","dog","pineapple","pencil"};

//setup
void setup() {
  ///create canvas nad initialized the buffers
  size(800, 700);
  body = createGraphics(800,700); //
  body.beginDraw();
  body.background(255);
  body.endDraw();
  feet = createGraphics(800,700); //
  feet.beginDraw();
  feet.background(255);
  feet.endDraw();
  head = createGraphics(800,700); //
  head.beginDraw();
  head.background(255);
  head.endDraw();
  //create program
  gui();
}
void gui(){
  cp5 = new ControlP5(this);
  typeOfDrawing = 0;
   //menu bar for actions
   Group g1 = cp5.addGroup("pencil").setPosition(2, 12).setSize(199, 40).setColorBackground(color(0, 100, 255,200)).setBackgroundColor(color(200, 50));
     cp5.addSlider("thickness").setPosition(1,10).setSize(199,20).setRange(0,100).setColorCaptionLabel(0) .moveTo(g1);
     cp5.addButton("go_pencil").setPosition(1,35).setSize(199,20).moveTo(g1);
     cp5.addButton("closed_shape_pencil").setPosition(1,60).setSize(199,20).moveTo(g1);
   Group g2 = cp5.addGroup("shape").setPosition(2, 12).setSize(199, 40).setColorBackground(color(0, 100, 255,200)).setBackgroundColor(color(200, 50)).setBackgroundHeight(80);
     cp5.addSlider("outline_thickness").setPosition(1,10).setSize(199,20).setRange(0,100).setColorCaptionLabel(0) .moveTo(g2);
     cp5.addButton("line").setPosition(1,35).setSize(199,20).moveTo(g2);
     cp5.addButton("rectangle").setPosition(1,55).setSize(199,20).moveTo(g2);
     cp5.addButton("circle").setPosition(1,75).setSize(199,20).moveTo(g2);
   Group g3 = cp5.addGroup("eraser").setPosition(2, 12).setSize(199, 40).setColorBackground(color(0, 100, 255,200)).setBackgroundColor(color(200, 50));
     cp5.addSlider("eraser_thickness").setPosition(1,10).setSize(199,20).setRange(0,60).setColorCaptionLabel(0).moveTo(g3);
     cp5.addButton("go_eraser").setPosition(1,35).setSize(199,20).moveTo(g3);
   Group g4 = cp5.addGroup("color_1").setPosition(2, 12).setSize(199, 40).setBackgroundColor(color(200, 50)).setColorBackground(color(0, 100, 255,200)).setBackgroundHeight(160);
     cp5.addButton("choose_rgb").setPosition(1,2).setSize(199,20).moveTo(g4);
     cp5.addSlider("r").setPosition(1,24).setSize(199,15).setRange(0,255).setColorCaptionLabel(0) .moveTo(g4);
     cp5.addSlider("g").setPosition(1,41).setSize(199,15).setRange(0,255).setColorCaptionLabel(0) .moveTo(g4);
     cp5.addSlider("b").setPosition(1,57).setSize(199,15).setRange(0,255).setColorCaptionLabel(0) .moveTo(g4);
     cp5.addButton("choose_greyscale").setPosition(1,74).setSize(199,20).moveTo(g4);
     cp5.addSlider("greyscale").setPosition(1,96).setSize(199,15).setRange(0,255).setColorCaptionLabel(0) .moveTo(g4);
     cp5.addButton("red_1").setPosition(1,113).setSize(65,20).moveTo(g4).setColorBackground(color(255,0,0));
     cp5.addButton("orange_1").setPosition(68,113).setSize(65,20).setColorBackground(color(255,150,0)).moveTo(g4);
     cp5.addButton("yellow_1").setPosition(134,113).setSize(65,20).setColorBackground(color(255,255,0)).moveTo(g4);
     cp5.addButton("green_1").setPosition(1,135).setSize(65,20).setColorBackground(color(0,255,0)).moveTo(g4);
     cp5.addButton("blue_1").setPosition(68,135).setSize(65,20).setColorBackground(color(0,0,255)).moveTo(g4);
     cp5.addButton("purple_1").setPosition(134,135).setSize(65,20).setColorBackground(color(180,0,255)).moveTo(g4);
   Group g5 = cp5.addGroup("color_2").setPosition(2, 12).setSize(199, 40).setBackgroundColor(color(200, 50)).setColorBackground(color(0, 100, 255,200)).setBackgroundHeight(160);
     cp5.addButton("choose_rgb_2").setPosition(1,2).setSize(199,20).moveTo(g5);
     cp5.addSlider("r_2").setPosition(1,24).setSize(199,15).setRange(0,255).setColorCaptionLabel(0) .moveTo(g5);
     cp5.addSlider("g_2").setPosition(1,41).setSize(199,15).setRange(0,255).setColorCaptionLabel(0) .moveTo(g5);
     cp5.addSlider("b_2").setPosition(1,57).setSize(199,15).setRange(0,255).setColorCaptionLabel(0) .moveTo(g5);
     cp5.addButton("choose_greyscale_2").setPosition(1,74).setSize(199,20).moveTo(g5);
     cp5.addSlider("greyscale_2").setPosition(1,96).setSize(199,15).setRange(0,255).setColorCaptionLabel(0) .moveTo(g5);
     cp5.addButton("red_2").setPosition(1,113).setSize(65,20).moveTo(g5).setColorBackground(color(255,0,0));
     cp5.addButton("orange_2").setPosition(68,113).setSize(65,20).setColorBackground(color(255,150,0)).moveTo(g5);
     cp5.addButton("yellow_2").setPosition(134,113).setSize(65,20).setColorBackground(color(255,255,0)).moveTo(g5);
     cp5.addButton("green_2").setPosition(1,135).setSize(65,20).setColorBackground(color(0,255,0)).moveTo(g5);
     cp5.addButton("blue_2").setPosition(68,135).setSize(65,20).setColorBackground(color(0,0,255)).moveTo(g5);
     cp5.addButton("purple_2").setPosition(134,135).setSize(65,20).setColorBackground(color(180,0,255)).moveTo(g5);
   accordion = cp5.addAccordion("acc").setPosition(1,210).setWidth(200).addItem(g1).addItem(g2).addItem(g3).addItem(g4).addItem(g5);
   accordion.setCollapseMode(Accordion.SINGLE);

  //set up accordion 
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.open(0,1,2);}}, 'o');
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.close(0,1,2);}}, 'c');
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.setWidth(300);}}, '1');
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.setPosition(0,0);accordion.setItemHeight(190);}}, '2'); 
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.setCollapseMode(ControlP5.SINGLE);}}, '4');
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {cp5.remove("pencil");}}, '0');
  
  //more buttons to control buffers
  cp5.addButton("clear").setPosition(1, 200).setSize(200, 9).setColorBackground(color(0, 100, 255,200));
  cp5.addButton("head").setPosition(1, 1).setSize(200, 18).setColorBackground(color(0, 100, 255,200));
  cp5.addButton("body").setPosition(1, 20).setSize(200, 19).setColorBackground(color(0, 100, 255,200));
  cp5.addButton("legs").setPosition(1, 40).setSize(200, 19).setColorBackground(color(0, 100, 255,200));
  cp5.addButton("all").setPosition(1, 60).setSize(200, 19).setColorBackground(color(0, 100, 255,200));
    
}

//draw is built in useing libraries
void draw() {
  //if mouse is out of frame
  if((mouseX > 0) && (mouseX < 200) &&  (mouseY >80) && (mouseY <160)){
    typeOfDrawing = 0;
  }
  //switch between buffers
  if (partOfBody == 1){
    image(head,0,0); //draw buffer containing all head element
  }
  if (partOfBody == 2){
    image(body,0,0); //draw buffer containing all body element
  }
  if (partOfBody == 3){
    image(feet,0,0); //draw buffer containing all feet element
  }
  //if partOfBody is 4 show all the items together
  if (partOfBody == 4){
    fill(255);
    stroke(255);
    rect(0,0,800,700);
    scale(.33);
    image(head,802,0);
    image(body,802,dotOneY1);
    image(feet,802,dotOneY1+ dotOneY2);
    scale(3);
  }
  textSize(10);
  fill(0);
  strokeWeight(2);
  stroke(255,0,0);
  //show details
  //if drawing head
  if(partOfBody == 1){
    text(" draw the head of your character. click ",0,90);
    text(" 'body' or 'legs' for a friend to draw",0,100);
    text(" another part of the character. click 'all'",0,110);
    text(" to see your final drawing",0,120);
    text(" move the dots above to the bottom of your neck",0,150);
    text(" here's a prompt for your drawing:",0,160);
    text(" " +themes[theme1],0,170);
    //relocate the "connectors"
    circY = 10;
    ellipse(dotOneX1,dotOneY1,10,10);
    ellipse(dotTwoX1,dotTwoY1,10,10);
  }
  //if drawing body
  if(partOfBody == 2){
    text(" draw the body of your character. click ",0,90);
    text(" 'head' or 'legs' for a friend to draw",0,100);
    text(" another part of the character. click 'all'",0,110);
    text(" to see your final drawing",0,120);
    text(" move the dots above to the bottom of your torso",0,150);
    text(" here's a prompt for your drawing:",0,160);
    text(" " + themes[theme2],0,170);
    //relocate the "connectors"
    circY = 30;
    ellipse(dotOneX1,10,10,10);
    ellipse(dotTwoX1,10,10,10);
    text("connect your neck to these dots!",dotTwoX1 + 20,10);
    ellipse(dotOneX2,dotOneY2,10,10);
    ellipse(dotTwoX2,dotTwoY2,10,10);
  
  }
  //if drawing legs
  if(partOfBody == 3){
    text(" draw the legs of your character. click ",0,90);
    text(" 'body' or 'head' for a friend to draw",0,100);
    text(" another part of the character. click 'all'",0,110);
    text(" to see your final drawing",0,120);
    text(" here's a prompt for your drawing:",0,160);
    text(" "+ themes[theme3],0,170 );
    //relocate the "connectors"
    circY = 50;
    ellipse(dotOneX2,10,10,10);
    ellipse(dotTwoX2,10,10,10);
    text("connect your legs to these dots!",dotTwoX2 + 20,10);
  }
  //if showing completed product
  if(partOfBody == 4){
    text(" taddaaaa ",0,90);
    circY = 70;
  
  }

  //the connectors
  stroke(255,255,0);
  fill(255,255,0);
  strokeWeight(0);
  ellipse(215,circY,15,15);

  //the depiction of the current color
  stroke(c2);
  fill(c1);
  strokeWeight(2);
  rect(1,182,199,15);

  //if typeOfDrawing is 4 draw line
  if ((typeOfDrawing == 4)&& (mousePressed)){
    strokeWeight(outline_thickness);
    line(x,y,mouseX,mouseY);
  }
  //if typeOfDrawing is 5 draw rectangle
  if ((mousePressed)&&(typeOfDrawing == 5)){
    strokeWeight(outline_thickness);
    rect(x,y,mouseX-x, mouseY-y);
  }
  //if typeOfDrawing is 6 draw circle
  if ((mousePressed)&&(typeOfDrawing == 6)){
    strokeWeight(outline_thickness);
    ellipse(x,y, dist(x,y,mouseX,mouseY)*2, dist(x,y,mouseX,mouseY)*2);
  }
} //end draw function

///if dragging mouse 
void mouseDragged() {
  if(partOfBody == 1){
  switch(typeOfDrawing) {
    case 0: //automatic
      break;
    case 1: //pencil
      head.beginDraw();
      head.stroke(c2);
      head.fill(c1);
      head.strokeWeight(thickness);
      head.line(pmouseX, pmouseY, mouseX, mouseY); //p becase previous
      head.endDraw();
      break;
    case 2: //eraser
      head.beginDraw();
      head.stroke(255);
      head.strokeWeight(eraser_thickness);
      head.line(pmouseX, pmouseY, mouseX, mouseY); 
      head.endDraw();
      break;
    case 7: //closed shape pencil
      head.beginDraw();
      head.strokeWeight(thickness);
      head.stroke(c2);
      head.fill(c1);
      head.line(pmouseX, pmouseY, mouseX, mouseY); //p becase previous
      head.endDraw();
      break;
    } //end switch 
  //move "connectors" if necessary 
    if((mouseX < dotOneX1 + 15)&&(mouseX > dotOneX1 - 15)&&(mouseY < dotOneY1 + 15)&&(mouseY >dotOneY1 - 15)){
      dotOneX1 = mouseX;
      dotOneY1 = mouseY;
      typeOfDrawing = 0;
    }
    if((mouseX < dotTwoX1 + 15)&&(mouseX > dotTwoX1 - 15)&&(mouseY < dotTwoY1 + 15)&&(mouseY >dotTwoY1 - 15)){
      dotTwoX1 = mouseX;
      dotTwoY1 = mouseY;
      typeOfDrawing = 0;
    }
  } //end head
  if(partOfBody == 2){
  switch(typeOfDrawing) {
    case 0: //automatic
      break;
    case 1: //pencil
      body.beginDraw();
      body.stroke(c2);
      body.fill(c1);
      body.strokeWeight(thickness);
      body.line(pmouseX, pmouseY, mouseX, mouseY); //p becase previous
      body.endDraw();
      break;
     case 2: //eraser
      body.beginDraw();
      body.stroke(255);
      body.strokeWeight(eraser_thickness);
      body.line(pmouseX, pmouseY, mouseX, mouseY); 
      body.endDraw();
      break;
     case 7: //closed shape pencil
      body.beginDraw();
      body.strokeWeight(thickness);
      body.stroke(c2);
      body.fill(c1);
      body.line(pmouseX, pmouseY, mouseX, mouseY); //p becase previous
      body.endDraw();
      break;
    }
  //move "connectors" if necessary 
   if((mouseX < dotOneX2 + 15)&&(mouseX > dotOneX2 - 15)&&(mouseY < dotOneY2 + 15)&&(mouseY >dotOneY2 - 15)){
    dotOneX2 = mouseX;
    dotOneY2 = mouseY; 
    typeOfDrawing = 0;
   }
  if((mouseX < dotTwoX2 + 15)&&(mouseX > dotTwoX2 - 15)&&(mouseY < dotTwoY2 + 15)&&(mouseY >dotTwoY2 - 15)){
    dotTwoX2 = mouseX;
    dotTwoY2 = mouseY;
    typeOfDrawing = 0;
   }
  }//end body
  if(partOfBody == 3){
  switch(typeOfDrawing) {
    case 0: //automatic
      break;
    case 1: // pencil
      feet.beginDraw();
      feet.stroke(c2);
      feet.fill(c1);
      feet.strokeWeight(thickness);
      feet.line(pmouseX, pmouseY, mouseX, mouseY); //p becase previous
      feet.endDraw();
      break;
     case 2: //eraser
      feet.beginDraw();
      feet.stroke(255);
      feet.strokeWeight(eraser_thickness);
      feet.line(pmouseX, pmouseY, mouseX, mouseY); 
      feet.endDraw();
      break;
     case 7: //closed shape pencil
      feet.beginDraw();
      feet.strokeWeight(thickness);
      feet.stroke(c2);
      feet.fill(c1);
      feet.line(pmouseX, pmouseY, mouseX, mouseY); //p becase previous
      feet.endDraw();
      break;
    }
  }
  //no need to move connectors
}
//called when pencil button is pressed
void go_pencil() {
  typeOfDrawing = 1; 
}
//called when eraser button pressed
void go_eraser() {
  typeOfDrawing = 2;
}
//clear function
void clear() {
  //drawing head
  if(partOfBody == 1){
    // automaticaly not drawing
    typeOfDrawing = 3;
    //set up buffer stuff
    head.beginDraw();
    head.fill(255);
    head.stroke(255);
    head.rect(-1,-1,803,702);
    head.endDraw();
  }
  //drawing body
   if(partOfBody == 2){
     //automatically not drawing
     typeOfDrawing = 3;
     //set up buffer stuff
     body.beginDraw();
     body.fill(255);
     body.stroke(255);
     body.rect(-1,-1,803,702);
     body.endDraw();
  }
  //drawing legs
  if(partOfBody == 3){
     //automatically not drawing
     typeOfDrawing = 3;
     //set up buffer stuff
     feet.beginDraw();
     feet.fill(255);
     feet.stroke(255);
     feet.rect(-1,-1,803,702);
     feet.endDraw();
  }
}
//create shapes functions
void line(){
  typeOfDrawing = 4;
}
void rectangle(){
  typeOfDrawing = 5;
}
void circle(){
  typeOfDrawing = 6;
}
void closed_shape_pencil(){
  typeOfDrawing = 7;
}
///color functions
void choose_greyscale(){
  c1 = color(greyscale);
}
void choose_greyscale_2(){
  c2 = color(greyscale_2);
}
void choose_rgb_2(){
  c2 = color(r_2,g_2,b_2);
}
void choose_rgb(){
  c1 = color(r,g,b);
}
void red_1(){
  c1 = color(255,0,0);
}
void red_2(){
  c2 = color(255,0,0);
}
void orange_1(){
  c1 = color(255,150,0);
}
void orange_2(){
  c2 = color(255,150,0);
}
void yellow_1(){
  c1 = color(255,255,0);
}
void yellow_2(){
  c2 = color(255,255,0);
}
void green_1(){
  c1 = color(0,255,0);
}
void green_2(){
  c2 = color(0,255,0);
}
void blue_1(){
  c1 = color(0,0,255);
}
void blue_2(){
  c2 = color(0,0,255);
}
void purple_1(){
  c1 = color(190,0,255);
}
void purple_2(){
  c2 = color(190,0,255);
}
//change partOfBody between head, body, legs, all
void head(){
  partOfBody = 1;
}
void body(){
  partOfBody = 2;
}
void legs(){
  partOfBody = 3;
}
void all(){
  partOfBody = 4;
}
//mouse actions functions
void mousePressed() {
  x = mouseX;
  y = mouseY;
}
//figure out what you are doing on clicks
void mouseReleased() {
  //if head 
 if (partOfBody == 1){
   // add line
   if (typeOfDrawing == 4){
     head.beginDraw();
     head.stroke(c2);
     head.fill(c1);
     head.strokeWeight(outline_thickness);
     head.line(x,y,mouseX,mouseY);
     head.endDraw();
   }
   // add rectangle
   if (typeOfDrawing == 5){
     head.beginDraw();
     head.stroke(c2);
     head.fill(c1);
     head.strokeWeight(outline_thickness);
     head.rect(x,y,mouseX-x, mouseY-y);
     head.endDraw();
   }
   // add circle
   if (typeOfDrawing == 6){
     head.beginDraw();
     head.strokeWeight(outline_thickness);
     head.stroke(c2);
     head.fill(c1);
     head.ellipse(x,y, dist(x,y,mouseX,mouseY)*2, dist(x,y,mouseX,mouseY)*2);
     head.endDraw();
   }
   // add closed line shape
   if(typeOfDrawing == 7){
     head.beginDraw();
     head.stroke(c2);
     head.fill(c1);
     head.strokeWeight(thickness);
     head.line(x,y,mouseX,mouseY);
     head.endDraw();
   }
} //end head code
// if body
if (partOfBody == 2){
     // add line
   if (typeOfDrawing == 4){
     body.beginDraw();
     body.stroke(c2);
     body.fill(c1);
     body.strokeWeight(outline_thickness);
     body.line(x,y,mouseX,mouseY);
     body.endDraw();
   }
   // add rectangle
   if (typeOfDrawing == 5){
     body.beginDraw();
     body.stroke(c2);
     body.fill(c1);
     body.strokeWeight(outline_thickness);
     body.rect(x,y,mouseX-x, mouseY-y);
     body.endDraw();
   }
   // add circle
   if (typeOfDrawing == 6){
     body.beginDraw();
     body.strokeWeight(outline_thickness);
     body.stroke(c2);
     body.fill(c1);
     body.ellipse(x,y, dist(x,y,mouseX,mouseY)*2, dist(x,y,mouseX,mouseY)*2);
     body.endDraw();
   }
   // add closed line shape
   if(typeOfDrawing == 7){
     body.beginDraw();
     body.stroke(c2);
     body.fill(c1);
     body.strokeWeight(thickness);
     body.line(x,y,mouseX,mouseY);
     body.endDraw();
   }
 } //end body
 //legs
 if (partOfBody == 3){
   // add line
   if (typeOfDrawing == 4){
     feet.beginDraw();
     feet.stroke(c2);
     feet.fill(c1);
     feet.strokeWeight(outline_thickness);
     feet.line(x,y,mouseX,mouseY);
     feet.endDraw();
   }
   // add rectangle
   if (typeOfDrawing == 5){
     feet.beginDraw();
     feet.stroke(c2);
     feet.fill(c1);
     feet.strokeWeight(outline_thickness);
     feet.rect(x,y,mouseX-x, mouseY-y);
     feet.endDraw();
   }
   // add circle
   if (typeOfDrawing == 6){
     feet.beginDraw();
     feet.strokeWeight(outline_thickness);
     feet.stroke(c2);
     feet.fill(c1);
     feet.ellipse(x,y, dist(x,y,mouseX,mouseY)*2, dist(x,y,mouseX,mouseY)*2);
     feet.endDraw();
   }
   // add closed line shape
   if(typeOfDrawing == 7){
     feet.beginDraw();
     feet.stroke(c2);
     feet.fill(c1);
     feet.strokeWeight(thickness);
     feet.line(x,y,mouseX,mouseY);
     feet.endDraw();
   }
 }
}
