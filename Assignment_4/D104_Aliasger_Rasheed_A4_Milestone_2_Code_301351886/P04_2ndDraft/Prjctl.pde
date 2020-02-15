class Projectile extends Character {
  float mag=5;
  float damage = 1;

  boolean hit(LivingCharacter target, LivingCharacter self) {
    return (dist(target.pos.x, target.pos.y, this.pos.x, this.pos.y)< target.boundary.x/2+self.boundary.x/2 && target != self) ;
  }
  
}
