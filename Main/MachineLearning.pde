class MachineLearning
{
  int minDataPoints = 5;
  float targetTime = 15;

  // genererer parametre til opgaver. tager tid og parametre sammen som parameter
  Parameters GenerateParameters(TimeParametersPair tpPair)
  {
    Parameters baseParams = tpPair.params;
    float time = tpPair.time;

    // output parametre
    float digits1 = 0;
    float digits2 = 0;
    float carryRatio = 0;

    // hvis ingen parametre er inputtet (f.eks. hvis der ikke er nok datapunkter), vil den generere tilfældige 
    if (baseParams == null)
    {
      digits1 = random(0.5, 2.5);
      digits2 = random(0.5, 2.5);
      // første tal vil altid være størst
      if (digits2 > digits1) 
      {
        float tmp = digits1;
        digits1 = digits2;
        digits2 = tmp;
      }
      carryRatio = random(1);
    }

    // hvis parametre er givet
    else
    {
      // varians afhænger af, hvor langt svaret er fra målet. max 1
      float maxVariation = constrain(pow((targetTime-time)/targetTime, 1.5), 0, 1);
      digits1 = max(0.5, random(baseParams.digits1-maxVariation, baseParams.digits1+maxVariation));
      digits2 = max(0.5, random(baseParams.digits2-maxVariation, baseParams.digits2+maxVariation));
      // første tal vil altid være størst
      if (digits2 > digits1)
      {
        float tmp = digits1;
        digits1 = digits2;
        digits2 = tmp;
      }
      carryRatio = constrain(random(baseParams.carryRatio - maxVariation, baseParams.carryRatio + maxVariation), 0, 1);
    }

    Parameters p = new Parameters(digits1, digits2, carryRatio);
    return p;
  }
}
