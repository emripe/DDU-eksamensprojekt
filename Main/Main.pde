import controlP5.*;
ControlP5 cp5;
Screen currentScreen;
MachineLearning ml = new MachineLearning();

void setup() {
  cp5 = new ControlP5(this);
  size(1200, 800);
  currentScreen = new MainScreen();
}

void draw() {
  println("yo");
  currentScreen.Update();
}

void controlEvent(ControlEvent theEvent)
{
  currentScreen.HandleEvent(theEvent);
}
