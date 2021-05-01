Task GenerateTask(Parameters params, CalcType calcType) { // Funktion der genererer opgaver
  int dig1=0, dig2=0;
  long num1=0, num2=0;
  int digits1 = round(params.digits1);
  int digits2 = round(params.digits2);
  float carryRatio = params.carryRatio;
  int lowerBound1=0, lowerBound2=0;

  switch (calcType)
  {

  case addition:
    for (int i = 0; i < digits1; i++)
    {
      // sørger for at det største ciffer ikke er 0
      if (i == digits1-1)
        lowerBound1 = 1;
      if (i == digits2-1)
        lowerBound2 = 1;

      if (digits2 <= i) // hvis num1 har flere cifre skal der kun tilføjes til num1
        num1 += int(random(lowerBound1, 9))*pow(10, i);

      // hvis der skal tilføjes cifre til begge tal
      else
      {
        if (random(1) > carryRatio) // sum af de to tal er max 10
        { 
          dig1 = int(random(lowerBound1, 9));
          dig2 = int(random(lowerBound2, 9-dig1));
        } else // sum af de to tal er mindst 10
        { 
          dig1 = int(random(1, 9));
          dig2 = int(random(10-dig1, 9));
        }
        // tilføj ciffer til tal
        num1 += dig1*int(pow(10, i));
        num2 += dig2*int(pow(10, i));
      }
    }
    break;

  case subtraction:
    lowerBound1 = 1;
    lowerBound2 = 1;
    for (int i=0; i<digits1; i++) {
      if (digits2 <= i) // hvis num1 har flere cifre
      {
        dig1 = int(random(1, 9));
        num1 += dig1*pow(10, i);
      } else if (i == digits1-1 && num2>num1) {// til det forreste ciffer. Sørger for at resultatet ikke er negativt
        // dette kører aldrig?
        dig1 = int(random(0, 9));
        dig2 = int(random(0, dig1));
        num1 += dig1*pow(10, i);
        num2 += dig2*pow(10, i);
      } else {
        if (random(1) > carryRatio || num1==0) { // tal giver sammen 0+
          dig1 = int(random(lowerBound1, 9));
          dig2 = int(random(lowerBound2, dig1));
        } else { // tal giver sammen <0
          dig1 = int(random(lowerBound1, 8));
          dig2 = int(random(dig1+1, 9));
        }
        num1 = num1*10+dig1;
        num2 = num2*10+dig2;
        lowerBound1=1;
      }
    }  
    break;

  case multiplication:
    for (int i = 0; i < digits1; i++)
    {
    }

    break;

  case division:

    break;
  }

  Task task = new Task(num1, num2, calcType);
  return task;
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
