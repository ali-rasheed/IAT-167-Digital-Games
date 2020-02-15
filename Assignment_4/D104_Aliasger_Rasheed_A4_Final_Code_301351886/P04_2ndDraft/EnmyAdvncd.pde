//Stronger enemies. they are faster and have more strength

class EnemyAdvncd extends EnemyBsc {
  EnemyAdvncd(PVector pos, float mag, float bx, float by) { 
    super(pos, mag, bx, by);
    this.pos = pos;  
    float angle = atan2(pos.y, pos.x);
    this.vel= PVector.fromAngle(angle);
    this.vel.setMag(-mag);    
    health=4;
    boundary.x=bx;
    boundary.y=by;
    imgSet("enemAdvanced/enemA");
  }
  void update() {
    super.update();
    playerScanner(Rig);
  }
//method for detecting player for bullets
  void playerScanner( Player plyr) {
    radar  = dist(this.pos.x, this.pos.y, plyr.pos.x, plyr.pos.y);
    if (radar<mTarDis) {
      mTarDis=radar;
      mTarget = plyr.pos;
    }
  }
}