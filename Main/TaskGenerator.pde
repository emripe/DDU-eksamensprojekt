Task taskGenerator(Parameters parameter) {
  int num1, num2;
  int digits = parameter.digits;
  float carryRatio = parameter.carryRatio;

  for (int i=0; i<digits; i++) {
    num1=int(random(9));
    if (random(1) > carryRatio) { // sum af de to tal er max 10
      num2 = int(random(0, 9-num1));
    } else { // sum af de to tal er mindst 10
      num2 = int(random(9-num1, 9));
    }
  }
  Task task = new Task(num1,num2);
  return (task);
}
