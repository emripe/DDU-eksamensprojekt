import controlP5.*;
ControlP5 cp5;
PFont DefaultFont;
Screen currentScreen;
MachineLearning ml = new MachineLearning();
UserData user;

enum CalcType
{
  addition,
  subtraction,
  multiplication,
  division
}

void setup() {
  cp5 = new ControlP5(this);
  DefaultFont = createFont("Arial", 22);
  size(1200, 800);
  currentScreen = new LoginScreen();
}

void draw() {
  currentScreen.Update();
}

void controlEvent(ControlEvent theEvent)
{
  currentScreen.HandleEvent(theEvent);
}
