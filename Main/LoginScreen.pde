class LoginScreen extends Screen
{
  Button Login = cp5.addButton("Login");
  Textfield Username = cp5.addTextfield("Username");
  Textfield Password = cp5.addTextfield("Password");
  CColor c;
  String nameInput;
  String passInput;
  LoginScreen()
  {
  }

  void run()
  {
    PVector buttonPos = new PVector(width/2-75, height/3*2);
    background(221, 239, 255);
    c = new CColor()
      .setActive(color(0, 69, 50))
      .setBackground(color(0, 108, 79))
      .setForeground(color(0, 86, 63));

    Login
      .setPosition(buttonPos.x, buttonPos.y)
      .setSize(150, 30)
      .setColor(c);

    Username 
      .setPosition(buttonPos.x-25, buttonPos.y - 100)
      .setSize(200, 30)
      .setColor(c)
      .setColorLabel(0);

    Password 
      .setPosition(buttonPos.x-25, buttonPos.y - 50)
      .setSize(200, 30)
      .setColor(c)
      .setColorLabel(0);

    nameInput = Username.getText();
    passInput = Password.getText();
    
    /*
    if(Login.isMousePressed() == true)
    {
      screen.status = 1;
    }*/
    
  }
}
