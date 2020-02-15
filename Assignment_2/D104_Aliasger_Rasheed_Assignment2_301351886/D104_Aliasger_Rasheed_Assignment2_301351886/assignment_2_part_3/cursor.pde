// the target cursor
void pointer() {
  pushMatrix();  
  float x1=mouseX;

  float y1=mouseY;

  translate(x1, y1);  
  scale(2.2);
  fill(201, 28, 28,80);
  noStroke();
  rectMode(CENTER);
  rect(6, 0, 7, 3,10);
  rect(-6, 0, 7, 3,10);  
  rect(0, -6, 3, 7,10);
  rect(0, 6, 3, 7,10);
  ellipse(0,0,3,3);
  popMatrix();
}