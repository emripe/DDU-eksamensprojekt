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
  int [] tasksCounter = new int [5];
  int [] tasksCounterCorrect = new int [5];
  int starCount;
  CalcType calcType = CalcType.addition;

  UserData (boolean existingUser, String userName, String password) {
    this.userName = userName;
    this.password = password;
    this.existingUser = existingUser;

    userFile = dataFile("data/" + userName +".txt");

    if (existingUser == true) {
      lines = loadStrings(userFile);
      tasksCounter[0] = int(lines[1]);
      tasksCounterCorrect[0] = int(lines[2]);
      tasksCounter[1] = int(lines[3]);
      tasksCounterCorrect[1] = int(lines[4]);
      tasksCounter[2] = int(lines[5]);
      tasksCounterCorrect[2] = int(lines[6]);
      tasksCounter[3] = int(lines[7]);
      tasksCounterCorrect[3] = int(lines[8]);
      tasksCounter[4] = int(lines[9]);
      tasksCounterCorrect[4] = int(lines[10]);
      starCount = int(lines[11]);
      findPos();
    }

    if (existingUser == false) { //opret bruger
      createWriter(userFile);
      lines = new String[16];
      lines[0]=password;
      lines[1] = str(tasksCounter[0]);
      lines[2] = str(tasksCounterCorrect[0]);
      lines[3] = str(tasksCounter[1]);
      lines[4] = str(tasksCounterCorrect[1]);
      lines[5] = str(tasksCounter[2]);
      lines[6] = str(tasksCounterCorrect[2]);
      lines[7] = str(tasksCounter[3]);
      lines[8] = str(tasksCounterCorrect[3]);
      lines[9] = str(tasksCounter[4]);
      lines[10] = str(tasksCounterCorrect[4]);
      lines[11] = str(starCount);
      lines[12]="addition";
      lines[13]="subtraction";
      lines[14]="multiplication";
      lines[15]="division";
      additionPos=1;
      subtractionPos=2;
      multiplicationPos=3;
      divisionPos=4;
      for (CalcType c : CalcType.values())
      {
        saveNewData(0, new Parameters(0, 0, 0), c);
      }
      saveStrings(userFile, lines); // 1. linje i filen bliver ens password og de næste 4 bliver de fire regnekategorier
      existingUser=true;
    }
  }
  void findPos() {
    for (int i=1; i<lines.length; i++) {
      if (lines[i].equals("addition")) {
        additionPos=i;
      }
      if (lines[i].equals("subtraction")) {
        subtractionPos=i;
      }
      if (lines[i].equals("multiplication")) {
        multiplicationPos=i;
      }
      if (lines[i].equals("division")) {
        divisionPos=i;
      }
    }
  }

  void saveStars() {
    lines[11] = str(starCount);
    saveStrings(userFile, lines);
  }
  
  void saveNewData(float time, Parameters parameter, CalcType calcType) { // tilføj regnetyper, og sørg for at den nye linje bliver gemt det rigtige sted
    String newLine = time/1000+";"+parameter.digits1+";"+parameter.digits2+";"+parameter.carryRatio;

    findPos();
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
      lines = splice(lines, newLine, divisionPos+1);
      break;
    }
    saveStrings(userFile, lines);
    findPos();
  }


  TimeParametersPair getBestDataPoints(float optimalTime, CalcType calcType) { // tilføj regnetyper og find den bedste værdi under det rigtige emne
    this.calcType = calcType;
    int bestNum=0;            // nummer på bedste værdi 
    float bestVal=2000000000; // bedste værdis afstand fra den optimale tid
    int startVal = 0;
    int endVal = 0;
    switch (calcType)
    {
    case addition:
      startVal = additionPos+1;
      endVal = subtractionPos;
      break;
    case subtraction:
      startVal = subtractionPos+1;
      endVal = multiplicationPos;
      break;
    case multiplication:
      startVal = multiplicationPos+1;
      endVal = divisionPos;
      break;
    case division:
      startVal = divisionPos+1;
      endVal = lines.length;
      break;
    }

    if (endVal-startVal>50) {
      endVal=startVal+50;
    }

    for (int i=startVal; i<endVal; i++) {
      float[] taskInfo = float(split(lines[i], ";"));
      float currentVal=abs(taskInfo[0]-optimalTime); // den nuværende tids afstand fra den optimale tid

      if (currentVal<bestVal) {
        bestNum=i;
        bestVal=currentVal;
      }
    }

    float[] taskInfo = float(split(lines[bestNum], ";"));
    bestDataPoints = new Parameters(taskInfo[1], taskInfo[2], taskInfo[3]);
    return new TimeParametersPair(bestVal, bestDataPoints);
  }


  int dataSetCount() { // sum af alle rengearter
    int num = lines.length-additionPos-4;
    return (num);
  }

  int dataSetCount(CalcType calcType) { // gør så man tæller antal linjer for et bestemt emne
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
