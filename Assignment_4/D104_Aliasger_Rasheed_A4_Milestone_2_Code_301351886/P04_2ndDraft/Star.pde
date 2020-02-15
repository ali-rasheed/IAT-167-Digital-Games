class Star {   
  float varstar=0;
  float lum=random(0, 90); 
  float alphacentauri=70;
  float alphacounter=1;
  
  PVector pos;
  float dim=random(10,50);
  float dim2=random(1,10);
  float sat=random(0, 80); 
  Star(PVector pos, float dim, float dim2) {

    this.pos=pos;
    this.dim=dim;
    this.dim2=dim2;
  }
  void tick() {
    alphacentauri+=alphacounter;
    if (alphacentauri>random(50, 100)||alphacentauri<random(0, 49)) {
      alphacounter=-alphacounter;
    }
    if (varstar<100) {
      varstar+=1;
    } else { 
      sat=random(0, 80); 
      lum= random(0, 100); 
      varstar=0;
    }
  }
  void draw() {
    fill(lum, sat, 100, alphacentauri);
    noStroke();
    ellipse(pos.x,pos.y,dim2/2,dim2/2);
    //stroke(lum, 100, 100);
    beginShape();
    vertex(pos.x-dim, pos.y-dim);
    vertex(pos.x-dim2, pos.y);
    vertex(pos.x-dim, pos.y+dim);
    vertex(pos.x, pos.y+dim2);
    vertex(pos.x+dim, pos.y+dim);
    vertex(pos.x+dim2, pos.y);
    vertex(pos.x+dim, pos.y-dim);
    vertex(pos.x, pos.y-dim2);
    endShape();
  }
}
