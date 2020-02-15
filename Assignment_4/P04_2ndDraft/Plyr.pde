//players class

class Player extends LivingCharacter {

  //-------VARIABLES----------------//

  boolean switchB= true;
  boolean switchM= true;
  //float longer, higher; //limits of orbit
  //boolean under, before; 
  int hlthTimer=30;
  PVector angVel= new PVector(1.2, 0); //initial angular vel
  int bscBltCount=50; //number of initial bullets
  int bscMslCount=5;//number of initial missiles
  int advancedBltCount=50; //number of initial bullets
  int advancedMslCount=5;//number of initial missiles
  //--------------ARRAYLISTS-----------//

  //---------------CONSTRUCTORS-------------//
  Player(PVector pos, PVector vel, PVector bndry, float angle) {
    this.pos=pos;
    this.vel=vel;
    this.angle=angle;
    boundary=bndry;
    xAcc= 5;
    yAcc = 5;
    health= 5;
    this.ImgIdxNmbr=7;
    flying  = new PImage[ImgIdxNmbr];

    imgSet("rig_ship/rig");
  }
  //-----------UPDATE----------------//
  void update() {
    move();
    controls();
    checkLife();
    drawImg();
    //updates weapons   
    projUpdate(this.basicBs);
    projUpdate(this.advancedBs);
    projUpdate(this.basicMs);
    projUpdate(this.advancedMs);
    switch(screenmode) {
    case LEVEL_1:
      enemScanner(firstWave);
      break;
    case LEVEL_2:
      enemScanner(secondWave);
      break;
    case LEVEL_3:
      enemScanner(thirdWave);
    }
    //changes the wepaon
    changeWeapon();
  }
  //checks health along with changing screen 
  void checkLife() { //overrided checklife
    super.checkLife();
    hlthTimer++; //so health reduces one by one
    if (isAlive) {
      if (dist(this.pos.x, this.pos.y, 0, 0)<Traletera.dim.x/2+this.boundary.x/2) {
        health=0;
      }
    }
    if ( !isAlive)     screenmode=RESTART;
  }

  //------WEAPON UPDATE-----//
  //update method for bullets
  void projUpdate(ArrayList <Projectile> wList) {
    for (Projectile p : wList)
    { 
      p.render();
      p.update();
    }
  }

  //-------------MOVEMENT-------------//
  //calculates angle and position of char
  void move() {
    pos.x= vel.x * cos(radians(angle));
    pos.y= vel.y * sin(radians(angle));
    //pos.add(angVel);
    angle+=angVel.x;
    //    pos.add(angVel);
  }
  //-----------COLLISION DETECTION----//


  //--------------KEYBOARD CONTROLS----------//
  float accLimit = 3;
  void controls() {   
    shoot();
    //checks arraylist of keyboard inputs and changes various variables 
    if (keys[up]) vel.y+=yAcc;
    if (keys[down]) vel.y-=yAcc;
    if (keys[right]) vel.x+=xAcc;
    if (keys[left]) vel.x-=xAcc;
    if (angVel.x<accLimit) { 
      if (keys[speedUp]) {
        angVel.x+=0.1;
      }
    }

    if (angVel.x>-accLimit) { 
      if (keys[speedDown]) angVel.x-=0.1; //limits the sped of character
    }
  }

  //----------------WEAPON CONTROL------------//
  float bCTimer = 0, mCTimer = 0;
  //-------------SWITCHES BETWEEN ADVANCED AND BASIC PROJECTILES-----------//
  void changeWeapon() {
    if (bCTimer>10 && keys[changeB]) {
      bCTimer=0;
      if (switchB) { 
        switchB=false;
      } else {
        switchB=true;
      }
    }
    if (keys[changeM] && mCTimer>10) {
      bCTimer=0;
      if (switchM) {
        switchM=false;
      } else       if (!switchM) {
        switchM =true;
      }
    }  
    bCTimer++;
    mCTimer++;
  }
  int bTimer = 0;
  int mTimer = 0;
  float weapAngVel=0;
  ///to shoot prjectiles
  void shoot () {

    if (angVel.x>0) {
      weapAngVel =pos.heading() +PI/2;//*abs(pos.y/pos.x);
    } else {
      weapAngVel =pos.heading() -PI/2;//*abs(pos.y/pos.x);
    }
    bTimer++;
    if (keys[shootB] && bTimer>15) {
      if (switchB && bscBltCount>0) {
        basicBs.add(new Bullet(new PVector (pos.x, pos.y), weapAngVel));
        bTimer=0;
        bscBltCount--;
      } else if ( !switchB &&   advancedBltCount>0) {
        advancedBs.add(new AdvancedBlt(new PVector (pos.x, pos.y), weapAngVel));
        bTimer=0;
        advancedBltCount--;
      }
    }
    mTimer++;
    if (keys[shootM] && mTimer>25) {
      if (switchM && bscMslCount>0) {
        basicMs.add(new Missile ( new PVector (pos.x, pos.y), mTarget.x, mTarget.y));
        mTimer=0;
        bscMslCount--;
      } else if ( !switchM &&   advancedMslCount>0) {
        advancedMs.add(new AdvancedMsl ( new PVector (pos.x, pos.y), mTarget.x, mTarget.y));
        mTimer=0;
        advancedMslCount--;
      }
    }
  }
  float mTarDis=2000;
  float radar;
  PVector mTarget = new PVector();
  void enemScanner(ArrayList<EnemyBsc> enems) {
    for (EnemyBsc e : enems) {

      radar  = dist(this.pos.x, this.pos.y, e.pos.x, e.pos.y);
      if (radar<mTarDis) {
        mTarDis=radar;
        mTarget = e.pos;
      }
    }
  }

  //----------------RENDER----------------//
  void render() {    
    //this.boundary= PVector.fromAngle(angle);
    //vel.setMag(mag);
    fill(360);
    // ellipse(pos.x, pos.y, boundary.x, boundary.y);
    pushMatrix();
    translate(pos.x, pos.y);
    pushStyle();
    imageMode(CENTER);
    PImage ship = flying[currentImgIdx];
    if (angVel.x>0) {
      rotate(pos.heading());
      scale(-1);
    } else {
      rotate(pos.heading());
    }
println(currentImgIdx);
    image(ship, 0, 0, boundary.x, boundary.y);
    rectMode(CENTER);
    //rect(0, 0, boundary.x, boundary.y);
    popMatrix();
    popStyle();
  }
}
