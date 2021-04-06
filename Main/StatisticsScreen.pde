class StatisticsScreen extends Screen
{
  int ButtonCount = 4;
  PImage add = loadImage("2+2.png");
  //Variabler af typen CColor oprettes
  CColor cG = new CColor();
  CColor cB = new CColor();
  //Array af typen Button opstilles for at kunne oprette statistik knapper
  Button[] statButtons = new Button[ButtonCount];
  //Tilbageknap oprettes
  Button tilbage = cp5.addButton("tilbage");
  StatisticsScreen()
  {
//Aspekter af farver defineres, baggrund, forgrund/mouseover, og aktivering af knap
    cG
      .setActive(color(92, 135, 110))
      .setBackground(color(122, 180, 146))
      .setForeground(color(107, 158, 128));

    cB
      .setActive(color(177, 206, 250))
      .setBackground(color(153, 181, 225))
      .setForeground(color(165, 195, 242));
//Statistik knapper oprettes, størrelse position, farve og font sættes 
    for (int i = 0; i < ButtonCount; i++)
    {
      statButtons[i] = cp5.addButton("Button "+i);
      for (int j = 0; j < ButtonCount; j++)
      {
        statButtons[i]
          .setSize(200, 200)
          .setPosition(i*300+50, 100)
          .setColor(cB)
          .setFont(DefaultFont);
      }
    }
//Labels på knapperne sættes så der kan kendes forskel
    statButtons[0]
      .setLabel("Addition");

    statButtons[1]
      .setLabel("Subtraktion");

    statButtons[2]
      .setLabel("Division");

    statButtons[3]
      .setLabel("Multiplikation");

//Tilbageknap tegnes
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
