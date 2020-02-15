CC firstOne, secondOne;
ArrayList <CC> characters= new ArrayList <CC>();
void setup () {
  size(1100, 700);

  for (int i=0; i<6; i++) { 
    characters.add(  firstOne=new CC(random(100, 1000), random(100, 600)));
  }    
  println(characters.size());
}

void draw () {
  clear();
  for (CC a : characters) {
    a.drawCharacter();
    a.move();
    a.detectWall();
  }
}