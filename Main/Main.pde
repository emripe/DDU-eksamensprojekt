import controlP5.*;
import java.util.*;
ControlP5 cp5;

Screen currentScreen;

void setup() {
  cp5 = new ControlP5(this);
  size(1200, 800);
  currentScreen = new LoginScreen();
  currentScreen.run();
}

void draw() {

}
