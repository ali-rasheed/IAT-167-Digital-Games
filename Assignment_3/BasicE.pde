class BasicE extends Character {
  BasicE(PVector inPos, PVector inVel) {  
    vel=inVel;
    pos = inPos;  
    super.hlth = 2;
  } 
  float angle = -PI/4;
  int dir = 1;
  float deathTimer =0;
  boolean death = false;

  //death animation 
  void death() {  
    deathTimer++;
    scaling*=0.95;
    if (deathTimer>120) {
      bscs.remove(this);
    }
  }
  void update() {
    super.widthS = 15;
    super.heightS=15;
    if (!death) {
      super.update();
    } else { 
      death();
    }

    angle += 0.04 * dir; 
    if ( random(0, 20) < 1) {
      dir *= -1;
    }
    vel.set(2* cos(angle), 2* sin(angle));  

    drawCharacter();
    //collison with enemy
    for (int j=0; j<Alpha.bullets.size(); j++) {
      Projectile p = Alpha.bullets.get(j);

      if (p.hitP(this)) {
        hlth--; 
        Alpha.bullets.remove(p);
      }
    }
    if (Alpha.hitCharacter(this)) { 
      death=true;      
      if (Alpha.hlthTimer>30) { 
        Alpha.hlth--;
        Alpha.hlthTimer=0;
      }
    }
  }
  void health() {
    if (hlth<1) {
      death=true;
      scores++;
    }
  }
  float scaling=1;
  void   drawCharacter() {
    pushMatrix();
    fill(100, 112, 772);
    translate(pos.x, pos.y);
        scale(scaling);

    ellipse(0, 0, widthS, heightS);
    popMatrix();
  }
}