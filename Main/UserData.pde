class UserData {
  String username;
  float money;
  int round = 1;
  String userData;
  int userNum=-1;
  float startAmount = 1000;
  String[] newlines;
  
  // Constructoren tager imod et brugernavn og søger efter brugeren i databasen. Hvis brugeren ikke findes oprettes der en ny
  UserData(String username) {
    this.username = username;
    
    //data hentes fra databasen
    String[] lines = loadStrings("data/UserData.txt");
    
    // Der oprettes et array og brugernavnene fra databasen lægges over i det
    String[] names = new String[lines.length];
    
    for (int j=0; j<lines.length; j++) {
      for (int i=0; i<lines[j].length(); i++) {
        
        //if-statementet søger efter 1. komma, for at seperere der og lægge navnet (teksten før kommaet) over i names[]
        if (lines[j].charAt(i)==',') {
          names[j]=(lines[j].substring(0, i));
          break;
        }
      }
    }
    
    // loopet gennemgår navnene og tjekker om de er lig med brugernavnet som blev sendt ind i constructoren. Hvis ja, bliver dataen om brugeren hentet
    for (int i=0; i<names.length; i++) {
      if (names[i].substring(0).equals(username)) {
        userNum=i;
        userData=lines[i];
        String userdata[]=split(userData,",");
        money=float(userdata[1]);
        round=int(userdata[2]);
      }
    }
    
    // Hvis brugernavnet ikke eksisterede i databasen, oprettes der en ny bruger
    if (userNum==-1) {
      // Dataen fra datafilen bliver lagt over i et nyt array med en ekstra plads til den nye bruger
      newlines = new String[lines.length+1];
      for (int i =0; i< newlines.length-1; i++) {
        newlines[i]=lines[i];
      }
      
      //Den sidste plads i arrayet bliver udfyldt med den nye brugers info
      newlines[newlines.length-1]= username+","+startAmount+",1";
      money=startAmount;
      userNum=newlines.length-1;
      saveStrings("data/UserData.txt", newlines);
    }
    
    // Hvis brugeren allerede eksisterede, skal databasens indhold være det samme som før
    else
      newlines=lines;   
  }
  
  // funktion til at tilføje penge, eller trække penge fra brugerens beløb
  void moneyRefresh(float addmoney) {
    money = money + addmoney;
    dataRefresh(money, round);
  }
  
  // funktion der fører brugeren til næste runde af kampe
  void nextround() {
    round++;
    dataRefresh(money, round);
  }
  
  //Funktion der gemmer brugerens oplysninger i databasen
  void dataRefresh(float money, int round){
    newlines[userNum]=username+","+money+","+round;
    saveStrings("data/UserData.txt", newlines);
  }
}
