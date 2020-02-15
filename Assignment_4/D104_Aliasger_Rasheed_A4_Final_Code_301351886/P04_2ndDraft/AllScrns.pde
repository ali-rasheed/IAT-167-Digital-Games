float buttonX_1=200, buttonY_1=250;
float buttonX_2=200, buttonY_2=350;
float buttonX_3=200, buttonY_3=450;
float bWidth=145, bHeight=70;
float bMidW= 0.5*bWidth, bMidH = 0.5*bHeight;

//-----------------------------------------------------------MENU SCREEN------------------------------------------------------//
void menu() {  
  background(249, 100, 0);  
  for (Star Beeteljeuse : nebula) {
    Beeteljeuse.draw();
    Beeteljeuse.tick();
  }  
  //text(,,,,)
  pushMatrix();  
  pushStyle();
  translate(-0.5*width, -0.5*height-100);
  imageMode(CORNER);
  popMatrix();
  popStyle(); 
  //objects
  pushMatrix();
  translate(80, -170);
  scale(0.3);
  fill(360);
  Traletera.render();
  Traletera.update();

  //menu Items
  popMatrix();
  stroke(0);
  fill(360);
  //--------------------------------------------LEVEL BUTTONS------------//
  pushMatrix();
  translate(-0.5*width, -0.5*height-100);

  fill(300); 
  rectMode(CENTER);
  rect(buttonX_1, buttonY_1, bWidth, bHeight);
  rect(buttonX_2, buttonY_2, bWidth, bHeight);
  rect(buttonX_3, buttonY_3, bWidth, bHeight);
  fill(0);    
  textFont(subFont, 30);
  textAlign(CENTER);  
  fill(228, 100, 7);    
  stroke(228, 100, 7);
  text("Level 1", buttonX_1, buttonY_1+15);
  text("Level 2", buttonX_2, buttonY_2+15);
  text("Level 3", buttonX_3, buttonY_3+15);  
  fill(360);    
  //-----------------TITLE------------------------//
  textFont(capFont, 50);
  text("Theta 12", width/2, height/12);
  textSize(70);
  text("Last Defender", width/2, height/6);
  textFont(regFont,14);
  text("ISOHV (Interstellar Society Of Human Variants) is at war with the Drovonite Empire. Earth, homeworld and Galactic Center for ISOHV, its location shielded and hidden from all foreign powers, is thought to be safe and protected."
  +"In the 4th year of the Drovonite War, Earth’s defending force, the legendary 1st Jinn Battalion of Star-Sprite fighters are directed towards the Ceres outpost in the Keppler belt, the first line of defense of Earth’s Solar System." 
  +"Jerry ‘Rig’ Skrevel, is a grounded pilot, When the alarm goes out for a fleet of sieging Drovonite ships, Rig modifies his wrecked ship to defend  the planet, though it can’t escape earth’s atmosphere, to defend the planet.",500,850,920,300);
  textFont(regFont,15);

  text("Controls include a and d for speeding up and down respectively",500,875);
text(" UP and DOWN to change height of orbit",500,900);
text("LEFT and RIGHT to change width of orbit",500,925);
text("SPACE shoots bullets, ALT shoots missiles",500,950);
text("protect the planet from invaders by modifying your orbit and shooting them down.",500,975);
  popMatrix();
}

//-----------------------------------------------------------LEVEL 1------------------------------------------------------// 
void level_1() {
  //-------------------BACKGROUND-------------------------//
  background(190, 100, 10);  
  for (Star Beeteljeuse : nebula) {
    Beeteljeuse.draw();
    Beeteljeuse.tick();
  }    

  pushMatrix();  
  pushStyle();
  translate(-0.5*width, -0.5*height);
  imageMode(CORNER);
  minimp();  
  hud();
  popMatrix();
  popStyle(); 

  scale(0.1);
  fill(320);
  Traletera.render();
  Traletera.update();
  //-------------------PLAYER METHOD RUNNING-----------------//
  Rig.update();
  Rig.render();
  for (int i=0; i < firstWave.size(); i++) {
    EnemyBsc e = firstWave.get(i); 
    e.update(firstWave);
    e.render();
  }
  if (firstWave.size()<1) {
    lastScreen=screenmode;
    screenmode=WIN; 
    menuThemeMusic.loop();
    levelThemeMusic.pause();
  }
}

//----------------------------------------------------------------LEVEL 2----------------------------------------------------------//

void level_2() {
  //-------------------BACKGROUND-------------------------//
  background(268, 100, 10);  
  for (Star Beeteljeuse : nebula) {
    Beeteljeuse.draw();
    Beeteljeuse.tick();
  }  
  scale(0.2);
  fill(320);
  Traletera.render();
  Traletera.update();

  pushMatrix();  
  pushStyle();  
  scale(1/0.2);
  translate(-0.5*width, -0.5*height);
  imageMode(CORNER);
  hud();
  minimp();  
  popMatrix();
  popStyle(); 

  //-------------------PLAYER METHOD RUNNING-----------------//
  Rig.update();
  Rig.render();

  for (int i=0; i < secondWave.size(); i++) {
    EnemyBsc e = secondWave.get(i); 
    e.update(secondWave);
    e.render();
  }
  if (secondWave.size()<1) {  
    lastScreen=screenmode;
    screenmode=WIN; 
    menuThemeMusic.loop();
    levelThemeMusic.pause();
  }
}
//-----------------------------------------------------------LEVEL 3------------------------------------------------------// 

