 class MachineLearning
{
  int minDataPoints = 5;
  float targetTime = 15;
  Parameters GenerateParameters(TimeParametersPair tpPair, float dataCount)
  {
    Parameters baseParams = tpPair.params;
    float time = tpPair.time;
    
    float digits1 = 0;
    float digits2 = 0;
    float carryRatio = 0;
    
    if (baseParams == null || dataCount < minDataPoints)
    {
      println("base: none");
      digits1 = random(0.5,2.5);
      digits2 = random(0.5,2.5);
      if (digits2 > digits1) // swap
      {
        float tmp = digits1;
        digits1 = digits2;
        digits2 = tmp;
      }
      carryRatio = random(1);
    }
    else
    {
      float range = pow((targetTime-time)/targetTime,1.1); //(1-/dataCount/2)
      digits1 = max(0.5, random(baseParams.digits1-range, baseParams.digits1+range));
      digits2 = max(0.5, random(baseParams.digits2-range, baseParams.digits2+range));
      if (digits2 > digits1) // swap
      {
        float tmp = digits1;
        digits1 = digits2;
        digits2 = tmp;
      }
      carryRatio = constrain(random(baseParams.carryRatio - range, baseParams.carryRatio + range), 0, 1);
      
      println("base: " + baseParams.digits1 + ", " + baseParams.digits2 + ", " + baseParams.carryRatio);
      println("range: " + range);
    }
    
    Parameters p = new Parameters(digits1, digits2, carryRatio);
    println("new: " + p.digits1 + ", " + p.digits2 + ", " + p.carryRatio);
    println();
    return p;
  }
}
