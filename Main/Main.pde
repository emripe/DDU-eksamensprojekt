import controlP5.*;
ControlP5 cp5;
Screen currentScreen;

void setup() {
  cp5 = new ControlP5(this);
  size(1200, 800);
  currentScreen = new TaskScreen();
}

void draw() {
  
  currentScreen.Update();
}
