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
  }
  void Update()
  {
        background(154, 195, 223);
    calcAnswer = calcInput.getText();
  }
  void Close()
  {
  }
  int i = 1;
  void HandleEvent(ControlEvent theEvent)
  {
    if (theEvent.getController().getName() == "svar")
    {
      println("hej");
      
      
      Task t = GenerateTask(ml.GenerateParameters(null));
      //Task t = taskGenerator(new Parameters(i, 0.5));
      info.setText(t.numbers[0] + " + " + t.numbers[1]);
      i++;
    }
  }
  
}
