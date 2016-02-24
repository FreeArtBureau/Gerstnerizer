/*
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
 CODE FOR GUI MODIFIED FROM
 Generative Gestaltung
 Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
 http://www.generative-gestaltung.de
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
 */
void setupGUI() {
  color activeColor = color(0, 130, 164);
  controlP5 = new ControlP5(this);
  controlP5.setColorActive(activeColor);
  controlP5.setColorBackground(color(170));
  controlP5.setColorForeground(color(50));
  controlP5.setColorLabel(color(255,0,0));
  controlP5.setColorValue(color(255));

  ControlGroup ctrl = controlP5.addGroup("menu", 15, 25, 35);
  ctrl.setColorLabel(color(255));
  ctrl.close();

  //LOAD XML FILE : NOT WORKING PROPERLY
  //controlP5.setAutoInitialization(true);
  //controlP5.load("controlP5.xml");

  sliders = new Slider[10];
  toggles = new Toggle[5];

  int left = 0;
  int top = 5;
  int len = 250;

  int si = 0;
  int ti = 0;
  // int ri = 0;
  int posY = 0;

  //-------- SLIDERS --------------------------------------------------------------
  sliders[si++] = controlP5.addSlider("ShapeSize", 15, 90, left, top+posY+0, len, 10);
  posY += 20;
  sliders[si++] = controlP5.addSlider("NumSides", 1, 30, left, top+posY+0, len, 10);
  sliders[si++] = controlP5.addSlider("Contour", 0, 20, left, top+posY+15, len, 10);
  posY += 30;
  sliders[si++] = controlP5.addSlider("ShapeDist", 0, 30, left, top+posY+0, len, 10);
  posY += 20;
  sliders[si++] = controlP5.addSlider("ManualRotate", 0, TWO_PI, left, top+posY+0, len, 10);
 posY += 15;
    sliders[si++] = controlP5.addSlider("res", 20, 40, left, top+posY+0, len, 10);
  posY += 10;
  sliders[si++] = controlP5.addSlider("numH", 0, 40, left, top+posY+15, len, 10);
  posY += 15;
  sliders[si++] = controlP5.addSlider("numV", 0, 40, left, top+posY+15, len, 10);

  for (int i = 0; i < si; i++) {
    sliders[i].setGroup(ctrl);
    sliders[i].captionLabel().toUpperCase(true);
    sliders[i].captionLabel().style().padding(4, 0, 1, 3);
    sliders[i].captionLabel().style().marginTop = -4;
    sliders[i].captionLabel().style().marginLeft = 0;
    sliders[i].captionLabel().style().marginRight = -14;
    sliders[i].captionLabel().setColorBackground(0x99ffffff);
  }

  //--------- TOGGLES ---------------------------------------------------
  toggles[ti] = controlP5.addToggle("AngleChange1", AngleChange1, 0, 155, 10, 10);
  toggles[ti++].setLabel("Angle 90°");
  toggles[ti] = controlP5.addToggle("ChangeGrid", AngleChange2, 55, 155, 10, 10);
  toggles[ti++].setLabel("HEX Grid");
  toggles[ti] = controlP5.addToggle("AddForm1", AddForm1, 110, 155, 10, 10);
  toggles[ti++].setLabel("Add Form1");
  toggles[ti] = controlP5.addToggle("ChangeForm", ChangeForm, 220, 155, 10, 10);
  toggles[ti++].setLabel("Change Form");
   toggles[ti] = controlP5.addToggle("AddForm2", AddForm2, 165, 155, 10, 10);
  toggles[ti++].setLabel("Add Form2");


  for (int i = 0; i<ti; i++) {
    toggles[i].setGroup(ctrl); 
    toggles[i].setColorForeground(color(33));
    toggles[i].setColorActive(color(0, 0, 255));
    toggles[i].setColorLabel(color(255,0,0));
  }
}

//-----------------------------------------------------------------
void AddForm1() {
  AddForm1 = !AddForm1;
}
void AddForm2() {
  AddForm2 = !AddForm2;
}


void ChangeGrid() {
  ChangeGrid = !ChangeGrid;
}

void drawGUI() {
  controlP5.show();
  controlP5.draw();
}
//-----------------------------------------------------------------

