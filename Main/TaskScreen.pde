class TaskScreen extends Screen
{
  TaskSet currentTaskSet;
  String calcInfo;
  String calcAnswer;
  Textfield calcInput = cp5.addTextfield("calcInput");
  Textarea info = cp5.addTextarea("info");
  Button answerButton = cp5.addButton("svar");
  CColor c = new CColor();
  CColor cB = new CColor();
  
  int taskIndex = 0;
  int startTime;
  
  int[] times = new int[5];
  
  TaskScreen()
  {
    c
      .setActive(color(228, 232, 235))
      .setBackground(color(195, 205, 212))
      .setForeground(color(223, 231, 237));


    info
      .setSize(1000, 30)
      .setPosition(800, 400)
      .setText("popoo")
      .setColor(color(0));


    calcInput
      .setSize(200, 60)
      .setPosition(width/5+40, height/2)
      .setColor(c)
      .setLabelVisible(false);

    answerButton
      .activateBy(ControlP5.RELEASE)
      .setPosition(width/5+40, height/2-35)
      .setSize(100, 30);



    currentTaskSet = GenerateTaskSet(ml.GenerateParameters(null));
    startTask();
    
  }
  void Update()
  {
    background(154, 195, 223);
    calcAnswer = calcInput.getText();
    fill(123, 156, 178);
    rect(width/5, 0, 20, height);
    fill(235);
    rect(width/5+30, 50, 900, 700, 10);
  }
  void Close()
  {
  }
  
  void startTask()
  {
    info.setText(currentTaskSet.tasks[taskIndex].numbers[0] + " + " + currentTaskSet.tasks[taskIndex].numbers[1]);
    startTime = millis();
  }
  
  void HandleEvent(ControlEvent theEvent)
  {
    // answer button pressed
    if (theEvent.getController().getName() == "svar")
    {
      println("hej");
      println(Long.parseLong(calcAnswer));
      println(currentTaskSet.tasks[taskIndex].getAnswer());
      if (Long.parseLong(calcAnswer) == currentTaskSet.tasks[taskIndex].getAnswer())
      {
        println("correct");
      }
      else
        println("wrong");

      
      times[taskIndex] = millis() - startTime;
      println("time: " + times[taskIndex]);

      if (taskIndex == 4)
      {
        int avg = 0;
        for (int i = 0; i < 5; i++)
        {
          avg += times[i];
        }
        avg /= 5;
        println("avg: " + avg);
        
        // save data here. avg & currentTaskSet.params
      }
      else
      {
        taskIndex++;
        startTask();
      }
      
      
    }
  }
}
