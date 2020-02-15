//class Player_Trail {
//  float rndmzr_X=random(-5, 5);
//  float rndmzr_Y=random(0, 10);
//  float pos_X=Alpha.X_pos-20*Danko.vctrcos+0.9*rndmzr_X;
//  float pos_Y=Danko.Y_pos-20*Danko.vctrsin+0.9*rndmzr_Y; 
//  float vlcty_X=0;
//  float vlcty_Y=0;
//  float acclrtn_X=-.5*Danko.vctrcos+0.05*rndmzr_X;  
//  float acclrtn_Y=-.5*Danko.vctrsin+0.05*rndmzr_Y;
//  Player_Trail() {
//  }

//  void draw (){
  
//        float fume_size=0.4;

//    stroke(0, 0, (fume_size-0.5)*100);
//    fume_size=fume_size+0.006;
//    strokeWeight(fume_size);
//    point(pos_X+vlcty_X, pos_Y+vlcty_Y);
//  }
//  void tick() {
//    vlcty_X=vlcty_X+acclrtn_X;
//    vlcty_Y=vlcty_Y+acclrtn_Y;
//  }
//}