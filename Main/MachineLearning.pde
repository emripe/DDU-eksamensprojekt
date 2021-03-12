class MachineLearning
{
  Parameters GenerateParameters(Parameters params)
  {
    int digits = 0;
    float carryRatio = 0;
    
    if (params == null)
    {    
      digits = round(random(1,3));
      carryRatio = random(1);
    }
    
    Parameters p = new Parameters(digits, carryRatio);
    println("generated parameters:");
    println("digits: " + p.digits);
    println("carryRatio: " + p.carryRatio);
    
    return p;
  }
}
