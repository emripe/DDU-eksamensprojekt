class MachineLearning
{
  int minDataPoints = 5;
  Parameters GenerateParameters(Parameters baseParams, int dataCount)
  {
    int digits = 0;
    float carryRatio = 0;
    
    if (baseParams == null || dataCount < minDataPoints)
    {    
      digits = round(random(1,3));
      carryRatio = random(1);
    }
    else
    {
      digits = round(random(baseParams.digits-1, baseParams.digits+1));
      carryRatio = round(random(baseParams.carryRatio - 0.1, baseParams.digits+ 0.1));
    }
    
    Parameters p = new Parameters(digits, carryRatio);
    println("generated parameters:");
    println("digits: " + p.digits);
    println("carryRatio: " + p.carryRatio);
    
    return p;
  }
}
