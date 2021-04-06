 class MachineLearning
{
  int minDataPoints = 0;
  Parameters GenerateParameters(Parameters baseParams, int dataCount)
  {
    float digits = 0;
    float carryRatio = 0;
    
    if (baseParams == null || dataCount < minDataPoints)
    {    
      digits = random(1,2.5);
      carryRatio = random(1);
    }
    else
    {
      digits = random(baseParams.digits-(1/(dataCount-3)), baseParams.digits+(1/(dataCount-3)));
      carryRatio = constrain(random(baseParams.carryRatio - (1/(dataCount-3)), baseParams.carryRatio + (1/(dataCount-3))), 0, 1);
    }
    
    Parameters p = new Parameters(digits, carryRatio);
    println("digits: " + p.digits + ", carry: " + p.carryRatio);
    return p;
  }
}
