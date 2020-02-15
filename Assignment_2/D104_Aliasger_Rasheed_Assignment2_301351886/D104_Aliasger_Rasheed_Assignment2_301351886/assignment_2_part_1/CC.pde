class CC {
  float x;
  float y;
  float Xspeed;
  float Yspeed;
  float wd=19;
  float ht=19;
  float lin_ex=9;
  float dia_ex=6;
  float circ_ex= 1;
  int timer =5000;
  float angle=random(-90, 90);
  float adder=  random(-3, 3);
  float  discreptioner= random(-60, 60);
  CC (float X, float Y) {
    x=X;
    y=Y;
    Xspeed = random(1, 5);
    Yspeed = random(1, 5);
  }
  void move() {
    x+=Xspeed;
    y+=Yspeed;
  }
  void drawCharacter() {  
    noStroke();
    fill(50);
    pushMatrix();
    translate(x, y);
    scale(circ_ex);
    //planetoids
    ellipse(0, 0+lin_ex, wd, ht);
    ellipse(0, 0-lin_ex, wd, ht);
    ellipse(0+lin_ex, 0, wd, ht);
    ellipse(0-lin_ex, 0, wd, ht);
    ellipse(0+dia_ex, 0+dia_ex, wd, ht);
    ellipse(0-dia_ex, 0-dia_ex, wd, ht);
    ellipse(0+dia_ex, 0-dia_ex, wd, ht);
    ellipse(0-dia_ex, 0+dia_ex, wd, ht);
    pushMatrix();
    translate(-10+lin_ex, -7+dia_ex);
    angle+=adder*adder ;
    //  orbiitng moons
    float orbitX1 = cos(radians(angle))*30;
    float orbitY1= sin(radians(angle))*40;    
    float orbitX2 =cos(radians(angle*1.1))*50;
    float orbitY2=sin(radians(angle*1.1))*40;
    fill(180);
    ellipse(orbitX1, orbitY1, 10, 10);
    fill(150);
    ellipse(-orbitX2, -orbitY2, 8, 8);

    popMatrix();
    popMatrix();
  }
}