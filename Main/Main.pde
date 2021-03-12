import controlP5.*;
import java.util.*;
ControlP5 cp5;
int screenStat;
Screen currentScreen;

void setup() {
  cp5 = new ControlP5(this);
  size(1200, 800);
  if (screenStat == 0)
  {
    currentScreen = new LoginScreen();
  } else if (screenStat == 1)
  {
    currentScreen = new MainScreen();
  }
  currentScreen.run();
}

void draw() {
  
}
