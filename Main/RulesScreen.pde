class RulesScreen extends Screen
{
  Button addition = cp5.addButton("addition");
  Button subtraktion = cp5.addButton("subtraktion");
  Button multiplikation = cp5.addButton("multiplikation");
  Button division = cp5.addButton("division");
  Button tilbage = cp5.addButton("tilbage");
  CColor cA = new CColor();
  PImage addBog = loadImage("AdditionsBog.png");
  PImage subBog = loadImage("SubtraktionsBog.png");
  PImage mulBog = loadImage("MultiplikationsBog.png");
  PImage divBog = loadImage("DivisionsBog.png");
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
      .setSize(217, s)
      .setColor(cA)
      .setFont(DefaultFont)
      .setImage(addBog);
    subtraktion
      .setPosition(s+100, s)
      .setSize(217, s)
      .setColor(cA)
      .setFont(DefaultFont)
      .setImage(subBog);
    multiplikation
      .setPosition(s+100+s, s)
      .setSize(217, s)
      .setColor(cA)
      .setFont(DefaultFont)
      .setImage(mulBog);
    division
      .setPosition(s+100+s+s, s)
      .setSize(217, s)
      .setColor(cA)
      .setFont(DefaultFont)
      .setImage(divBog);
    tilbage
      .setPosition(20, 20)
      .setSize(200, 50)
      .setColor(cA)
      .setFont(DefaultFont);

    AddHiddenButtons();
  }

  void Close()
  {
    addition.remove();
    subtraktion.remove();
    multiplikation.remove();
    division.remove();
    tilbage.remove();
  }
  void HandleEvent(ControlEvent theEvent)
  {
    button.play();
    if (theEvent.getController().getName() == "tilbage")
    {
      Close();
      currentScreen = new MainScreen();
    }
    if (theEvent.getController().getName() == "opgaver")
    {
      Close();
      currentScreen = new TaskScreen(CalcType.addition);
    }
    if (theEvent.getController().getName() == "addition")
    {
      Close();
      currentScreen = new Addition();
    }
    if (theEvent.getController().getName() == "subtraktion")
    {
      Close();
      currentScreen = new Subtraktion();
    }
    if (theEvent.getController().getName() == "multiplikation")
    {
      Close();
      currentScreen = new Multiplikation();
    }
    if (theEvent.getController().getName() == "division")
    {
      Close();
      currentScreen = new Division();
    }
  }
}
