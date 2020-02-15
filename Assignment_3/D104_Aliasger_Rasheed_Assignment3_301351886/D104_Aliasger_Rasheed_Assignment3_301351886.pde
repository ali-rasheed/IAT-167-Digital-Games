ArrayList<BasicE> bscs = new ArrayList();
Player Alpha;
BossE Omega;
BasicE Beta;
PFont font;

PImage bguy;
int scores =0;
int waveSize;
int screenMode = 1;
void setup() { 

  font = loadFont("CenturyGothic-Bold-48.vlw");

  for (int i=0; i<25; i++) {
    bscs.add(new BasicE(new PVector(random(100, 1000), 50), new PVector(0, random(8))));
  }
  bguy = loadImage("download.png");
  Alpha = new Player();

  size(1100, 700);
}

int wrningScrnTimer = 0;



void draw() {
  //if (alpha.hlth
  background(2, 2, 2);  
  textFont(font, 15);

  float t = millis()/40;
  text("amount of time survived: " +t, 20, 50);
  text("score: "+scores, 1000, 50);
  textSize(20);
  text("health: "+Alpha.hlth, 600, 50);
  
  if (screenMode==0) {  textSize(30);
text("Wave 1", 400, 50);

    Alpha.drawCharacter();
    Alpha.update();
    for (int i =0; i<bscs.size(); i++) { 
      BasicE b = bscs.get(i);
      b.update();
      b.health();
    }
    if (bscs.size()<1) screenMode=1;
  }
  // boss warning screen
  if (screenMode== 1) {
    wrningScrnTimer++;
    if (wrningScrnTimer>200) {
      screenMode=2;    
      bscs.add(Omega =        new BossE(new PVector (random(100, 1000), 50), new PVector(0, random(8)) )) ;
    }
    pushStyle();
    fill(200, 255, 255);
    rect(0, 0, width, height);
    textSize(50);
    textMode(CENTER);
    fill(0, 0, 50);
    text("He Comes...", width/2-100, height/2);
    popStyle();
  }
  //boss wave 
  if (screenMode== 2) {  
        textSize(30);
text("Wave 2", 400, 50);

    Alpha.drawCharacter();
    Alpha.update();
    for (int i =0; i<bscs.size(); i++) { 
      BasicE b = bscs.get(i);
      b.update();
      b.health();
         Omega.shoot(Alpha.pos.x-Omega.pos.x,Alpha.pos.y-Omega.pos.y);
if(Alpha.hlth<1) screenMode=-2;

    }

  }
  if(screenMode==-2){        fill(200, 255, 255);
 rect(0, 0, width, height);
 
  textSize(60);
  text("Guess who died", width/2-100, height/2);
  }
  if (screenMode==-1) {
    float buttonX_1=1000; 
    float buttonY_1=250;
    pushStyle();
    fill(200, 255, 255);
    rect(0, 0, width, height);
    textSize(50);
    textMode(CENTER);
    fill(0, 0, 50);
    text("He Comes...", width/2-100, height/2);
    if (mouseX>buttonX_1-72.5 
      &&mouseX<buttonX_1+72.5
      &&mouseY>buttonY_1-35 
      &&mouseY<buttonY_1+35
      &&mousePressed) {
      screenMode=1;
    }
  }
}
int good=0;

void score() {

  ///acheivements  pops up if doing very ell in start
  textFont(font, 25);

  if (frameCount<1200&& scores>9) {
    good=1;
  }
  if (good==1) {
    fill(83, 137, 247, 20);
    textAlign(CENTER);
    text("You are saving the planet", width/2, height/2);
  }
  if (frameCount>1500) {
    good=0;
  }
}