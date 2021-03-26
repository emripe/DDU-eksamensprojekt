class StatisticsScreen extends Screen
{
  int ButtonCount = 4;
  PImage add = loadImage("2+2.png");
  CColor cW = new CColor();
  Button[] statButtons = new Button[ButtonCount];
  PFont font = createFont("Times New Roman", 22);
  StatisticsScreen()
  {
    cW
    .setActive(color(200))
    .setForeground(color(220))
    .setBackground(color(230));
    for (int i = 0; i < ButtonCount; i++)
    {
      statButtons[i] = cp5.addButton("Button "+i);
      for (int j = 0; j < ButtonCount; j++)
      {
        statButtons[i]
          .setSize(200, 200)
          .setPosition(i*300+50, 20)
          .setColor(cW);
      }
    }
    statButtons[0]
    .setLabel("Addition")
    .setFont(font);
   
    statButtons[1]
    .setLabel("Subtraktion")
    .setFont(font);
    
    statButtons[2]
    .setLabel("Division")
    .setFont(font);
    
    statButtons[3]
    .setLabel("Multiplikation")
    .setFont(font);
  }
  void Update()
  {
    background(153, 225, 183);
  }
  void Close()
  {
  }
}
