class Missile extends Projectile {

  //-----------------CONSTRUCTORS---------//
  Missile(PVector pos, float tarX, float tarY) {
      damage=2;
    mag=20;
    this.pos=pos;
    boundary.set(20, 20);
float angle = atan2(tarY-pos.y,tarX-pos.x);
vel.x=mag* cos(angle);
vel.y=mag* sin(angle);
    //this.vel= PVector.fromAngle(angle);
    //vel.setMag(mag);
  }
  //vel.rotate(angle);
  //this.vel.x= mag*cos(angle);
  //this.vel.y= mag*sin(angle);
  //}

  //Missile(PVector pos) {
  //  this.pos=pos;  
  //  mag=6;
  //  boundary.set(60, 20);
  //}

  //Missile(PVector pos) {
  //  mag=20; 
  //  final PVector position = pos;  
  //  this.pos=position;  
  //  boundary.set(20, 20);
  //  vel= new PVector(0,0);
  //}  
  //Missile(float angle, float x, float y) {
  //  mag=20;
  //  pos.x=x;
  //  pos.y=y;
  //  boundary.set(20, 20);
  //}
  //---------------METHODS----------------//
  void update() {
    println(vel);
    move();
  }
  void move() {
    pos.add(vel);
  }
  //void setVel() {

  //}
  void render() {
    pushStyle();

    strokeWeight(boundary.x/2);    
    stroke(0, 0, 100);
    fill(0, 0, 100);
    line(pos.x, pos.y, pos.x, pos.y+50);
    popStyle();
  }
}
