class Parameters
{

  float digits1;
  float digits2;
  float carryRatio;
  
  public Parameters(float digits1, float digits2, float carryRatio){
    this.digits1 = digits1;
    this.digits2 = digits2;
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
