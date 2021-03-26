class UserData {
  String userName;
  String password;
  boolean solved;
  float time;
  Parameters bestDataPoints;
  String userData;
  boolean existingUser;
  String[] lines;
  File user; 
  
  UserData (boolean newUser, String userName, String password) {
    this.userName = userName;
    this.password = password;
    
    user = dataFile("data/" + userName +".txt");
    String filePath = user.getPath();
    existingUser = user.isFile();
    
    if (existingUser == true){           // tjek om password passer
      String[] lines = loadStrings(user);
      if (lines[0]!=password){
        existingUser=false;
      }
    }
    
    if (existingUser == false){ //opret bruger
      createWriter(user);
      String[] lines = new String[1];
      lines[0]=password;
      saveStrings(user, lines); // 1. linje i filen bliver ens password
      existingUser=true;
      //String[] lines = {password};
    }
  }
  
  
  void saveNewData(float time, Parameters parameter){
    String newLine = str(time)+";"+parameter.digits+";"+parameter.carryRatio;
    lines = new String[lines.length+1];
    lines[lines.length-1]=newLine;
    saveStrings(user,lines);
  }
  
  
  Parameters getBestDataPoints(int optimalTime) { 
    
    int bestNum=0;            // nummer på bedste værdi 
    float bestVal=2000000000; // bedste værdis afstand fra den optimale tid
    int len=50;               // antal opgaver der skal gennemgås
    
    if (lines.length<50){
      len=lines.length;
    }
    
    for (int i=0; i<len; i++){
      float[] taskInfo = float(split(lines[i],";"));
      float currentVal=abs(taskInfo[0]-optimalTime); // den nuværende tids afstand fra den optimale tid
      
      if (currentVal<bestVal){
        bestNum=i;
        bestVal=currentVal;
      }
    }
    
    float[] taskInfo = float(split(lines[bestNum],";"));
    bestDataPoints = new Parameters(int(taskInfo[1]), taskInfo[2]);
    return(bestDataPoints);
  }
}
