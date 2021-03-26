Task GenerateTask(Parameters params) {
  long dig1=0, dig2=0;
  long num1=0, num2=0;
  long digits = round(params.digits);
  float carryRatio = params.carryRatio;
  long lowerBound=1;

  for (int i=0; i<digits; i++) {
    if (random(1) > carryRatio) { // sum af de to tal er max 10
      dig1=int(random(lowerBound,9));
      dig2 = int(random(lowerBound, 9-dig1));
    } else { // sum af de to tal er mindst 10
      dig1=int(random(1,9));
      dig2 = int(random(10-dig1, 9));
    }
    num1 = num1*10+dig1;
    num2 = num2*10+dig2;
    lowerBound=0;
  }
  Task task = new Task(num1,num2);
  return (task);
}

TaskSet GenerateTaskSet(Parameters params)
{
  Task[] tasks = new Task[5];
  for (int i = 0; i < 5; i++)
  {
    tasks[i] = GenerateTask(params);
  }
  return new TaskSet(params, tasks);
}
