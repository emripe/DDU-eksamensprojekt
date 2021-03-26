class StatisticsScreen extends Screen
{
  int ButtonCount = 4;
  PImage add = loadImage("2+2.png");
  CColor cW = new CColor();
  CColor cG = new CColor();
  Button[] statButtons = new Button[ButtonCount];
  Button tilbage = cp5.addButton("tilbage");
  PFont font = createFont("Times New Roman", 22);
  StatisticsScreen()
  {
    cW
      .setActive(color(200))
      .setForeground(color(220))
      .setBackground(color(230));

    cG
      .setActive(color(92, 135, 110))
      .setBackground(color(122, 180, 146))
      .setForeground(color(107, 158, 128));
      
    for (int i = 0; i < ButtonCount; i++)
    {
      statButtons[i] = cp5.addButton("Button "+i);
      for (int j = 0; j < ButtonCount; j++)
      {
        statButtons[i]
          .setSize(200, 200)
          .setPosition(i*300+50, 100)
          .setColor(cW);
      }
    }
    statButtons[0]
      .setLabel("Addition")
      .setFont(DefaultFont);

    statButtons[1]
      .setLabel("Subtraktion")
      .setFont(DefaultFont);

    statButtons[2]
      .setLabel("Division")
      .setFont(DefaultFont);

    statButtons[3]
      .setLabel("Multiplikation")
      .setFont(DefaultFont);

    tilbage
      .setPosition(20, 20)
      .setSize(200, 50)
      .setColor(cG)
      .setFont(DefaultFont);
  }
  void Update()
  {
    background(153, 225, 183);
  }
  void Close()
  {
    for (int i = 0; i < ButtonCount; i++)
    {
      statButtons[i].remove();
    }
    tilbage.remove();
  }

  void HandleEvent(ControlEvent theEvent)
  {
    if (theEvent.getController().getName() == "tilbage")
    {
      Close();
      currentScreen = new MainScreen();
    }
  }
}
