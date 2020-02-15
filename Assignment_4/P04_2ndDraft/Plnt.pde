//class for planet that needs defending. by putting in class it is easier to organise 
//and modify its code as well as possible create different planets for new level

class Planet {
  //---------------------VARIABLE-------------//
  ///position and dim
  PVector pos, dim;
//essentially the HP of the planet
int population = 5000000;
//for sprite animation
  int currentImgIdx = 0;
  //number of images
  int ImgIdxNmbr = 9;
  PImage[] revolution = new PImage[ImgIdxNmbr];
//-------------CONSTRUCTORS------------------//
  Planet(PVector pos, PVector dim) {
    this.pos = pos;
    this.dim = dim;
    //setup images
    for (int i = 0; i< revolution.length; i++) {
      revolution[i] = loadImage("planet/planet_0"+i+".png");
    }
  }

  void update() {
    
    if (population<1) screenmode=RESTART;    //if planet death then to menu

    if (frameCount % 10 == 0) {     //update image

      currentImgIdx++;
      if (currentImgIdx == revolution.length) {
        currentImgIdx = 0;
      }
    }
  }

  void render() {
    PImage img = revolution[currentImgIdx]; // set current image
    imageMode(CENTER); 
    img.resize((int) dim.x,(int) dim.y); //resize to size in window
    image(img, 0, 0);
  }
}