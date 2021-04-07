class StatisticsDetailedScreen extends Screen
{
  //Tilbageknap oprettes
  int ButtonCount = 3;
  Button[] InviButtons = new Button[ButtonCount];
  Button tilbage = cp5.addButton("tilbage");
  
  CColor cG = new CColor();
  CColor cB = new CColor();
  float[] angles;
  StatisticsDetailedScreen()
  {
    for (int i = 0; i < ButtonCount; i++)
    {
      InviButtons[i] = cp5.addButton("InviButton "+i);
    }
    cG
      .setActive(color(92, 135, 110))
      .setBackground(color(122, 180, 146))
      .setForeground(color(107, 158, 128));

    println(user.taskCounterCorrect/user.taskCounter);
    float correctValue = (float(user.taskCounterCorrect)/float(user.taskCounter))*360;
    float wrongValue = ((float(user.taskCounter-user.taskCounterCorrect))/float(user.taskCounter)*360);
    println("correctValue = "+correctValue+" and wrongValue = "+wrongValue);
    angles = new float[] {correctValue, wrongValue};

    tilbage
      .setPosition(20, 20)
      .setSize(200, 50)
      .setColor(cG)
      .setFont(DefaultFont);
  }
  void Update()
  {
    pieChart(300, angles);
    /*
    background(153, 225, 183);
     println("oongaboonga");*/
  }
  void Close()
  {
    for (int i = 0; i < ButtonCount; i++)
    {

      cp5.remove(InviButtons[i].getName());
    }
    tilbage.remove();
  }
  void pieChart(float diameter, float[] data) {
    float lastAngle = 0;
    for (int i = 0; i < data.length; i++) {
      float gray = map(i, 0, data.length, 0, 255);
      fill(gray);
      arc(width/2, height/2, diameter, diameter, lastAngle, lastAngle+radians(data[i]));
      lastAngle += radians(data[i]);
    }
  }
  void HandleEvent(ControlEvent theEvent)
  {
    switch(theEvent.getController().getName())
    {
    case "tilbage":
      Close();
      currentScreen = new StatisticsScreen();
      break;
    }
  }
}
