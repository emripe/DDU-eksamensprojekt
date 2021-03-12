class UserData {
  String userName;
  String password;
  boolean solved;
  float time;
  Parameters bestDataPoints;
  String userData;
  boolean newUser;
  UserData (boolean newUser, String userName, String password) {
    this.userName = userName;
    this.password = password;
    if (newUser){
      //opret bruger
      newUser=false;
    }
    if (newUser == false){
      // gør alt det andet
      
      String[] lines = loadStrings("data/UserData.txt");
    }
    
  } 
  Parameters getBestDataPoints() {

    return(bestDataPoints);
  }
}
