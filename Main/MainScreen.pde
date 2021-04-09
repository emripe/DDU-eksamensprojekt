class MainScreen extends Screen
{
  Button regneregler = cp5.addButton("regneregler");
  Button resultater = cp5.addButton("resultater");
  Button opgaver = cp5.addButton("opgaver");
  CColor cR = new CColor();
  CColor cB = new CColor();
  CColor cG = new CColor();
  int s = 250;
  PImage lommeregner = loadImage("lommeregner.png");
  PImage bog = loadImage("bog.png");
  PImage statistik = loadImage("Statistik.png");

  MainScreen()
  {
    background(221, 239, 255);

    cG
      .setActive(color(173, 231, 197))
      .setBackground(color(153, 225, 183))
      .setForeground(color(163, 228, 190));
      
    cR
      .setActive(color(250, 177, 198))
      .setBackground(color(249, 158, 184))
      .setForeground(color(250, 168, 191));
      
    cB
      .setActive(color(174, 207, 229))
      .setBackground(color(154, 195, 223))
      .setForeground(color(164, 201, 226));

    regneregler
      .setPosition(133, s)
      .setSize(217, s)
      .setColor(cR)
      .setFont(DefaultFont)
      .setImage(bog);

    resultater
      .setPosition(300+175, s)
      .setSize(s, s)
      .setColor(cG)
      .setFont(DefaultFont)
      .setImage(statistik);
    
    opgaver
      .setPosition(width-100-s, s)
      .setSize(185, s)
      .setColor(cB)
      .setFont(DefaultFont)
      .setImage(lommeregner);
  }
  void Close()
  {
    regneregler.remove();
    resultater.remove();
    opgaver.remove();
  }
  void HandleEvent(ControlEvent theEvent)
  {
    if (theEvent.getController().getName() == "regneregler")
    {
      Close();
      currentScreen = new RulesScreen();
    }
    if (theEvent.getController().getName() == "opgaver")
    {
      Close();
      currentScreen = new TaskScreen(CalcType.addition);
    }
    if (theEvent.getController().getName() == "resultater")
    {
      Close();
      currentScreen = new StatisticsScreen();
    }
  }
}
