class MachineLearning
{
  int minDataPoints = 0;
  Parameters GenerateParameters(Parameters baseParams, int dataCount)
  {
    float digits = 0;
    float carryRatio = 0;
    
    if (baseParams == null || dataCount < minDataPoints)
    {    
      digits = random(1,3);
      carryRatio = random(1);
    }
    else
    {
      digits = random(baseParams.digits-0.4, baseParams.digits+0.4);
      carryRatio = constrain(random(baseParams.carryRatio - 0.1, baseParams.carryRatio + 0.1), 0, 1);
    }
    
    Parameters p = new Parameters(digits, carryRatio);
    println("generated parameters:");
    println("digits: " + p.digits);
    println("carryRatio: " + p.carryRatio);
    
    return p;
  }
}
