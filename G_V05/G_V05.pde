/*
 *   PLEASE READ INFO TAB
 *
 */

////////////////////////

import controlP5.*;
import processing.pdf.*;
import java.util.*;
boolean recordPDF = false;

ControlP5 controlP5;
boolean showGUI = false;
Slider[] sliders;
Toggle[] toggles;

boolean AddForm1 = true;
boolean AddForm2 = true;
boolean ChangeForm = true;
boolean AngleChange1 = false; // 90° Angle
boolean AngleChange2 = true;// 
boolean ChangeGrid = false;
//int mode = 0;
int NumSides = 6;
float ShapeSize = 22.00;
float ShapeDist = 17.72;
float Angle = 0;
float Contour = 2.50;
float ManualRotate = 0.0;

int numH = 16;//NUMBER OF COLUMNS
int numV = 16; //NUMBER OF ROWS
float res = 33.50; //ORIGINAL 20;

//--------------------------------------------------------------------------
void setup() { 
  size(900, 600);
  smooth();
  setupGUI();
}

//--------------------------------------------------------------------------
void draw() {
  background(255);  
  float sv = 0;

  if (ChangeGrid) { //QUAD
    sv = res;
  } else if (!ChangeGrid) { //HEX
    sv = sqrt(3) / 2 * res;
  }
  /*
  else if (mode == 2) { //RECT
   sv = res/3.0*2;
   } 
   */

  float offsetX = res * (numH-1)/2;
  float offsetY = sv * (numV-1)/2;

  for (int j=0; j<numV; j++) {
    for (int i=0; i<numH; i++) {

      float x = i * res - offsetX + width/2;
      float y = j * sv - offsetY + height/2;

      if (j%2==0 && ChangeGrid == false) x += res/2; 
      stroke(0, 0, 255, 120);
      noFill();
      if (AddForm1) {
        pushMatrix();
        translate(x, y);

        if (AngleChange1) {  //ADDED POSSIBILITY TO CHANGE THE ANGLE TO 90°
          Angle = QUARTER_PI;
        } else if (AngleChange2 ) {
          Angle = ManualRotate;
        }

        rotate(Angle);
        pattern(0, 0, ShapeSize);
        popMatrix();
      }

      if (AddForm2) {
        pushMatrix();
        translate(x, y);
        rotate(-Angle);
        pattern2(0, 0, ShapeSize/2 + ShapeDist);
        popMatrix();
      }
    }
  }
}
//--------------------------------------------------------------------------
void pattern (float x, float y, float sizes) {

  float radius = sizes;
  float angle = TWO_PI/NumSides;
  noFill();
  stroke(0);
  strokeWeight(Contour);
  //CREATE A POLYGON WITH N° SIDES
  beginShape();
  for (int i=0; i<=NumSides; i++) {
    x =  cos(angle*i) * radius;
    y =  sin(angle*i) * radius;

    if (ChangeForm) { //ADDED POSSIBILITY TO CHANGE THE BASIC FORM
      point(x, y);
      //ellipse(x,y,4,4);
    } else {
      vertex(x, y);
    }
  } 
  endShape();
}
//--------------------------------------------------------------------------
void pattern2 (float x, float y, float sizes) {

  float radius = sizes;
  float angle = TWO_PI/NumSides;
  noFill();
  stroke(0);
  strokeWeight(Contour);
  //CREATE A POLYGON WITH N° SIDES
  beginShape();
  for (int i=0; i<=NumSides; i++) {
    x =  cos(angle*i) * radius;
    y =  sin(angle*i) * radius;

    if (ChangeForm) { //ADDED POSSIBILITY TO CHANGE THE BASIC FORM
      point(x, y);
      //ellipse(x,y,4,4);
    } else {
      vertex(x, y);
    }
  } 
  endShape();
}

//SAVE XML FILE
void keyPressed() {
  if (key=='s') {

    controlP5.save();
  }
}

//--------------------------------------------------------------------------
void keyReleased() {
  if (key =='s' || key == 'S') saveFrame(timestamp()+"_###.png");
  if (key=='m' || key=='M') {
    showGUI = controlP5.group("menu").isOpen();
    showGUI = !showGUI;
  }
  if (showGUI) controlP5.group("menu").open();
  else controlP5.group("menu").close();

  if (key =='r' || key =='R') {
    if (recordPDF == false) {
      beginRecord(PDF, timestamp()+".pdf");
      println("recording started");
      recordPDF = true;
    }
  } else if (key == 'e' || key =='E') {
    if (recordPDF) {
      println("recording stopped");
      endRecord();
      recordPDF = false;
      background(0);
    }
  }
}

String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
//--------------------------------------------------------------------------

