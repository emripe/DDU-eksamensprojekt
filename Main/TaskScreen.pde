class TaskScreen extends Screen
{
  TaskSet currentTaskSet;
  String calcInfo;
  String calcAnswer;
  Button tilbage = cp5.addButton("tilbage");
  Textfield calcInput = cp5.addTextfield("calcInput");
  Textarea info = cp5.addTextarea("info");
  String labelText = " ";
  int labelTextWidth = 0;
  Textarea taskProgress = cp5.addTextarea("taskProgress");
  Textarea title = cp5.addTextarea("title");
  Textarea username = cp5.addTextarea("username");
  Textarea userStarCount = cp5.addTextarea("userStarCount");
  Textarea resultText = cp5.addTextarea("resultText"); 
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
  int starCount = 0;
  PImage starImg = loadImage("star.png");
  PImage TavleImg = loadImage("TavleEtEllerAndet.png");
  int starAnimationTime = -1;
  int starAnimationDuration = 60;

  int buttonCount = 4;
  Button [] taskTypes = new Button [buttonCount];

  boolean showAnswer = false;


  int[] times = new int[5];

  CalcType calcType = CalcType.addition;

  TaskScreen(CalcType calcType)
  {
    this.calcType = calcType;


    for (int i = 0; i < buttonCount; i++)
    {
      taskTypes[i] = cp5.addButton("Button "+i);
      taskTypes[i]
        .setPosition(0, 90  +175*i)
        .setSize(width/5+25, height/5+10);
    }


    c
      .setActive(color(228, 232, 235, 0))
      .setBackground(color(37, 89, 67))
      .setForeground(color(223, 231, 237, 0));

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
      .setSize(labelTextWidth, 1000)
      .setPosition(600, height/2)
      .setColor(color(255))
      .setFont(BlackboardFont);

    taskProgress
      .setSize(1000, 30)
      .setPosition(width/5*4, 110)
      .setColor(color(255))
      .setFont(DefaultFont);


    calcInput
      .setSize(200, 60)
      .setPosition(800, height/2)
      .setColor(c)
      .setColorCaptionLabel(color(0, 255, 0, 0))
      .setColorValue(color(255))
      .setLabel("")
      .setInputFilter(ControlP5.INTEGER)
      .setFont(BlackboardFont);
      
    resultText
      .setSize(1000, 100)
      .setPosition(600, height/2+100)
      .setColor(color(255))
      .setFont(DefaultFont)
      .hide();

    answerButton
      .activateBy(ControlP5.RELEASE)
      .setPosition(800, 600)
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
      .setText(str(user.starCount))
      .setColorValue(color(0));
    if (user.dataSetCount() > 0)
      currentTaskSet = GenerateTaskSet(ml.GenerateParameters(user.getBestDataPoints(15, calcType), user.dataSetCount()), calcType);
    else
      currentTaskSet = GenerateTaskSet(ml.GenerateParameters(null, 0), calcType);
    startTask();
  }
  void Update()
  {
    background(154, 195, 223);
    fill(123, 156, 178);
    stroke(123, 156, 178);
    image(TavleImg, width/5+30, 100);
    //rect(width/5, 0, 20, height);
    fill(235);
    stroke(235);
    //rect(width/5+30, 100, 900, 650, 10);

    rect(width/2, 5, width/4, 90, 10);

    if (starAnimationTime >= 0)
    {
      starAnimationTime++;
      for (int i = 0; i < starCount; i++)
      {
        int localTime = max(0, starAnimationTime - 20*i);

        if (localTime == starAnimationDuration)
        {
          Star.play();
          userStarCount.setText(str(int(userStarCount.getText())+1));
          if (i == starCount-1)
          {
            starAnimationTime = -1;
            starCount = 0;
          }
        }

        if (localTime >= starAnimationDuration)
          continue;


        float x = lerp(width/5*4 + (i*30), userStarCount.getPosition()[0], float(localTime)/float(starAnimationDuration));
        x = constrain(x, userStarCount.getPosition()[0], width/5*4 + (i*30));
        float y = 20 + sin(radians(float(localTime)/float(starAnimationDuration)*180))*30;
        image(starImg, x, y);
      }
    } else
    {
      for (int i = 0; i < starCount; i++)
      {
        image(starImg, width/5*4 + (i*30), 20);
      }
    }
    //calcInput.setFocus(true);
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
      labelText = currentTaskSet.tasks[taskIndex].numbers[0] + " + " + currentTaskSet.tasks[taskIndex].numbers[1] + " = ";
      info.setText(labelText);
      break;
    case subtraction:
      labelText = currentTaskSet.tasks[taskIndex].numbers[0] + " - " + currentTaskSet.tasks[taskIndex].numbers[1] + " = ";
      info.setText(labelText);
      break;
    case multiplication:
      labelText = currentTaskSet.tasks[taskIndex].numbers[0] + " * " + currentTaskSet.tasks[taskIndex].numbers[1] + " = ";
      info.setText(labelText);
      break;
    case division:
      labelText = currentTaskSet.tasks[taskIndex].numbers[0] + " / " + currentTaskSet.tasks[taskIndex].numbers[1] + " = ";
      info.setText(labelText);
      break;
    }

    labelTextWidth = int(textWidth(labelText))*3;
    info.setSize(labelTextWidth, 1000);
    info.setPosition(850-labelTextWidth, height/2);

    taskProgress.setText("opgave " + (taskIndex+1) + " ud af 5");
    startTime = millis();

    calcInput.clear();
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
      if (!calcInput.getText().equals("") || showAnswer)
      {
        showAnswer = !showAnswer;
        if (showAnswer)
        {
          
          
          switch(calcType)
          {
          case addition:
            user.tasksCounter[1]++;
            user.lines[3] = str(user.tasksCounter[1]);
            break;

          case subtraction:
            user.tasksCounter[2]++;
            user.lines[5] = str(user.tasksCounter[2]);

            break;
          case multiplication:
            user.tasksCounter[3]++;
            user.lines[7] = str(user.tasksCounter[3]);

            break;
          case division:
            user.tasksCounter[4]++;
            user.lines[9] = str(user.tasksCounter[4]);

            break;
          }
          // increment task counter
          user.tasksCounter[0]++;
          user.lines[1] = str(user.tasksCounter[0]);


          resultText.show();
          // check if correct
          if (Long.parseLong(calcInput.getText()) == currentTaskSet.tasks[taskIndex].getAnswer())
          {
            starCount++;
            switch(calcType)
            {
            case addition:
              user.tasksCounterCorrect[1]++;
              user.lines[4] = str(user.tasksCounterCorrect[1]);
              break;
            case subtraction:
              user.tasksCounterCorrect[2]++;
              user.lines[6] = str(user.tasksCounterCorrect[2]);
              break;
            case multiplication:
              user.tasksCounterCorrect[3]++;
              user.lines[8] = str(user.tasksCounterCorrect[3]);
              break;
            case division:
              user.tasksCounterCorrect[4]++;
              user.lines[10] = str(user.tasksCounterCorrect[4]);
              break;
            }
            user.tasksCounterCorrect[0]++;
            user.lines[2] = str(user.tasksCounterCorrect[0]);
            
            resultText.setText("Det er rigtigt!");
          }
          else
          {
            resultText.setText("Desværre, men det rigtige svar er " + currentTaskSet.tasks[taskIndex].getAnswer());
          }
          // save userdata again???
          saveStrings(user.userFile, user.lines);


          // save time to times list
          times[taskIndex] = millis() - startTime;
          times[taskIndex] = millis() - startTime;
          //println("time: " + times[taskIndex]);


          if (taskIndex == 4)
          {
            // starts star animation
            starAnimationTime = 0;

            // calculate average
            int avg = 0;
            for (int i = 0; i < 5; i++)
              avg += times[i];
            avg /= 5;
            println("avg: " + avg);


            // save average and params
            user.saveNewData(avg, currentTaskSet.params, calcType);

            // update stars
            user.starCount += starCount;
            user.saveStars();
          }
        } else if (!showAnswer)
        {
          resultText.hide();
          if (taskIndex == 4)
          {
            taskIndex = 0;
            Parameters p = user.getBestDataPoints(15, calcType);
            currentTaskSet = GenerateTaskSet(ml.GenerateParameters(p, user.dataSetCount()), calcType);
            user.starCount += starCount;
            user.saveStars();
          }
          else
          {
            taskIndex++;
          }

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
