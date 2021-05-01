class StatisticsScreen extends Screen
{
  //Tilbageknap oprettes
  int ButtonCount = 3;
  Button tilbage = cp5.addButton("tilbage");
  CColor cG = new CColor();
  CColor cB = new CColor();
  float[] angles;
  PieChart[] pc = new PieChart[4];
  PImage starImg = loadImage("star.png");

  StatisticsScreen()
  {
    cG
      .setActive(color(92, 135, 110))
      .setBackground(color(122, 180, 146))
      .setForeground(color(107, 158, 128));

    tilbage
      .setPosition(20, 20)
      .setSize(200, 50)
      .setColor(cG)
      .setFont(DefaultFont);
    textSize(64);

    AddHiddenButtons();


    String[] names = new String[] {"Addition +", "Subtraktion -", "Multiplikation x", "Division /"};
    for (int i = 0; i < 4; i++)
    {
      pc[i] = new PieChart(names[i], user.tasksCounter[i+1], user.tasksCounterCorrect[i+1], i*300+150, 580, 200);
    }
  }



  void Update()
  {
    background(153, 225, 183);
    for (int i = 0; i < 4; i ++)
      pc[i].Draw();
    textAlign(LEFT);
    text("x "+user.starCount, 600, 300);
    starImg.resize(0, 100);
    image(starImg, 480, 220);
  }
  void Close()
  {
    tilbage.remove();
  }
  void HandleEvent(ControlEvent theEvent)
  {
    button.play();
    switch(theEvent.getController().getName())
    {
    case "tilbage":
      Close();
      currentScreen = new MainScreen();
      break;
    }
  }
}


class PieChart
{
  String title;
  float data[] = new float[2];
  float diameter;
  float x, y;


  PieChart(String title, float total, float correct, float x, float y, float diameter)
  {
    this.title = title;
    this.diameter = diameter;
    this.x = x;
    this.y = y;

    data[0] = (correct/total)*360;
    data[1] = ((total-correct)/total)*360;
    println(data[0] + ", " + data[1]);
  }

  void Draw()
  {
    float lastAngle = 0;
    for (int i = 0; i < data.length; i++) {
      switch (i)
      {
      case 0:
        fill(153, 181, 225);
        break;
      case 1:
        fill(225, 154, 153);
        break;
      default:
        fill(153, 181, 181);
        break;
      }
      arc(x, y, diameter, diameter, lastAngle, lastAngle+radians(data[i]));
      lastAngle += radians(data[i]);
      textSize(36);
      textAlign(CENTER);
      textLeading(30);
      text(title, x, y-diameter*2/3);
      text(round(data[0]*100/360)+"%\nrigtige", x, y+diameter*2/3);
    }
  }
}
