class LivingCharacter extends Character {
  Bullet blt;
  Missile msl;
  float health, angle;

  ArrayList <Bullet> basicBs = new ArrayList();
  ArrayList <Missile> basicMs= new ArrayList();
  LivingCharacter() {
    super();
  }
  void update() {
    super.update();
    for (Bullet b : basicBs) {
      b.update();
    }
    for (Missile m : basicMs) {
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

  //------------------OTHER SIDE  BULLET DETECTION-----------//
  void collisionForBlts(LivingCharacter them) {
    for (int j=0; j<them.basicBs.size(); j++) {    

   Bullet   b =them.basicBs.get(j);

      if (b.hit(this, them)) {
        health -= b.damage; 
        them.basicBs.remove(b);
      }
    }
  }
  //----------------------OTHER SIDE  MISSILE DETECTION-----------//

  void collisionForMsls(LivingCharacter them ) {
    for (int j=0; j<them.basicMs.size(); j++) {    

     Missile m =them.basicMs.get(j);

      if (m.hit(this, them )) {
        health -= m.damage; 
        them.basicMs.remove(m);
      }
    }
  }
  // ---------------SHOOT METHODS FOR BULLETS AND MISSILES------------// 
  void shootb( PVector target) {
    basicBs.add(blt = new Bullet( new PVector ( 0, 0), pos.heading()));
    //basicBs.add(blt = new Bullet( pos));
  }

  void shootM( PVector target) {
    msl.vel.x= msl.mag*cos(atan2(target.y, target.x));
    msl.vel.y= msl.mag*sin(atan2(target.y, target.x));
  }
  void isHit() {
  }
}
