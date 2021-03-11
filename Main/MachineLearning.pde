class MachineLearning
{
  Parameters GenerateParameters()
  {
    Parameters p = new Parameters();
    p.digits = round(random(1,3));
    p.carryRatio = random(1);
    println("generated parameters:");
    println("digits: " + p.digits);
    println("carryRatio: " + p.carryRatio);
    
    return p;
  }
}
