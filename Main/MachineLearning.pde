class MachineLearning
{
  Parameters GenerateParameters()
  {

    int digits = round(random(1,3));
    float carryRatio = random(1);
    
    Parameters p = new Parameters(digits, carryRatio);
    println("generated parameters:");
    println("digits: " + p.digits);
    println("carryRatio: " + p.carryRatio);
    
    return p;
  }
}
