class LoginScreen extends Screen
{
  Button Login = cp5.addButton("Login");
  Textfield Username = cp5.addTextfield("Username");
  Textfield Password = cp5.addTextfield("Password");
  CColor c = new CColor();
  String nameInput;
  String passInput;
  PVector buttonPos = new PVector(width/2-75, height/3*2);

  LoginScreen()
  {
    background(221, 239, 255);
    c
      .setActive(color(0, 69, 50))
      .setBackground(color(0, 108, 79))
      .setForeground(color(0, 86, 63));

    Login
      .setPosition(buttonPos.x, buttonPos.y)
      .setSize(150, 30)
      .setColor(c)
      .setFont(DefaultFont);

    Username 
      .setPosition(buttonPos.x-25, buttonPos.y - 150)
      .setSize(200, 30)
      .setColor(c)
      .setColorLabel(0)
      .setFont(DefaultFont);

    Password 
      .setPosition(buttonPos.x-25, buttonPos.y - 70)
      .setSize(200, 30)
      .setColor(c)
      .setColorLabel(0)
      .setFont(DefaultFont);
  }

  void Update()
  {


    nameInput = Username.getText();
    passInput = Password.getText();


    if (Login.isMousePressed() == true)
    {
      File file = dataFile("data/" + nameInput +".txt");
      boolean existingUser;
      
      String filePath = file.getPath();
      existingUser = file.isFile();
      
      if (existingUser == true) 
      {           // tjek om password passer
        String[] lines = loadStrings(file);
        
        if (!lines[0].equals(passInput)) 
        {
          return;
        }
      }
      user = new UserData(existingUser, nameInput, passInput); 
      Close();
      currentScreen = new MainScreen();
    }
  }
  void Close()
  {
    Login.remove();
    Username.remove();
    Password.remove();
  }
}
