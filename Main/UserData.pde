class UserData {
  String userName;
  String password;
  boolean solved;
  float time;
  Parameters bestDataPoints;
  String userData;
  boolean newUser;
  String[] newlines;
  UserData (boolean newUser, String userName, String password) {
    this.userName = userName;
    this.password = password;
    if (newUser){ //opret bruger
      createWriter("data/" + userName +".txt");
      newlines = new String[1];
      newlines[0]=password;
      saveStrings("data/" + userName +".txt", newlines); // 1. linje i filen bliver ens password
      newUser=false;
    }
    if (newUser == false){
      // gør alt det andet
      
      String[] lines = loadStrings("data/" + userName +".txt");
    }
    
  } 
  Parameters getBestDataPoints() {

    return(bestDataPoints);
  }
}
