class RulesScreen extends Screen
{
  Button addition = cp5.addButton("addition");
  Button subtraktion = cp5.addButton("subtraktion");
  Button multiplikation = cp5.addButton("multiplikation");
  CColor cA = new CColor();
  int s = 250;
  void run()
  {
    background(250, 160, 190);
    cA
      .setActive(color(255, 153, 176))
      .setBackground(color(224, 99, 145))
      .setForeground(color(255, 123, 166));
      
    addition
      .setPosition(75, 100)
      .setSize(s, s)
      .setColor(cA);
    subtraktion
      .setPosition(75+(s+50), 100)
      .setSize(s, s)
      .setColor(cA);
    multiplikation
  }
}
