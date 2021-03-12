Task taskGenerator(Parameters parameter) {
  int dig1=0, dig2=0;
  int num1=0, num2=0;
  int digits = parameter.digits;
  float carryRatio = parameter.carryRatio;
  int lowerBound=1;

  for (int i=0; i<digits; i++) {
    dig1=int(random(lowerBound,9));
    if (random(1) > carryRatio) { // sum af de to tal er max 10
      dig2 = int(random(lowerBound, 9-dig1));
    } else { // sum af de to tal er mindst 10
      dig2 = int(random(9-dig1, 9));
    }
    //println (num1, " ", num2);
    num1 *= pow(10,i);
    num2 *= pow(10,i);
    num1 += dig1;
    num2 += dig2;
    lowerBound=0;
  }
  Task task = new Task(num1,num2);
  return (task);
}