void level_3() {
  //-------------------BACKGROUND-------------------------//
  background(295, 100, 10);  
  for (Star Beeteljeuse : nebula) {
    Beeteljeuse.draw();
    Beeteljeuse.tick();
  }    
  pushMatrix();  
  pushStyle();
  translate(-0.5*width, -0.5*height);
  imageMode(CORNER);
  minimp();
  hud();
  popMatrix();
  popStyle(); 
  float scalefactor = 0.1;
  scale(scalefactor); 
  translate(-Rig.pos.x+width/(11*scalefactor), -Rig.pos.y+height/(11*scalefactor));

  Rig.update();
  Rig.render();
  Traletera.render();   
  Traletera.update();
  //-------------------PLAYER METHOD RUNNING-----------------//

  for (int i=0; i < thirdWave.size(); i++) {
    EnemyBsc e = thirdWave.get(i); 
    e.update(thirdWave);
    e.render();
  }
  if (thirdWave.size()<1) {  
    lastScreen=screenmode;
    screenmode=WIN;      
    menuThemeMusic.loop();
    levelThemeMusic.pause();
  }
}
//----------------------------------------------------------WIN SCREEN------------------------------------------------//
int winTimer=0;
void winScreen() {
  background(80);
  while (winTimer<200) {
    text("You have saved the planet", 0, 0);
    winTimer++;
  }
  winTimer=0;
  screenmode=MENU;
}

//--------------------------------------------------------RESTART SCREEN------------------------------------------------//
PVector resButton = new PVector(500, 500);
PVector menuButton = new PVector(500, 600);
PVector resButSize = new PVector(150, 50);
void restartScreen() {
  Rig.health=5;
  Rig.vel=new PVector(900, 900);
  Rig.pos= new PVector(0, 0);
  Rig.isAlive=true;
  background(50);
  textFont(subFont, 40);
  textAlign(CENTER);
  text("You have let our planet die", width/2, 200);
  rectMode(CENTER);
  noStroke(); 
  rect(resButton.x, resButton.y, resButSize.x, resButSize.y);
  rect(menuButton.x, menuButton.y, resButSize.x, resButSize.y);
  textFont(regFont, 20);
  pushStyle();  
  fill(0);
  text("Start Screen", resButton.x, resButton.y+8);
  text("Menu Screen", menuButton.x, menuButton.y+8);
  popStyle();
}

//-----------LEVEL ENEMY SETUP--------//
//Make sure to replace enemy dimensions with constant variables
float spawnMin=worldHeight-150, spawnMax=worldHeight-100;
float enemDim = 150;
//----LEVEL 1 ENEMY SETUP----------//
void setOne() {  
  fWaveSize=20;
  while (firstWave.size()<fWaveSize/4) { 
    firstWave.add(new EnemyBsc(
      new PVector ( random(-spawnMax, spawnMax), random(-spawnMin, -spawnMax)), 1.5, enemDim, enemDim) );
  }  
  while (firstWave.size()<fWaveSize/2) { 
    firstWave.add(new EnemyBsc(
      new PVector ( random(-spawnMax, spawnMax), random(-spawnMin, -spawnMax)), 1.5, enemDim, enemDim));
  }  
  while (firstWave.size()<fWaveSize*3/4) { 
    firstWave.add(new EnemyBsc(
      new PVector ( random(-spawnMin, -spawnMax), random(-spawnMax, spawnMax)), 1.5, enemDim, enemDim));
  }  
  while (firstWave.size()<fWaveSize) { 
    firstWave.add(new EnemyBsc(
      new PVector ( random(spawnMin, spawnMax), random(-spawnMax, spawnMax)), 1.5, enemDim, enemDim));
  }
}
//-----------LEVEL 2 ENEMY SETUP----//

void setTwo() { 
  fWaveSize=30;
  while (secondWave.size()<fWaveSize/4) { 
    secondWave.add(new EnemyBsc(
      new PVector ( random(-spawnMax, spawnMax), random(-spawnMin, -spawnMax)), 2, enemDim, enemDim));
  }  
  while (secondWave.size()<fWaveSize/2) { 
    secondWave.add(new EnemyBsc(
      new PVector ( random(-spawnMax, spawnMax), random(-spawnMin, -spawnMax)), 2, enemDim, enemDim));
  }  
  while (secondWave.size()<fWaveSize*3/4) { 
    secondWave.add(new EnemyBsc(
      new PVector ( random(-spawnMin, -spawnMax), random(-spawnMax, spawnMax)), 2, enemDim, enemDim));
  }  
  while (secondWave.size()<fWaveSize) { 
    secondWave.add(new EnemyBsc(
      new PVector ( random(spawnMin, spawnMax), random(-spawnMax, spawnMax)), 2, enemDim, enemDim));
  }
}
//-----------LEVEL 3 ENEMY SETUP----//
void setThree() {  
  fWaveSize=40;
  while (thirdWave.size()<fWaveSize/4) { 
    thirdWave.add(new EnemyAdvncd(
      new PVector ( random(-spawnMax, spawnMax), random(-spawnMin, -spawnMax)), 2.5, enemDim, enemDim));
  }  
  while (thirdWave.size()<fWaveSize/2) { 
    thirdWave.add(new EnemyAdvncd(
      new PVector ( random(-spawnMax, spawnMax), random(-spawnMin, -spawnMax)), 2.5, enemDim, enemDim));
  }  
  while (thirdWave.size()<fWaveSize*3/4) { 
    thirdWave.add(new EnemyAdvncd(
      new PVector ( random(-spawnMin, -spawnMax), random(-spawnMax, spawnMax)), 2.5, enemDim, enemDim));
  }  
  while (thirdWave.size()<fWaveSize) { 
    thirdWave.add(new EnemyAdvncd(
      new PVector ( random(spawnMin, spawnMax), random(-spawnMax, spawnMax)), 2.5, enemDim, enemDim));
  }
}