class LivingCharacter extends Character {
  Bullet blt;
  Missile msl;
  float health, angle;
  float mTarDis;
  float radar;
  PVector mTarget = new PVector();

  ArrayList <Projectile> basicBs = new ArrayList();
  ArrayList <Projectile> basicMs= new ArrayList();
  ArrayList  <Projectile> advancedBs = new ArrayList();//arratlist of improved bullets
  ArrayList <Projectile> advancedMs = new ArrayList(); //arraylist of improved msisiles

  LivingCharacter() {
    super();
  }
  void update() {
    super.update();
    for (Projectile b : basicBs) {
      b.update();
    }
    for (Projectile m : basicMs) {
      m.update();
    }
  }
  // ----------------CHECK CHARACTERS LIFE STATE-----------//
  void   checkLife() {  
    super.checkLife();
    if (health<1) isAlive= false;
  }
  // ------------------COLLISION DETECTION-----------------// 
  boolean hitCharacter(Character a) {
    return dist(a.pos.x, a.pos.y, this.pos.x, this.pos.y)
      <a.boundary.x/2+this.boundary.x/2;
  }

  //------------------OTHER SIDE  PROJECTILE DETECTION-----------//
  void collisionForProj(LivingCharacter them, String p ) { //this mehtod allows for one less method for a missile and bullet seperately. so less lines of code
    ArrayList <Projectile> bsc=them.basicMs, adv=them.advancedMs;
    if (p=="bullet") { //uses a string as a type of boolean to determine whether this is missile collision or bullet collision
      bsc = them.basicBs;
      adv = them.advancedBs;
    }
    for (int j=0; j<bsc.size(); j++) {    
      Projectile m =bsc.get(j);
      if (m.hit(this, them )) {
        health -= m.damage; 
        bsc.remove(m);
      }
    } 
    for (int j=0; j<adv.size(); j++) {    
      Projectile m =adv.get(j);
      if (m.hit(this, them )) {
        health -= m.damage; 
        adv.remove(m);
      }
    }
  }
  ////----------------------OTHER SIDE  MISSILE DETECTION-----------//

  //void collisionForMsls(LivingCharacter them) {
  //  ArrayList <Projectile> bsc = them.basicMs;
  //  ArrayList <Projectile> adv = them.advancedMs;
  //  for (int j=0; j<bsc.size(); j++) {    
  //    Projectile m =bsc.get(j);
  //    if (m.hit(this, them )) {
  //      health -= m.damage; 
  //      bsc.remove(m);
  //    }
  //  } 
  //  for (int j=0; j<adv.size(); j++) {    
  //    Projectile m =adv.get(j);
  //    if (m.hit(this, them )) {
  //      health -= m.damage; 
  //      adv.remove(m);
  //    }
  //  }
  //}
  // ---------------SHOOT METHODS FOR BULLETS AND MISSILES------------// 
  //void shootb( PVector target) {
  //  basicBs.add(blt = new Bullet( new PVector ( 0, 0), pos.heading()));
  //  //basicBs.add(blt = new Bullet( pos));
  //}

  //void shootM( PVector target) {
  //  msl.vel.x= msl.mag*cos(atan2(target.y, target.x));
  //  msl.vel.y= msl.mag*sin(atan2(target.y, target.x));
}
