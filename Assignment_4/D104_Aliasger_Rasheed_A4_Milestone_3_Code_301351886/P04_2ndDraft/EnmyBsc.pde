class EnemyBsc extends LivingCharacter {  
 
  int animatnRandom = (int) random(20, 150);
  float deathTimer =0;
// constructors
  EnemyBsc(PVector pos, float mag, float bx, float by) { 
    this.pos = pos;  
    float angle = atan2(pos.y, pos.x);
    this.vel= PVector.fromAngle(angle);
    this.vel.setMag(-mag);    
    health=2;
    boundary.x=bx;
    boundary.y=by;
    int ImgIdxNmbr=2;
    flying  = new PImage[ImgIdxNmbr];
    imgSet("enemBasic/enemB");
  } 
  //----------------------------------------METHODS------------------------------//

  //--------------------DEATH ANIMATION--------------// 
  void death(ArrayList a) {  
    deathTimer++;
    scaling*=0.95;
    if (deathTimer>120) {
      a.remove(this);
    }
  }
  //---------------UPDATE MECHANICS----------//

  void update(ArrayList myList ) {
    drawImg();

    super.checkLife();
    if (isAlive) {
      if (dist(this.pos.x, this.pos.y, Traletera.pos.x, Traletera.pos.y)>Traletera.dim.x/2+this.boundary.x/2) {
        invading();
      } else { 
        landed();
      }
    } else { 
      death(myList);
    }
  }

  // ----------------------RENDER------//
  //overridden to set differnt animation framerate
  void drawImg() {

    if (frameCount % animatnRandom == 0) { //update image every 10 frms
      currentImgIdx++;
      if (currentImgIdx == flying.length) { //when running thru
        currentImgIdx = 0;
      }
    }
  }
  float scaling=1;
  void   render() {
    pushMatrix();
    PImage ship = flying[currentImgIdx];

    fill(200, 100, 100);
    translate(pos.x, pos.y);
    scale(scaling);
    //ship.
    image(ship, 0, 0, boundary.x, boundary.y);
    popMatrix();
  }
  // -------------------------------DIFFERENT STATES--------------------------//
  //--------DAMAGE PLANET ONCE REACHED SURFACE-----//
  int attack=1;
  void landed() {
    //change animation
    while (attack<2) {
      Traletera.population-=500000;
      attack++;
    }
  }
  //--------WHILE MOVING TOWARDS PLANETS SURFACE-----//
  void invading() {

    //----AFFECT HEALTH----//
    if (Rig.hitCharacter(this)) { 
      if (Rig.hlthTimer>30) { 
        Rig.health--;
        Rig.hlthTimer=0;
      }     
      isAlive=false;
    }
    collisionForProj(Rig, "bullet");
    collisionForProj(Rig, "missile");
    //collisionForMsls(Rig);
    //--------UPDATE POSITION -------------//
    pos.add(vel);
  }
}
