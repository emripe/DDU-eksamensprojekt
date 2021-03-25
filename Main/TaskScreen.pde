class TaskScreen extends Screen
{
  TaskSet currentTaskSet;
  String calcInfo;
  String calcAnswer;
  Textfield calcInput = cp5.addTextfield("calcInput");
  Textarea info = cp5.addTextarea("info");
  Button answerButton = cp5.addButton("svar");
  TaskScreen()
  {
    info
      .setSize(1000, 30)
      .setPosition(200,200)
      .setText("popoo");
      
    calcInput
      .setSize(50, 30)
      .setPosition(width/4*3, 450);
      
    answerButton
      .activateBy(ControlP5.RELEASE);
      
    currentTaskSet = GenerateTaskSet(ml.GenerateParameters(null));
    Task t = currentTaskSet.tasks[0];
    info.setText(t.numbers[0] + " + " + t.numbers[1]);
    
  }
  void Update()
  {
        background(154, 195, 223);
    calcAnswer = calcInput.getText();
  }
  void Close()
  {
  }
  
  int i = 0;
  void HandleEvent(ControlEvent theEvent)
  {
    // answer button pressed
    if (theEvent.getController().getName() == "svar")
    {
      println("hej");
      println(Long.parseLong(calcAnswer));
      println(currentTaskSet.tasks[i].getAnswer());
      if (Long.parseLong(calcAnswer) == currentTaskSet.tasks[i].getAnswer())
      {
        println("correct");
      }
      else
        println("wrong");
      
      i++;
      info.setText(currentTaskSet.tasks[i].numbers[0] + " + " + currentTaskSet.tasks[i].numbers[1]);
      
      
    }
  }
  
}
