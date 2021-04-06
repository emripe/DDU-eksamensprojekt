class UserData {
  String userName;
  String password;
  boolean solved;
  float time;
  Parameters bestDataPoints;
  String userData;
  boolean existingUser;
  String[] lines;
  File userFile; 
  
  UserData (boolean existingUser, String userName, String password) {
    this.userName = userName;
    this.password = password;
    this.existingUser = existingUser;
    
    userFile = dataFile("data/" + userName +".txt");
    
    if (existingUser == true){
      lines = loadStrings(userFile);
    }
    
    if (existingUser == false){ //opret bruger
      createWriter(userFile);
      lines = new String[1];
      lines[0]=password;
      saveStrings(userFile, lines); // 1. linje i filen bliver ens password
      existingUser=true;
    }
  }
  
  
  void saveNewData(float time, Parameters parameter){
    String newLine = str(time)+";"+parameter.digits+";"+parameter.carryRatio;
    lines = append(lines, newLine);
    saveStrings(userFile,lines);
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
  
  
  int dataCount(){
    int num = lines.length-1;
    return (num);
  }
}
