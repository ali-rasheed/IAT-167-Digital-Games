class Bullet extends Projectile {
  
//-----------------CONSTRUCTORS---------//
  Bullet(PVector pos, float angle) {
    mag=45;
    this.pos=pos;
    boundary.set(20, 20);
    
    this.vel= PVector.fromAngle(angle);
    vel.setMag(mag);

   //vel.rotate(angle);
    //this.vel.x= mag*cos(angle);
    //this.vel.y= mag*sin(angle);
  }
  //Bullet(PVector pos) {
  //  mag=20; 
  //  final PVector position = pos;  
  //  this.pos=position;  
  //  boundary.set(20, 20);
  //  vel= new PVector(0,0);
  //}  
  //Bullet(float angle, float x, float y) {
  //  mag=20;
  //  pos.x=x;
  //  pos.y=y;
  //  boundary.set(20, 20);
  //}
//---------------METHODS----------------//
  void update() {
   //println(vel);
move();    
  }
  //void setVel() {
  //}
  void render() {
    pushStyle();
    imageMode(CENTER);

    strokeWeight(boundary.x/2);    
    stroke(0, 0, 100);
    fill(0, 0, 100);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(PI+pos.heading());
     image(bulletB, 0, 0, boundary.x, boundary.y);
   popStyle();
    popMatrix();
  }
}