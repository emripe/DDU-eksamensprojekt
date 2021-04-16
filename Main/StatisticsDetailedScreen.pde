class StatisticsDetailedScreen extends Screen
{
  //Tilbageknap oprettes
  int ButtonCount = 3;
  int statScreen = 0;
  Button tilbage = cp5.addButton("tilbage");

  CColor cG = new CColor();
  CColor cB = new CColor();
  float[] angles;
  StatisticsDetailedScreen(int statScreen)
  {
    this.statScreen = statScreen;
    float correctValue = 0;
    float wrongValue = 0;
    cG
      .setActive(color(92, 135, 110))
      .setBackground(color(122, 180, 146))
      .setForeground(color(107, 158, 128));

    switch(statScreen)
    {
    case 1:
      correctValue = (float(user.tasksCounterCorrect[1])/float(user.tasksCounter[1]))*360;
      wrongValue = ((float(user.tasksCounter[1]-user.tasksCounterCorrect[1]))/float(user.tasksCounter[1])*360);

    case 2:
      correctValue = (float(user.tasksCounterCorrect[2])/float(user.tasksCounter[2]))*360;
      wrongValue = ((float(user.tasksCounter[2]-user.tasksCounterCorrect[2]))/float(user.tasksCounter[2])*360);

    case 3:
      correctValue = (float(user.tasksCounterCorrect[3])/float(user.tasksCounter[3]))*360;
      wrongValue = ((float(user.tasksCounter[3]-user.tasksCounterCorrect[3]))/float(user.tasksCounter[3])*360);

    case 4:
      correctValue = (float(user.tasksCounterCorrect[4])/float(user.tasksCounter[4]))*360;
      wrongValue = ((float(user.tasksCounter[4]-user.tasksCounterCorrect[4]))/float(user.tasksCounter[4])*360);
    }
    angles = new float[] {correctValue, wrongValue};
    tilbage
      .setPosition(20, 20)
      .setSize(200, 50)
      .setColor(cG)
      .setFont(DefaultFont);

    AddHiddenButtons();
  }
  void Update()
  {
    background(153, 225, 183);
    pieChart(180, angles);
  }
  void Close()
  {
    tilbage.remove();
  }
  void pieChart(float diameter, float[] data) {
    float lastAngle = 0;
    for (int i = 0; i < data.length; i++) {
      switch(i)
      {
      case 0:
        fill(153, 181, 225);
        text("Korrekte svar", width/6*5, height/5*4-125);
        break;

      case 1:
        fill(225, 154, 153);
        text("Forkerte svar", width/6*5, height/5*4-100);
        break;
      }
      arc(width/6*5, height/5*4, diameter, diameter, lastAngle, lastAngle+radians(data[i]));
      lastAngle += radians(data[i]);
    }
  }
  void HandleEvent(ControlEvent theEvent)
  {
    button.play();
    switch(theEvent.getController().getName())
    {
    case "tilbage":
      Close();
      currentScreen = new StatisticsScreen();
      break;
    }
  }
}
