Task GenerateTask(Parameters params, CalcType calcType) { // Funktion der genererer opgaver
  long dig1=0, dig2=0;
  long num1=0, num2=0;
  long digits = round(params.digits);
  float carryRatio = params.carryRatio;
  int lowerBound=1;
  switch (calcType)
  {
  case addition:
    for (int i=0; i<digits; i++) {
      if (random(1) > carryRatio) { // sum af de to tal er max 10
        dig1 = int(random(lowerBound, 9));
        dig2 = int(random(lowerBound, 9-dig1));
      } else { // sum af de to tal er mindst 10
        dig1 = int(random(lowerBound, 9));
        dig2 = int(random(10-dig1, 9));
      }
      num1 = num1*10+dig1;
      num2 = num2*10+dig2;
      lowerBound=0;
    }        
    break;
  case subtraction:
    lowerBound = 1;
    for (int i=0; i<digits; i++) {
      if (i == digits-1 && num2>num1) {// til det forreste ciffer. Sørger for at resultatet ikke er negativt
        
        dig1 = int(random(0, 9));
        dig2 = int(random(0, dig1));
        println("dig1: " + dig1);
        num1 += dig1*pow(10,i);
        num2 += dig2*pow(10,i);
        
      }
      else {
        if (random(1) > carryRatio || num1==0) { // tal giver sammen 0+
          dig1 = int(random(lowerBound, 9));
          dig2 = int(random(lowerBound, dig1));
        }
        else { // tal giver sammen <0
          dig1 = int(random(lowerBound, 8));
          dig2 = int(random(dig1+1, 9));
        }
        /*
        if (num1==0) {
          if (dig2>dig1) {
            long temp = dig2;
            dig2=dig1;
            dig1=temp;
          }
        }
        */
        num1 = num1*10+dig1;
        num2 = num2*10+dig2;
        lowerBound=1;
      }
    }  
    break;
  case multiplication:
    

    break;
  case division:

    break;
  }

  Task task = new Task(num1, num2, calcType);
  return (task);
}

TaskSet GenerateTaskSet(Parameters params, CalcType calcType)
{
  Task[] tasks = new Task[5];
  for (int i = 0; i < 5; i++)
  {
    tasks[i] = GenerateTask(params, calcType);
  }
  return new TaskSet(params, tasks);
}



// Minus     - det samme som plus, man tjekker bare om resultatet går under 0 i stedet for over 10 og resultatet må ikke være negativt
// Gange     - fokus på tabeller - let - de små tabeller (tal under 10) - meget let - tal under 5? - svær - to cifre...
// Dividere  - resultat skal være hele tal (let). stort tal divideret med lille tal fx 140/7
