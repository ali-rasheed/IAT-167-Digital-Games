class Character {
  PVector  pos= new PVector(width/2, height/2);
  PVector vel = new PVector(0, 0);
  float hlth, widthS, heightS;
  float xAcc, yAcc;


  void moveCharacter() {
    pos.add(vel);
  }

  void accelerate() {

    vel.x *= xAcc;
    vel.y *= yAcc;
  }

  void   drawCharacter() {
    ellipse(pos.x, pos.y, widthS, heightS);
  }

  //edit this
  boolean hitCharacter(Character a) 
  {
    return dist(a.pos.x, a.pos.y, this.pos.x, this.pos.y)<a.widthS/2+this.widthS/2;
  }


  void decreaseHealth(int dam) {
  }

  void checkWalls() {
    if (pos.x-widthS>width) { 
      pos.x=-widthS;
    }
    if (pos.x+widthS<0) { 
      pos.x=widthS+width;
    }
    if (pos.y-heightS>height) { 
      pos.y=-heightS;
    }
    if (pos.y+heightS<0) { 
      pos.y=height+heightS;
    }
  }

  void update() {

    checkWalls();
    moveCharacter();
  }
}