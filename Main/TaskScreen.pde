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
  String fileString;
  int taskIndex = 0;
  int startTime;
  
  int starCount = 0;
  PImage starImg = loadImage("star.png");
  
  
  int[] times = new int[5];
  
  CalcType calcType = CalcType.addition;
  
  TaskScreen()
  {
    user.taskCounter = int(user.lines[1]);
    user.taskCounterCorrect = int(user.lines[2]);
    
    c
      .setActive(color(228, 232, 235))
      .setBackground(color(195, 205, 212))
      .setForeground(color(223, 231, 237));

    title
      .setPosition(width/5+40, 20)
      .setText("")
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
      .setPosition(width/5*4, 110)
      .setText("popoo")
      .setColor(color(0))
      .setFont(DefaultFont);

    calcInput
      .setSize(200, 60)
      .setPosition(width/5+40, height/2)
      .setColor(c)
      .setColorCaptionLabel(color(0))
      .setColorValue(color(0))
      .setLabel("")
      .setInputFilter(ControlP5.INTEGER);

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

    currentTaskSet = GenerateTaskSet(ml.GenerateParameters(null, 0), calcType);
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
    
    for (int i = 0; i < starCount; i++)
    {
      image(starImg, width/5*4 + (i*30), 20);
    }
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
    taskProgress.setText("opgave " + (taskIndex+1) + " ud af 5");
    startTime = millis();
  }
  
  void HandleEvent(ControlEvent theEvent)
  {
    // answer button pressed
    if (theEvent.getController().getName() == "svar" || theEvent.getController().getName() == "calcInput")
    {
      // input field is not empty
      if (!calcInput.getText().equals(""))
      {
        // increment task counter
        user.taskCounter++;
        user.lines[1] = str(user.taskCounter);
        
        // check if correct
        if(Long.parseLong(calcInput.getText()) == currentTaskSet.tasks[taskIndex].getAnswer())
        {
          user.taskCounterCorrect++;
          user.lines[2] = str(user.taskCounterCorrect);
          starCount++;
          
        }
        // save userdata again???
        saveStrings(user.userFile, user.lines);
       
        // save time to times list
        times[taskIndex] = millis() - startTime;
  
        // after last task
        if (taskIndex == 4)
        {
          // update user stars
          starCount = 0;
          
          
          // calculate average
          int avg = 0;
          for (int i = 0; i < 5; i++)
            avg += times[i];
          avg /= 5;
          println("avg: " + avg);
          
          // save average and params
          user.saveNewData(avg, currentTaskSet.params, calcType);
          taskIndex = 0;
          //println("old params: " + currentTaskSet.params.digits + "; " + currentTaskSet.params.carryRatio);
          Parameters p = user.getBestDataPoints(15, calcType);
          currentTaskSet = GenerateTaskSet(ml.GenerateParameters(p, user.dataCount()), calcType);
          startTask();
        }
        else
        {
          taskIndex++;
          startTask();
        }
      }
      
    }
    if (theEvent.getController().getName() == "tilbage")
    {
      Close();
      currentScreen = new MainScreen();
    }
  }
}
