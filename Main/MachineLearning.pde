 class MachineLearning
{
  int minDataPoints = 5;
  Parameters GenerateParameters(Parameters baseParams, float dataCount)
  {
    if (baseParams != null)
      println("base: " + baseParams.digits + ", " + baseParams.carryRatio);
    float digits = 0;
    float carryRatio = 0;
    
    if (baseParams == null || dataCount < minDataPoints)
    {    
      digits = random(0.5,2.5);
      carryRatio = random(1);
    }
    else
    {
      digits = max(0.5, random(baseParams.digits-(1/(dataCount/2)), baseParams.digits+(1/(dataCount/2))));
      carryRatio = constrain(random(baseParams.carryRatio - (1/(dataCount/2)), baseParams.carryRatio + (1/(dataCount/2))), 0, 1);
    }
    
    Parameters p = new Parameters(digits, carryRatio);
    println("new: " + p.digits + ", " + p.carryRatio);
    println();
    return p;
  }
}
