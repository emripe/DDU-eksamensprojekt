class Addition extends Screen
{
  String[] lines;
  PImage img;
  Button tilbage = cp5.addButton("tilbage");
  CColor cA = new CColor();
  int s = 250;
  float ix, iy, iw, ih;

  public Addition()
  {
    background(249, 158, 184);
    noStroke();
    fill(255, 235, 234);
    rect(50, 120, width-50*2, height-79);
    lines = loadStrings("data/text/addition.txt");

    for (int i = 0; i <lines.length; i++) {
      fill(0);
      text(lines[i], 80, 30*i+175);
    }
    img = loadImage("2+2.png");

    cA
      .setActive(color(255, 153, 176))
      .setBackground(color(224, 99, 145))
      .setForeground(color(255, 123, 166));
  }
  void Update()
  {
    tilbage
      .setPosition(20, 20)
      .setSize(200, 50)
      .setColor(cA)
      .setFont(DefaultFont);
  }
  void Close()
  {
    tilbage.remove();
  }

  void HandleEvent(ControlEvent theEvent)
  {
    button.play();
    if (theEvent.getController().getName() == "tilbage")
    {
      Close();
      currentScreen = new RulesScreen();
    }
  }
}




class Subtraktion extends Screen
{
  Button tilbage = cp5.addButton("tilbage");
  CColor cA = new CColor();
  String[] lines;

  public Subtraktion()
  {
    background(249, 158, 184);
    noStroke();
    fill(255, 235, 234);
    rect(50, 120, width-50*2, height-79);
    lines = loadStrings("data/text/subtraktion.txt");

    for (int i = 0; i <lines.length; i++) {
      fill(0);
      text(lines[i], 80, 30*i+175);
    }

    cA
      .setActive(color(255, 153, 176))
      .setBackground(color(224, 99, 145))
      .setForeground(color(255, 123, 166));
  }
  void Update()
  {
    tilbage
      .setPosition(20, 20)
      .setSize(200, 50)
      .setColor(cA)
      .setFont(DefaultFont);
  }
  void Close()
  {
    tilbage.remove();
  }
  void HandleEvent(ControlEvent theEvent)
  {
    button.play();
    if (theEvent.getController().getName() == "tilbage")
    {
      Close();
      currentScreen = new RulesScreen();
    }
  }
}




class Multiplikation extends Screen
{
  Button tilbage = cp5.addButton("tilbage");
  Button division = cp5.addButton("division");
  CColor cA = new CColor();
  int s = 250;
  public Multiplikation()
  {
    background(249, 158, 184);

    cA
      .setActive(color(255, 153, 176))
      .setBackground(color(224, 99, 145))
      .setForeground(color(255, 123, 166));
    division
      .setPosition(1800, 1600)
      .setSize(s, s)
      .setColor(cA)
      .setFont(DefaultFont);
  }
  void Update()
  {
    tilbage
      .setPosition(20, 20)
      .setSize(200, 50)
      .setColor(cA)
      .setFont(DefaultFont);
  }
  void Close()
  {
    tilbage.remove();
    division.remove();
  }

  void HandleEvent(ControlEvent theEvent)
  {
    button.play();
    if (theEvent.getController().getName() == "tilbage")
    {
      Close();
      currentScreen = new RulesScreen();
    }
  }
}




class Division extends Screen
{
  Button tilbage = cp5.addButton("tilbage");
  Button division = cp5.addButton("division");
  Button invis = cp5.addButton("invis");
  CColor cA = new CColor();
  int s = 250;
  public Division()
  {
    background(249, 158, 184);

    cA
      .setActive(color(255, 153, 176))
      .setBackground(color(224, 99, 145))
      .setForeground(color(255, 123, 166));
    division
      .setPosition(1800, 1600)
      .setSize(s, s)
      .setColor(cA)
      .setFont(DefaultFont);
    invis
      .setPosition(1900, 10)
      .setSize(s, s)
      .setColor(cA);
  }
  void Update()
  {
    tilbage
      .setPosition(20, 20)
      .setSize(200, 50)
      .setColor(cA)
      .setFont(DefaultFont);
  }
  void Close()
  {
    tilbage.remove();
    division.remove();
  }

  void HandleEvent(ControlEvent theEvent)
  {
    button.play();
    if (theEvent.getController().getName() == "tilbage")
    {
      Close();
      currentScreen = new RulesScreen();
    }
  }
}
