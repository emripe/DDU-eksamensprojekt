class Task
{
  CalcType calcType;
  long[] numbers;
  long returnNum=0;
  
  Task(long[] numbers)
  {
    this.numbers = numbers;
  }
  
  Task(long a, long b, CalcType calcType)
  {
    this.calcType = calcType;
    numbers = new long[] {a, b};
  }
  
  public long getAnswer()
  {switch (calcType)
  {
  case addition:
    returnNum = numbers[0] + numbers[1];
    break;
  case subtraction:
    returnNum = numbers[0] - numbers[1];  
    break;
  case multiplication:
    returnNum = numbers[0] * numbers[1];
    break;
  case division:
    returnNum = numbers[0] / numbers[1];
    break;
  }
    return returnNum;
  }
}
