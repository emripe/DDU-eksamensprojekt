class TaskScreen extends Screen
{
  String calcInfo;
  String calcAnswer;
  Textfield calcInput = cp5.addTextfield("calcInput");
  Textarea info = cp5.addTextarea("info");
  void run()
  {
    background(154, 195, 223);
    info.setText(calcInfo)
      .setSize(100, 30)
      .setPosition(width/4*2, 450);

    calcInput
      .setSize(50, 30)
      .setPosition(width/4*3, 450);
      
    calcAnswer = calcInput.getText();
  }
}
