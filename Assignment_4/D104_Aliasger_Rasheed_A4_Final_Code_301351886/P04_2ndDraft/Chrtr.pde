//superclass for most  other classes
class Character {
  PVector pos = new PVector(0, 0), vel= new PVector(0, 0);
  float xAcc=0, yAcc=0;
  PVector boundary= new PVector(50, 50);
  boolean isAlive= true;
  int currentImgIdx = 0;
  int ImgIdxNmbr;
  PImage[] flying;
  Character() {
   flying  = new PImage[ImgIdxNmbr];
  }



  //---------------METHODS----------------//
  void  update() {
    move();
    acc();
    checkLife();
  }
  void imgSet (String img) {
    for (int i = 0; i < flying.length; i++) {
      flying[i] = loadImage(img+"_" + i + ".png");
    }
  }
  void drawImg() {
      if (frameCount % 10== 0) {
      currentImgIdx++;
      if (currentImgIdx == flying.length) { 
        currentImgIdx = 0;
      }
    }
  }
  void render() {
  }

  void move() {
    pos.add(vel);
  }


  void checkLife() {  
    if (pos.x-boundary.x/2<-worldWidth||pos.x+boundary.x/2>worldWidth||
      pos.y-boundary.y/2<-worldHeight||pos.y+boundary.y/2>worldHeight) { 
      isAlive=false;
    }
  }
  void acc() {
    vel.x *= xAcc;
    vel.y *= yAcc;
  }
}