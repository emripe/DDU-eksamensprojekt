class Task
{
  long[] numbers;
  
  Task(long[] numbers)
  {
    this.numbers = numbers;
  }
  
  Task(long a, long b)
  {
    numbers = new long[] {a, b};
  }
  
  public long getAnswer()
  {
    return numbers[0] + numbers[1];
  }
}
