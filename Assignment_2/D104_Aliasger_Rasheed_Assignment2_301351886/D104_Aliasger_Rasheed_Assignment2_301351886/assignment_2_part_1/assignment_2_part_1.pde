CC firstOne, secondOne;

void setup () {
  size(1100,700);
  firstOne=new CC(10, 20);
  secondOne = new CC(50, 70);
}

void draw () {clear();
  firstOne.drawCharacter();
  firstOne.move();
  secondOne.drawCharacter();
  secondOne.move();
}