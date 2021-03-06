import controlP5.*;
ControlP5 cp5;
import processing.sound.*;
SoundFile button;
SoundFile Star;
PFont DefaultFont;
PFont BlackboardFont;
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
  BlackboardFont = createFont("Arial", 60);
  size(1200, 800);
  currentScreen = new LoginScreen();
  button = new SoundFile(this, "data/Mouse Click - Sound Effect (HD).mp3");
  button.amp(0.1);
  Star = new SoundFile(this, "data/completetask.mp3");
}

void draw() {
  currentScreen.Update();
}

void controlEvent(ControlEvent theEvent)
{
  currentScreen.HandleEvent(theEvent);
}

// fixes weird bugs. Not good practice
void AddHiddenButtons()
{
  for (int i = 0; i < 10; i++)
  {
    cp5.remove("hiddenbutton"+i);
    cp5.addButton("hiddenbutton"+i).setVisible(false);
  }
}
