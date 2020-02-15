class AdvancedBlt extends Bullet {
  AdvancedBlt(PVector pos, float angle) {
    super(pos, angle);
    mag=70;
    damage=3;
  }
  void render() {
    pushStyle();
    imageMode(CENTER);

    strokeWeight(boundary.x/2);    
    stroke(0, 0, 100);
    fill(0, 0, 100);
    pushMatrix();
    translate(pos.x, pos.y);
    image(bulletA, 0, 0, boundary.x, boundary.y);
    popStyle();
    popMatrix();
  }
}