class BossE extends BasicE {

  BossE( PVector inPos, PVector inVel) {
    super( inPos, inVel);      
    super.hlth = 8;

    super.widthS = 30;
    super.heightS=30;
    vel=inVel;
    pos=inPos;
  }   
  float angle=random(-90, 90);
  float adder=  random(-3, 3);
  float timer=0;
  void shoot(float xTarget, float yTarget) {

    timer++;
    if (timer>350) {
      timer=0;         
      float standardVel= 6;
      float speed = atan2(yTarget, xTarget);
      Bguybullets.add( new Projectile(new PVector (pos.x, pos.y), new PVector( cos(speed)*standardVel, sin(speed)*standardVel)));
    }
  }
  void   drawCharacter() {    
    pushMatrix();
    fill(100, 112, 772);
    angle+=adder*adder ;
    //  orbiitng moons
    float orbitX1 = cos(radians(angle))*30;
    float orbitY1= sin(radians(angle))*40;    
    float orbitX2 =cos(radians(angle*1.1))*50;
    float orbitY2=sin(radians(angle*1.1))*40;

    translate(pos.x, pos.y);
    ellipse(0, 0, widthS, heightS);
    popMatrix();
  }
  void health() {

    if (hlth<1) {
      bscs.remove(this);
      scores++;
    }
  }
  ArrayList <Projectile> Bguybullets = new ArrayList<Projectile>();
  void update() {

    super.update();
    checkProjectiles();
  }
  void checkProjectiles() { 
    for (int i=0; i<Bguybullets.size(); i++) {
      Projectile b = Bguybullets.get(i);
      b.update();
      //if bullet hits player
      if (b.hitP(Alpha)) {      
        if (Alpha.hlthTimer>30) { 
          Alpha.hlth--;
          Alpha.hlthTimer=0;
          Bguybullets.remove(b);
        }
      }

      //  // to remove the bullet if it goes out of screen

      if (b.checkWalls()) {
        Bguybullets.remove(b);
      }
    }
  }
}