//Character moves with "wasd"
// shoot with mouse click
class Player extends Character {
  Projectile p;
  Player() {
    super.hlth=10;
  }

  ArrayList <Projectile> bullets= new ArrayList <Projectile> ();

  int hlthTimer=30;

  void update() {
    hlthTimer++;
    //code for detection of collision with enemy


    super.widthS = 20;
    super.heightS=10;
    tmr();
    super.update();
    moveCharacter();
    drawCharacter();

    checkProjectiles();
    fire();
  }


  void moveCharacter() {
    super.moveCharacter();
    accelerate();
    pos.add(vel);
    if (keyPressed) {
      if (key=='w') vel.set(0, -1);
      if (key=='a') vel.set(-1, 0);
      if (key=='s') vel.set(0, 1);
      if (key=='d') vel.set(1, 0);
    }
  }


  void accelerate() {
    super.accelerate();  
    float Acc=0.95;
    xAcc=Acc;
    yAcc=Acc;
  }

  float time=20;
  void  tmr() { 
    if (time<10) { 
      time++;
    }
  }
  float angle;

  float standardVel= 5;
  void fire() {

    if (vel.x>0) {
      angle=0;    
      if (mousePressed&& time>0) {
        time=-20;
        bullets.add( new Projectile(new PVector (pos.x+widthS/2, pos.y), new PVector( standardVel, 0)));
      }
    }
    if (vel.x<0) {
      angle=180;    
      if (mousePressed&& time>0) {
        time=-20;
        bullets.add( new Projectile( new PVector(pos.x-widthS/2, pos.y), new PVector( -standardVel, 0)));
      }
    }
    if (vel.y>0) {
      angle=270;    
      if (mousePressed&& time>0) {
        time=-20;
        bullets.add( new Projectile( new PVector(pos.x, pos.y+heightS/2), new PVector(0, standardVel)));
      }
    }
    if (vel.y<0) {
      angle=90;    
      if (mousePressed&& time>0) {
        time=-20;
        bullets.add( new Projectile( new PVector(pos.x, pos.y-heightS/2), new PVector( 0, -standardVel)));
      }
    }
  }


  void   checkProjectiles() { 
    //for (Projectile p : bullets) {
    //  p.update();
    //}

    for (int i=0; i<bullets.size(); i++) {
      Projectile b = bullets.get(i);
      b.update();

    //  // to remove the bullet if it goes out of screen

      if (b.checkWalls()) {
        bullets.remove(b);
      }
    }

  
  }

  void   drawCharacter() {    
    pushMatrix();  


    translate(pos.x, pos.y);
    pushStyle();
    fill(300,100,100);
    rotate(radians(angle));
    rectMode(CENTER);
    rect(0, 0, widthS, heightS);
    popStyle();
    popMatrix();
  }
}