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
  Textarea username = cp5.addTextarea("username");
  Textarea userStarCount = cp5.addTextarea("userStarCount");
  Button answerButton = cp5.addButton("svar");
  CColor c = new CColor();
  CColor cB = new CColor();
  CColor cA = new CColor();
  CColor cG = new CColor();
  PImage addition = loadImage("AdditionsTegn.png");
  PImage subtraktion = loadImage("SubtraktionsTegn.png");
  PImage multiplikation = loadImage("MultiplikationsTegn.png");
  PImage division = loadImage("DivisionsTegn.png");
  String fileString;
  int taskIndex = 0;
  int startTime;

  // stars
  int starCount = 3;
  PImage starImg = loadImage("star.png");
  int starAnimationTime = -1;
  int starAnimationDuration = 100;

  int buttonCount = 4;
  Button [] taskTypes = new Button [buttonCount];


  int[] times = new int[5];

  CalcType calcType = CalcType.addition;

  TaskScreen(CalcType calcType)
  {
    this.calcType = calcType;
    
    user.taskCounter = int(user.lines[1]);
    user.taskCounterCorrect = int(user.lines[2]);


    for (int i = 0; i < buttonCount; i++)
    {
      taskTypes[i] = cp5.addButton("Button "+i);
      taskTypes[i]
        .setPosition(0, 90  +175*i)
        .setSize(width/5+25, height/5+10);
    }


    c
      .setActive(color(228, 232, 235))
      .setBackground(color(195, 205, 212))
      .setForeground(color(223, 231, 237));

    cA
      .setActive(color(255, 153, 176))
      .setBackground(color(224, 99, 145))
      .setForeground(color(255, 123, 166));

    cG
      .setActive(color(92, 135, 110))
      .setBackground(color(122, 180, 146))
      .setForeground(color(107, 158, 128));

    cB
      .setActive(color(177, 206, 250))
      .setBackground(color(153, 181, 225))
      .setForeground(color(165, 195, 242));
    for (int i = 0; i < buttonCount; i++)
    {
      switch(i)
      {
      case 0:
        taskTypes[i]
          .setColor(cA)
          .setImage(addition);
        break;

      case 1:
        taskTypes[i]
          .setColor(c)
          .setImage(subtraktion);
        break;

      case 2:
        taskTypes[i]
          .setColor(cG)
          .setImage(multiplikation);
        break;

      case 3:
        taskTypes[i]
          .setColor(cB)
          .setImage(division);
        break;
      }
    }
    title
      .setPosition(width/5+40, 20)
      .setText("addition")
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

    username
      .setPosition(width/2+20, 35)
      .setFont(DefaultFont)
      .setText(user.userName)
      .setColorValue(color(0));
      
    userStarCount
      .setPosition(width/3*2+30, 35)
      .setFont(DefaultFont)
      .setText("3")
      .setColorValue(color(0));

    currentTaskSet = GenerateTaskSet(ml.GenerateParameters(user.getBestDataPoints(15, calcType), user.dataSetCount()), calcType);
    startTask();
  }
  void Update()
  {
    background(154, 195, 223);
    fill(123, 156, 178);
    stroke(123, 156, 178);
    //rect(width/5, 0, 20, height);
    fill(235);
    stroke(235);
    rect(width/5+30, 100, 900, 650, 10);
    
    rect(width/2, 5, width/4, 90, 10);
    
    
    if (starCount == 4 && starAnimationTime == -1)
    {
      starAnimationTime = 0;
    }
    if (starAnimationTime >= 0)
    {
      for (int i = 0; i < starCount; i++)
      {
        if (starAnimationTime == 120)
        {
          starAnimationTime = -1;
        }
        int localTime = max(0, starAnimationTime - 20*i);;
        
        float x = lerp(width/5*4 + (i*30), userStarCount.getPosition()[0], float(localTime)/float(starAnimationDuration-(20*i)));
        x = constrain(x, userStarCount.getPosition()[0], width/5*4 + (i*30));
        image(starImg, x, 20);
        
        starAnimationTime++;
      }
    }
    else
    {
      for (int i = 0; i < starCount; i++)
      {
        image(starImg, width/5*4 + (i*30), 20);
      }
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
    username.remove();
    userStarCount.remove();
    for (int i = 0; i < buttonCount; i++)
    {
      taskTypes[i].remove();
    }
  }

  void startTask()
  {
    switch (calcType)
    {
    case addition:
      info.setText(currentTaskSet.tasks[taskIndex].numbers[0] + " + " + currentTaskSet.tasks[taskIndex].numbers[1]);
      break;
    case subtraction:
      info.setText(currentTaskSet.tasks[taskIndex].numbers[0] + " - " + currentTaskSet.tasks[taskIndex].numbers[1]);
      break;
    case multiplication:
      info.setText(currentTaskSet.tasks[taskIndex].numbers[0] + " * " + currentTaskSet.tasks[taskIndex].numbers[1]);
      break;
    case division:
      info.setText(currentTaskSet.tasks[taskIndex].numbers[0] + " / " + currentTaskSet.tasks[taskIndex].numbers[1]);
      break;
    }
    taskProgress.setText("opgave " + (taskIndex+1) + " ud af 5");
    startTime = millis();
  }

  void HandleEvent(ControlEvent theEvent)
  {
    button.play();
    println("event " + theEvent.getController().getName());
    
    switch (theEvent.getController().getName())
    {
      case  "Button 0":
        currentScreen = new TaskScreen(CalcType.addition);
        user.calcType = calcType;
        break;
      case  "Button 1":
        currentScreen = new TaskScreen(CalcType.subtraction);
        user.calcType = calcType;
        break;
      case  "Button 2":
        calcType = CalcType.multiplication;
        currentScreen = new TaskScreen(CalcType.multiplication);
        user.calcType = calcType;
        break;
      case  "Button 3":
        calcType = CalcType.division;
        currentScreen = new TaskScreen(CalcType.division);
        user.calcType = calcType;
        break;
    }
    
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
        if (Long.parseLong(calcInput.getText()) == currentTaskSet.tasks[taskIndex].getAnswer())
        {
          user.taskCounterCorrect++;
          user.lines[2] = str(user.taskCounterCorrect);
          starCount++;
        }

        if (Long.parseLong(calcInput.getText()) == currentTaskSet.tasks[taskIndex].getAnswer())
        {
          user.taskCounterCorrect++;
          user.lines[2] = str(user.taskCounterCorrect);
        }
        // save userdata again???
        saveStrings(user.userFile, user.lines);


        // save time to times list
        times[taskIndex] = millis() - startTime;

        // after last task

        /*
        println("guess: " + Long.parseLong(calcInput.getText()));
         println("answer: " + currentTaskSet.tasks[taskIndex].getAnswer());
         
         if (Long.parseLong(calcInput.getText()) == currentTaskSet.tasks[taskIndex].getAnswer())
         {
         println("correct");
         }
         else
         println("wrong");
         */

        times[taskIndex] = millis() - startTime;
        //println("time: " + times[taskIndex]);


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

          // save data here. avg & currentTaskSet.params

          user.saveNewData(avg, currentTaskSet.params, calcType);
          taskIndex = 0;
          //println("old params: " + currentTaskSet.params.digits + "; " + currentTaskSet.params.carryRatio);
          Parameters p = user.getBestDataPoints(15, calcType);
          currentTaskSet = GenerateTaskSet(ml.GenerateParameters(p, user.dataSetCount()), calcType);
          startTask();
        } else
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
