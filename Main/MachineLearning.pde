 class MachineLearning
{
  int minDataPoints = 5;
  float targetTime = 3;
  Parameters GenerateParameters(TimeParametersPair tpPair, float dataCount)
  {
    Parameters baseParams = tpPair.params;
    float time = tpPair.time;
    
    float digits = 0;
    float carryRatio = 0;
    
    if (baseParams == null || dataCount < minDataPoints)
    {
      println("base: none");
      digits = random(0.5,2.5);
      carryRatio = random(1);
    }
    else
    {
      println("base: " + baseParams.digits + ", " + baseParams.carryRatio);
      float range = pow((targetTime-time)/targetTime,1.1); //(1-/dataCount/2)
      println("range: " + range);
      digits = max(0.5, random(baseParams.digits-range, baseParams.digits+range));
      carryRatio = constrain(random(baseParams.carryRatio - range, baseParams.carryRatio + range), 0, 1);
    }
    
    Parameters p = new Parameters(digits, carryRatio);
    println("new: " + p.digits + ", " + p.carryRatio);
    println();
    return p;
  }
}
