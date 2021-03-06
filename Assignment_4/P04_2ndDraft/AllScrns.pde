float buttonX_1=200, buttonY_1=450;
float buttonX_2=200, buttonY_2=550;
float buttonX_3=200, buttonY_3=650;
float bWidth=145, bHeight=70;
float bMidW= 0.5*bWidth, bMidH = 0.5*bHeight;

//-----------------------------------------------------------MENU SCREEN------------------------------------------------------//
void menu() {  
  background(228, 100, 7);  
  for (Star Beeteljeuse : nebula) {
    Beeteljeuse.draw();
    Beeteljeuse.tick();
  }  
  pushMatrix();  
  pushStyle();
  translate(-0.5*width, -0.5*height-100);
  imageMode(CORNER);
  popMatrix();
  popStyle(); 
  //objects
  pushMatrix();
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
  textFont(capFont, 60);
  text("Theta 12: Last Defender", width/2, height/3);

  popMatrix();
}

//-----------------------------------------------------------LEVEL 1------------------------------------------------------// 

void level_1() {

  //-------------------BACKGROUND-------------------------//
  background(228, 100, 7);  
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
  if (firstWave.size()<1)screenmode=WIN;
}

//----------------------------------------------------------------LEVEL 2----------------------------------------------------------//

void level_2() {
  //-------------------BACKGROUND-------------------------//
  background(228, 100, 7);  
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

  //rotate(radians(Rig.angle));
  //pushMatrix();
  //  translate(0.5*width, 0.5*height    );
  scale(0.2);

  fill(320);
  Traletera.render();
  Traletera.update();

  //-------------------PLAYER METHOD RUNNING-----------------//
  Rig.update();
  Rig.render();

  for (int i=0; i < secondWave.size(); i++) {
    EnemyBsc e = secondWave.get(i); 
    e.update(secondWave);
    e.render();
  }
  //popMatrix();
  if (secondWave.size()<1)screenmode=WIN;
}
//-----------------------------------------------------------LEVEL 3------------------------------------------------------// 

void level_3() {
  //-------------------BACKGROUND-------------------------//
  //rotate(-Rig.pos.heading());
  background(228, 100, 7);  
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


  //rotate(radians(Rig.angle));
  //pushMatrix();
  //  translate(0.5*width, 0.5*height    );
  //translate(0, height/2-0);    
  float scalefactor = 0.7;
  scale(scalefactor); 
  translate(-Rig.pos.x+width/(11*scalefactor), -Rig.pos.y+height/(11*scalefactor));

  //rotate(Rig.pos.heading());
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
  //popMatrix();
  if (thirdWave.size()<1)screenmode=WIN;
  //translate(Rig.pos.x,Rig.pos.y);
}
//----------------------------------------------------------WIN SCREEN------------------------------------------------//
void winScreen() {
  text("You have saved the planet",0,0); 
}

//--------------------------------------------------------RESTART SCREEN------------------------------------------------//
void restartScreen() {
  setOne();
  setTwo();
  Rig.health=5;
  Rig.vel=new PVector(900, 900);
  Rig.pos= new PVector(0, 0);
  Rig.isAlive=true;
  screenmode=MENU;
}

//-----------LEVEL ENEMY SETUP--------//
//Make sure to replace enemy dimensions with constant variables
float spawnMin=worldHeight-150, spawnMax=worldWidth-100;
float enemDim = 100;
//----LEVEL 1 ENEMY SETUP----------//
void setOne() {  
  fWaveSize=20;
  while (firstWave.size()<fWaveSize/4) { 
    firstWave.add(new EnemyBsc(
      new PVector ( random(-spawnMax, spawnMax), random(-spawnMin, -spawnMax)), 1, enemDim, enemDim) );
  }  
  while (firstWave.size()<fWaveSize/2) { 
    firstWave.add(new EnemyBsc(
      new PVector ( random(-spawnMax, spawnMax), random(-spawnMin, -spawnMax)), 1, enemDim, enemDim));
  }  
  while (firstWave.size()<fWaveSize*3/4) { 
    firstWave.add(new EnemyBsc(
      new PVector ( random(-spawnMin, -spawnMax), random(-spawnMax, spawnMax)), 1, enemDim, enemDim));
  }  
  while (firstWave.size()<fWaveSize) { 
    firstWave.add(new EnemyBsc(
      new PVector ( random(spawnMin, spawnMax), random(-spawnMax, spawnMax)), 1, enemDim, enemDim));
  }
}
//-----------LEVEL 2 ENEMY SETUP----//
void setTwo() {  
  fWaveSize=30;
  while (secondWave.size()<fWaveSize/4) { 
    secondWave.add(new EnemyBsc(
      new PVector ( random(-spawnMax, spawnMax), random(-spawnMin, -spawnMax)), 1.5, enemDim, enemDim));
  }  
  while (secondWave.size()<fWaveSize/2) { 
    secondWave.add(new EnemyBsc(
      new PVector ( random(-spawnMax, spawnMax), random(-spawnMin, -spawnMax)), 1.5, enemDim, enemDim));
  }  
  while (secondWave.size()<fWaveSize*3/4) { 
    secondWave.add(new EnemyBsc(
      new PVector ( random(-spawnMin, -spawnMax), random(-spawnMax, spawnMax)), 1.5, enemDim, enemDim));
  }  
  while (secondWave.size()<fWaveSize) { 
    secondWave.add(new EnemyBsc(
      new PVector ( random(spawnMin, spawnMax), random(-spawnMax, spawnMax)), 1.5, enemDim, enemDim));
  }
}
//-----------LEVEL 3 ENEMY SETUP----//
void setThree() {  
  fWaveSize=40;
  while (thirdWave.size()<fWaveSize/4) { 
    thirdWave.add(new EnemyAdvncd(
      new PVector ( random(-spawnMax, spawnMax), random(-spawnMin, -spawnMax)), 1.5, enemDim, enemDim));
  }  
  while (thirdWave.size()<fWaveSize/2) { 
    thirdWave.add(new EnemyAdvncd(
      new PVector ( random(-spawnMax, spawnMax), random(-spawnMin, -spawnMax)), 1.5, enemDim, enemDim));
  }  
  while (thirdWave.size()<fWaveSize*3/4) { 
    thirdWave.add(new EnemyAdvncd(
      new PVector ( random(-spawnMin, -spawnMax), random(-spawnMax, spawnMax)), 1.5, enemDim, enemDim));
  }  
  while (thirdWave.size()<fWaveSize) { 
    thirdWave.add(new EnemyAdvncd(
      new PVector ( random(spawnMin, spawnMax), random(-spawnMax, spawnMax)), 1.5, enemDim, enemDim));
  }
}
