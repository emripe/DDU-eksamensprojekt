Screen screen = new Screen();
LoginScreen logScreen = new LoginScreen();
class Screen
{
  int status = 0;

  Screen()
  {
  }

  void run()
  {
    if (status == 0)
    {
      logScreen.run();
    }
  }
}
