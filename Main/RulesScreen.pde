class RulesScreen extends Screen
{
  Button addition = cp5.addButton("addition");
  Button subtraktion = cp5.addButton("subtraktion");
  Button multiplikation = cp5.addButton("multiplikation");
  Button tilbage = cp5.addButton("tilbage");
  CColor cA = new CColor();
  int s = 250;
  
  RulesScreen()
  {
    background(249, 158, 184);
    cA
      .setActive(color(255, 153, 176))
      .setBackground(color(224, 99, 145))
      .setForeground(color(255, 123, 166));
      
    addition
      .setPosition(100, s)
      .setSize(s, s)
      .setColor(cA)
      .setFont(DefaultFont);
    subtraktion
      .setPosition(300+175, s)
      .setSize(s, s)
      .setColor(cA)
      .setFont(DefaultFont);
    multiplikation
      .setPosition(width-100-s, s)
      .setSize(s, s)
      .setColor(cA)
      .setFont(DefaultFont);
    tilbage
      .setPosition(20, 20)
      .setSize(200, 50)
      .setColor(cA)
      .setFont(DefaultFont);
  }
  
  void Close()
  {
    addition.remove();
    subtraktion.remove();
    multiplikation.remove();
    tilbage.remove();
  }
  void HandleEvent(ControlEvent theEvent)
  {
    if (theEvent.getController().getName() == "tilbage")
    {
      Close();
      currentScreen = new MainScreen();
    }
    if (theEvent.getController().getName() == "opgaver")
    {
      Close();
      currentScreen = new TaskScreen();
    }
    if (theEvent.getController().getName() == "addition")
    {
      Close();
      currentScreen = new Addition();
    }
    if (theEvent.getController().getName() == "subtraktion")
    {
      Close();
      currentScreen = new subtraktion();
    }
    if (theEvent.getController().getName() == "multiplikation")
    {
      Close();
      currentScreen = new multiplikation();
    }
  }
}
