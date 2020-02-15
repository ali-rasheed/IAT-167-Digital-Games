//---------------------------STAR BACKGROUND INITUIATION--------------//

void cluster() {
  while (nebula.size()<50) {
    nebula.add(new Star(new PVector (random(-worldWidth/10, worldWidth/10), random(-worldHeight/10, worldHeight/10))));
  }
}
//-------GLOBALLY IMPORTING IMAGES DUE TO ----//
//-----CONFLICT IN INHERITANCE OF IMAGE LOADING---//
void loadProjectileImgs() {
  bulletB = loadImage("bulletB.png");
  bulletA = loadImage("bulletA.png");
}
//---------------------------MINI MAP FOR PLAYER--------------------//
ArrayList <EnemyBsc> arryMp=firstWave;
void minimp() {
  mp.colorMode(HSB, 360, 100, 100, 100);
  mp.beginDraw();

  mp.background(100, 0, 100, 60);
  mp.translate(mp.width/2, mp.height/2);
  //maps characters position to minimap
  PVector Rigmp = new PVector(map(Rig.pos.x, 0, worldWidth, 0, miniWidth), map(Rig.pos.y, 0, worldHeight, 0, miniHeight));
  PVector planetMp = new PVector(0,0);
 mp.stroke(213,94,96,90); mp.strokeWeight(24);
mp.point(planetMp.x,planetMp.y);
  mp.stroke(272, 100, 97, 90);
  mp.strokeWeight(4);
  mp.scale(0.5);
  mp.point(Rigmp.x, Rigmp.y);
  switch(screenmode) {
  case MENU:  //chooses which arrylist to map
    break;
  case LEVEL_1:  
    arryMp=firstWave;
    break;
  case LEVEL_2:  
    arryMp=secondWave;
    break;
  case LEVEL_3:  
    arryMp=thirdWave;
    break;
  }  
  mp.stroke(22, 100, 86, 90);

  for (int i=0; i<arryMp.size(); i++) {
    EnemyBsc e = arryMp.get(i);
    PVector eMap = new PVector(map(e.pos.x, 0, worldWidth, 0, miniWidth), map(e.pos.y, 0, worldHeight, 0, miniHeight));
    mp.point(eMap.x, eMap.y);
  }
  mp.stroke(0, 99, 87, 90);
  for (Projectile p : Rig.basicBs) {
    PVector pMap = new PVector(map(p.pos.x, 0, worldWidth, 0, miniWidth), map(p.pos.y, 0, worldHeight, 0, miniHeight));
   mp.strokeWeight(2); mp.point(pMap.x, pMap.y);
  }for (Projectile p : Rig.basicMs) {
    PVector pMap = new PVector(map(p.pos.x, 0, worldWidth, 0, miniWidth), map(p.pos.y, 0, worldHeight, 0, miniHeight));
   mp.strokeWeight(2); mp.point(pMap.x, pMap.y);
  }for (Projectile p : Rig.advancedBs) {
    PVector pMap = new PVector(map(p.pos.x, 0, worldWidth, 0, miniWidth), map(p.pos.y, 0, worldHeight, 0, miniHeight));
   mp.strokeWeight(3); mp.point(pMap.x, pMap.y);
  }for (Projectile p : Rig.advancedMs) {
    PVector pMap = new PVector(map(p.pos.x, 0, worldWidth, 0, miniWidth), map(p.pos.y, 0, worldHeight, 0, miniHeight));
   mp.strokeWeight(3); mp.point(pMap.x, pMap.y);
  }
  mp.endDraw();
  image(mp, 10, 10);
}

//--------------HEADS UP DISPLAY-------------//
void hud() {
  hud.colorMode(HSB, 360, 100, 100, 100);
  hud.beginDraw();

  hud.background(100, 0, 100, 70);

  hud.fill(0, 0, 0, 100);
  hud.textFont(regFont, 18);
  hud.text("Population: " +Traletera.population, 10, 20 );
  hud.text("HP: " +Rig.health, 10, 40 );
  hud.text("hydrogen-cooled plasma: " +Rig.bscBltCount, 10, 60 );
  hud.text("positron torpedo: " +Rig.bscMslCount, 270, 20 );
  hud.text("neutrino-charged plasma: " +Rig.advancedBltCount, 270, 40 );
  hud.text("quantum-entangler missile: " +Rig.advancedMslCount, 270, 60 );

  hud.endDraw();

  image(hud, 2*miniWidth, 10);
}

// -------SETUP SOUND EFFECTS-----//

void soundSet() {  
  minim = new Minim(this);
  menuThemeMusic = minim.loadFile("Spy Story.mp3");
  levelThemeMusic = minim.loadFile("Electro Zombies.mp3");
  Victory = minim.loadFile("bensound-newdawn.mp3");
  explosion1 = minim.loadFile("Explosion+1.mp3");
  bGuyScream1 = minim.loadFile("screamW.mp3");
}