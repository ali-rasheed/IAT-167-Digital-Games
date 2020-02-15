class EnemyAdvncd extends EnemyBsc {
  EnemyAdvncd(PVector pos, float mag, float bx, float by) { 
    super(pos, mag, bx, by);
        this.pos = pos;  
    float angle = atan2(pos.y, pos.x);
    this.vel= PVector.fromAngle(angle);
    this.vel.setMag(-mag);    
    health=2;
    boundary.x=bx;
    boundary.y=by;
  }
}
