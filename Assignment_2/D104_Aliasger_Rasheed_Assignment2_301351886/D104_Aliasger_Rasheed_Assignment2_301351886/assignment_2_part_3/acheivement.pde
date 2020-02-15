// if the player gets 10 asteroids in lesss than a 20 seconds they get a  acheivemnt
int good=0;
void acheivement() {
  textFont(font, 25);

  if (frameCount<1200&& score>9) {
    good=1;
  }
  if (good==1) {
    fill(83, 137, 247, 20);
    textAlign(CENTER);
    text("You are saving the planet", width/2, height/2);
  }
  if(frameCount>1500){
    good=0;}
    
}