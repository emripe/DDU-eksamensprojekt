class UserData {
  String userName;
  String password;
  boolean solved;
  float time;
  Parameters bestDataPoints;
  String userData;
  boolean existingUser;
  String[] newlines;
  UserData (boolean newUser, String userName, String password) {
    this.userName = userName;
    this.password = password;
    
    // tjek om newUser==false (gennemgå dokumenterne og tjek efter username - hvis det eksisterer )
    // isdirectory  -  directoylist
    File user = dataFile("data/" + userName +".txt");
    String filePath = user.getPath();
    existingUser = user.isFile();
    // tjek om password passer
    
    if (existingUser == false){ //opret bruger
      createWriter(user);
      newlines = new String[1];
      newlines[0]=password;
      saveStrings(user, newlines); // 1. linje i filen bliver ens password
      existingUser=true;
      String[] lines = {password};
    }
    if (existingUser == true){
      // gør alt det andet
      
      String[] lines = loadStrings(user);
    }
    
  } 
  Parameters getBestDataPoints() { 
    
    // returner de parametre hvor tiden kom tættest på det optimale tidsrum (10 sek?)
    

    return(bestDataPoints);
  }
}
