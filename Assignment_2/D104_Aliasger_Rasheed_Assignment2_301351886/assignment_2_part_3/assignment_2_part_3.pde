CC firstOne;
ArrayList <CC> characters= new ArrayList <CC>();
PFont font;
int timer2=0;
void setup () {
  font = loadFont("CenturyGothic-Bold-48.vlw");
  size(1100, 700);

  for (int i=0; i<10; i++) { 
    characters.add(  firstOne=new CC(random(100, 1000), random(100, 600)));
  }    
  println(characters.size());
}

void draw () {
  background(0, 2, 14);

  backgroundz();
  for (CC a : characters) {
    a.drawCharacter();
    a.move();
    a.detectWall();
  }
  //planetoid regeneration
  if (characters.size()<10) {
    timer2++;
    if (timer2>20) {
      timer2=0;
      characters.add(new CC (random(100, 1000), random(100, 600)));
    }
  }
  hitAndScore();
  pointer();
  backgroundz();
  ammo();
  acheivement();
}


int score=0;


void hitAndScore() {
  // scoring system
  textAlign(CENTER);
  textFont(font, 20);
  fill(167, 3, 3, 320);

  text("Planetoids Destroyed: " +score, width/2, 30);
  //death system
  for (  int i=0; i<characters.size(); i++) {
    CC b = characters.get(i);
    if (b.isHit()) {  
      //period of time before .remove();
      b.isDying();
    }
    if (b.iskilled()) {
      score++;
      characters.remove(b);
    }
  }
}