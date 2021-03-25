class RulesScreen extends Screen
{
  Button addition = cp5.addButton("addition");
  Button subtraktion = cp5.addButton("subtraktion");
  Button multiplikation = cp5.addButton("multiplikation");
  CColor cA = new CColor();
  int s = 250;
  void Update()
  {
    background(249, 158, 184);
    cA
      .setActive(color(255, 153, 176))
      .setBackground(color(224, 99, 145))
      .setForeground(color(255, 123, 166));
      
    addition
      .setPosition(100, s)
      .setSize(s, s)
      .setColor(cA);
    subtraktion
      .setPosition(300+175, s)
      .setSize(s, s)
      .setColor(cA);
    multiplikation
      .setPosition(width-100-s, s)
      .setSize(s, s)
      .setColor(cA);
}}
