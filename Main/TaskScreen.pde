class TaskScreen extends Screen
{
  TaskSet currentTaskSet;
  String calcInfo;
  String calcAnswer;
  Button tilbage = cp5.addButton("tilbage");
  Textfield calcInput = cp5.addTextfield("calcInput");
  Textarea info = cp5.addTextarea("info");
  Textarea taskProgress = cp5.addTextarea("taskProgress");
  Textarea title = cp5.addTextarea("title");
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

    title
      .setPosition(width/5+40, 20)
      .setText("Addition +")
      .setColor(color(0))
      .setFont(DefaultFont);

    info
      .setSize(1000, 30)
      .setPosition(800, 400)
      .setText("popoo")
      .setColor(color(0))
      .setFont(DefaultFont);

    taskProgress
      .setSize(1000, 30)
      .setPosition(200, 400)
      .setText("popoo")
      .setColor(color(0))
      .setFont(DefaultFont);

    calcInput
      .setSize(200, 60)
      .setPosition(width/5+40, height/2)
      .setColor(c)
      .setColorCaptionLabel(color(0))
      .setColorValue(color(0))
      .setLabel("");

    answerButton
      .activateBy(ControlP5.RELEASE)
      .setPosition(width/5+40, height/2-35)
      .setSize(100, 30)
      .setFont(DefaultFont);

    tilbage
      .setPosition(20, 20)
      .setSize(200, 50)
      .setColor(cB)
      .setFont(DefaultFont);

    currentTaskSet = GenerateTaskSet(ml.GenerateParameters(null, 0));
    startTask();
    
  }
  void Update()
  {
    background(154, 195, 223);
    fill(123, 156, 178);
    stroke(123, 156, 178);
    rect(width/5, 0, 20, height);
    fill(235);
    stroke(235);
    rect(width/5+30, 100, 900, 650, 10);
  }
  void Close()
  {
    title.remove();
    info.remove();
    taskProgress.remove();
    calcInput.remove();
    answerButton.remove();
    tilbage.remove();
  }
  
  void startTask()
  {
    info.setText(currentTaskSet.tasks[taskIndex].numbers[0] + " + " + currentTaskSet.tasks[taskIndex].numbers[1]);
    taskProgress.setText((taskIndex+1) + "/5");
    startTime = millis();
  }
  
  void HandleEvent(ControlEvent theEvent)
  {
    // answer button pressed
    if (theEvent.getController().getName() == "svar" || theEvent.getController().getName() == "calcInput")
    {
      println("guess: " + Long.parseLong(calcInput.getText()));
      println("answer: " + currentTaskSet.tasks[taskIndex].getAnswer());
     
      if (Long.parseLong(calcInput.getText()) == currentTaskSet.tasks[taskIndex].getAnswer())
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
        
        taskIndex = 0;
        println("old params: " + currentTaskSet.params.digits + "; " + currentTaskSet.params.carryRatio);
        currentTaskSet = GenerateTaskSet(ml.GenerateParameters(currentTaskSet.params, 1));
        startTask();
      }
      else
      {
        taskIndex++;
        startTask();
      }
    }
    if (theEvent.getController().getName() == "tilbage")
    {
      Close();
      currentScreen = new MainScreen();
    }
  }
}
