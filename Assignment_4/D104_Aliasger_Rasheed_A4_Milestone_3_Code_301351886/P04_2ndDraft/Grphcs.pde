//---------------------------STAR BACKGROUND INITUIATION--------------//

void cluster() {
  while (nebula.size()<50) {
    nebula.add(new Star(new PVector (random(-600, 600), random(-400, 600)), 1, 8));
  }
}
//-------GLOBALLY IMPORTING IMAGES DUE TO ----//
//-----CONFLICT IN INHERITANCE OF IMAGE LOADING---//
void loadProjectileImgs() {
  bulletB = loadImage("bulletB.png");
  bulletA = loadImage("bulletA.png");
}
//---------------------------MINI MAP FOR PLAYER--------------------//
void minimp() {
  mp.colorMode(HSB, 360, 100, 100, 100);
  mp.beginDraw();

  mp.background(100, 0, 100, 50);
  mp.translate(mp.width/2, mp.height/2);
  //maps characters position to minimap
  PVector Rigmp = new PVector(map(Rig.pos.x, 0, worldWidth, 0, miniWidth), map(Rig.pos.y, 0, worldHeight, 0, miniHeight));

  mp.stroke(0, 99, 87, 80);
  mp.strokeWeight(5);
  mp.point(Rigmp.x, Rigmp.y);
  //for (EnemyBsc e : firstWave) {
  //  PVector eMap = new PVector(map(e.pos.x, 0, worldWidth, 0, miniWidth), map(e.pos.y, 0, worldHeight, 0, miniHeight));
  //  mp.point(eMap.x, eMap.y);
  //}
  mp.endDraw();
  image(mp, 10, 10);
}

//--------------HEADS UP DISPLAY-------------//
void hud() {
  hud.colorMode(HSB, 360, 100, 100, 100);
  hud.beginDraw();

  hud.background(100, 0, 100, 70);

  hud.fill(0, 0, 0,100);
  hud.textFont(regFont,18);
  hud.text("Population: " +Traletera.population, 10,20 );
  hud.text("HP: " +Rig.health, 10, 40 );
  hud.text("hydrogen-cooled plasma: " +Rig.bscBltCount, 10, 60 );
  hud.text("positron torpedo: " +Rig.bscMslCount, 270, 20 );
  hud.text("neutrino-charged plasma: " +Rig.advancedBltCount, 270, 40 );
  hud.text("quantum-entangler missile: " +Rig.advancedMslCount, 270, 60 );

    hud.endDraw();

    image(hud, 2*miniWidth, 10);

}
