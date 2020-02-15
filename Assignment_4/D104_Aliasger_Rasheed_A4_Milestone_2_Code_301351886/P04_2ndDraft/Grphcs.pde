//---------------------------STAR BACKGROUND INITUIATION--------------//

void cluster() {
  while (nebula.size()<30) {
    nebula.add(Vega=new Star(new PVector (random(-600, 600), random(-400, 600)), 1, 8));
  }
}


//---------------------------MINI MAP FOR PLAYER--------------------//
void miniMap() {
  mM.beginDraw();
  mM.background(100, 100, 100, 100);
  mM.fill(0, 0, 0);
  mM.line(0, 0, 100, 100);
  mM.endDraw();
  image(mM, 3000, 1000);
}
