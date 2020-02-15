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
  //--------------ARRAYLISTS-----------//
  ArrayList <Bullet> advancedBs = new ArrayList();//arratlist of improved bullets
  ArrayList <Missile> advancedMs = new ArrayList(); //arraylist of improved msisiles

  //---------------CONSTRUCTORS-------------//
  Player(PVector pos, PVector vel, PVector bndry, float angle) {
    this.pos=pos;
    this.vel=vel;
    this.angle=angle;
    boundary=bndry;
    xAcc= 5;
    yAcc = 5;
    health= 5;
    imgSet("rig_ship/rig");
  }
  //-----------UPDATE----------------//
  void update() {
    move();
    drawImg("rig");
    controls();
    checkLife();
    //updates weapons
    bulletUpdate(this.advancedBs);
    bulletUpdate(this.basicBs);
    missileUpdate(this.basicMs);
    missileUpdate(this.advancedMs);
    //updates the missile tracking system for each level
    switch(screenmode) {
    case LEVEL_1:
      enemScanner(firstWave);
      break;
    case LEVEL_2:
      enemScanner(secondWave);
      break;
    case LEVEL_3:
      //enemScanner(thirdWave};
    }
    //changes the wepaon
    changeWeapon();
  }
  //checks health along with changing screen 
  void checkLife() {
    hlthTimer++;

    if (isAlive) {
      if (dist(this.pos.x, this.pos.y, 0, 0)<500+50) {
        health=0;
      }
    }
    super.checkLife();
    if ( !isAlive)     screenmode=RESTART;
  }

  //------WEAPON UPDATE-----//
  //update method for bullets
  void bulletUpdate(ArrayList <Bullet> wList) {
    for (int i= 0; i<wList.size(); i++)
    { 
      Bullet b = wList.get(i);
      b.render();
      b.update();
    }
  }
  //update method for missiles
  void missileUpdate(ArrayList <Missile> wList) {
    for (int i= 0; i<wList.size(); i++)
    { 
      Missile b = wList.get(i);
      b.render();
      b.update();
    }
  }

  //-------------MOVEMENT-------------//
  //calculates angle and position of char
  void move() {
    // sqrt((sq(x-h))/a +(sq(y-k))/b)=
    //pos.rotate(angle);
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
    if (bCTimer>60 && keys[changeB]) {
      bCTimer=0;
      if (switchB) { 
        switchB=false;
      } else       if (!switchB) {
        switchB=true;
      }
    }
    if (keys[changeM] && mCTimer>60) {
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
  PVector prevPos=new PVector(), currPos=new PVector(), v=pos;

  int bTimer = 0;
  int mTimer = 0;
  float weapAngVel=0;
  //int a =1;

  ///to shoot prjectiles
  void shoot () {

    if (angVel.x>0) {
      weapAngVel =pos.heading() +PI/2;//*abs(pos.y/pos.x);
    } else {
      weapAngVel =pos.heading() -PI/2;//*abs(pos.y/pos.x);
    }
    bTimer++;
    if (keys[shootB] && bTimer>15 && bscBltCount>0) {
      //shootb(new PVector (pos.x,pos.y));
      basicBs.add(new Bullet(new PVector (pos.x, pos.y), weapAngVel));
      bTimer=0;
      bscMslCount--;
    }
    mTimer++;
    if (keys[shootM] && mTimer>15 && bscMslCount>0) {
      basicMs.add(new Missile ( new PVector (pos.x, pos.y), mTarget.x, mTarget.y));
      mTimer=0;
      bscMslCount--;
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
    if (angVel.x>0)    {rotate(pos.heading());
    scale(-1);}
    else {
      rotate(pos.heading());
    }

    image(ship, 0, 0, boundary.x, boundary.y);
    rectMode(CENTER);
    //rect(0, 0, boundary.x, boundary.y);
    popMatrix();
    popStyle();
  }
}
