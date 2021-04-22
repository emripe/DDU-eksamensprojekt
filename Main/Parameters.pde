class Parameters
{

  float digits;
  float carryRatio;
  
  public Parameters(float digits, float carryRatio){
    this.digits = digits;
    this.carryRatio = carryRatio;
  }
}

class TimeParametersPair
{
  float time;
  Parameters params;
  public TimeParametersPair(float time, Parameters params)
  {
    this.time = time;
    this.params = params;
  }
}
