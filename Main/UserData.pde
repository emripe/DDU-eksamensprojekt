class UserData {
  String userName;
  String password;
  boolean solved;
  float time;
  Parameters bestDataPoints;
  String userData;
  boolean existingUser;
  String[] lines; // kan gemme alt som filen indeholder
  int additionPos, subtractionPos, multiplicationPos, divisionPos; 
  File userFile; 
  
  UserData (boolean existingUser, String userName, String password) {
    this.userName = userName;
    this.password = password;
    this.existingUser = existingUser;
    
    userFile = dataFile("data/" + userName +".txt");
    
    if (existingUser == true){
      lines = loadStrings(userFile);
      findPos();
    }
    
    if (existingUser == false){ //opret bruger
      createWriter(userFile);
      lines = new String[5];
      lines[0]=password;
      lines[1]="addition";
      lines[2]="subtraction";
      lines[3]="multiplication";
      lines[4]="division";
      additionPos=1;
      subtractionPos=2;
      multiplicationPos=3;
      divisionPos=4;
      
      
      saveStrings(userFile, lines); // 1. linje i filen bliver ens password og de næste 4 bliver de fire regnekategorier
      existingUser=true;
    }
  }
  void findPos(){
    for (int i=1; i<lines.length; i++){
        if (lines[i].equals("addition")){
          additionPos=i;
        }
        if (lines[i].equals("subtraction")){
          subtractionPos=i;
        }
        if (lines[i].equals("multiplication")){
          multiplicationPos=i;
        }
        if (lines[i].equals("division")){
          divisionPos=i;
        }
      }
  }
  
  
  void saveNewData(float time, Parameters parameter, CalcType calcType){ // tilføj regnetyper, og sørg for at den nye linje bliver gemt det rigtige sted
    String newLine = str(time)+";"+parameter.digits+";"+parameter.carryRatio;
    
    switch (calcType)
    {
      case addition:
        lines = splice(lines, newLine, additionPos+1);
        break;
      case subtraction:
        lines = splice(lines, newLine, subtractionPos+1);
        break;
      case multiplication:
        lines = splice(lines, newLine, multiplicationPos+1);
        break;
      case division:
        lines = splice(lines, newLine, divisionPos+1); // virker ikke når det første divisionsstykke skal indsættes???????????????????????????????????????????????????--fiks?--
        break;
      
    }
    saveStrings(userFile,lines);
    findPos();
    
    }
  
  
  Parameters getBestDataPoints(int optimalTime, CalcType calcType) { // tilføj regnetyper og find den bedste værdi under det rigtige emne
    
    int bestNum=0;            // nummer på bedste værdi 
    float bestVal=2000000000; // bedste værdis afstand fra den optimale tid
    int len=50;               // antal opgaver der skal gennemgås
    
    switch (calcType)
    {
      case addition:
        
        break;
      case subtraction:
        
        break;
      case multiplication:
        
        break;
      case division:
        
        break;
      
    }
    
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
  
  
  int dataCount(){ // sum af alle rengearter
    int num = lines.length-5; // -5 er for hver af de linjer som ikke indeholder data om resultaterne
    return (num);
  }
  
  int dataCount(CalcType calcType){ // gør så man tæller antal linjer for et bestemt emne
    int num=-2000000;
    switch (calcType)
    {
      case addition:
        num = subtractionPos-additionPos;
        break;
        
      case subtraction:
        num = multiplicationPos-subtractionPos;
        break;
        
      case multiplication:
        num = divisionPos-multiplicationPos;
        break;
        
      case division:
        num = lines.length-divisionPos;
        break;
      
    }
    return (num);
  }
}
