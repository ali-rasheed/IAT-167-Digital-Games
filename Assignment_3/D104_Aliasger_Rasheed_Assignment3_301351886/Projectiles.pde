class Projectile {
  PVector pos, vel; 
  float dim=10;



  Projectile(PVector inPos, PVector inVel) {    
    fill(0);

    vel=inVel;
    pos = inPos;
  }

  void move() {
    pos.add(vel);
  }

  boolean checkWalls() {
    if ( pos.x>width||pos.x<0||pos.y>height||pos.y<0) {
      return true;
    }
    return false;
  }

  void update() {
    move();
    drawP();
  }

  void drawP() {
    pushMatrix();
    translate(pos.x, pos.y);
    fill(200);
    ellipse(0, 0, dim, dim);

    popMatrix();
  }


  boolean hitP(Character guy) {
    if (dist(pos.x, pos.y, guy.pos.x, guy.pos.y)<dim/2+guy.widthS/2) {
      return true;
    }

    return false;
  }
}