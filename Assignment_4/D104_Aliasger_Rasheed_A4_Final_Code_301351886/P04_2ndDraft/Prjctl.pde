//super class for missiles and bullets

class Projectile extends Character {
  float mag=5;
  float damage = 1;

  boolean hit(LivingCharacter target, LivingCharacter self) { // checks if projectiles  hits a enemy or player
    return (dist(target.pos.x, target.pos.y, this.pos.x, this.pos.y)< target.boundary.x/2+self.boundary.x/2 && target != self) ;
  }
  
}