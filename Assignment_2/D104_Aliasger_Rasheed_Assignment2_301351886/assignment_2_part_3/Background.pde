void backgroundz() {
  rectMode(CENTER);
  pushMatrix();  
  fill(83, 137, 247, 30);

  rect(width/2, 10, width, 60);  
  fill(83, 137, 247, 17);
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(60));

  rect(142, -640, 1500, 425);  
  popMatrix();
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(-60));

  rect(142, -641, 1500, 425);  
  popMatrix();
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(502));

  rect(142, -627, 1500, 425);  
  popMatrix();
  pushMatrix();
  translate(width/2, height/2);  
  fill(83, 137, 247, 10);

  rect(0, 100, 775, 10);  
  rect(0, 50, 8, 300);
  rect(75, 50, 8, 90);
  rect(-75, 50, 8, 90);
  rect(150, 50, 8, 90);
  rect(-150, 50, 8, 90);
  rect(225, 50, 8, 90);
  rect(-225, 50, 8, 90);  
  rect(300, 50, 8, 90);
  rect(-300, 50, 8, 90);
  rotate(radians(-502));
  fill(83, 137, 247, 17);

  rect(142, -627, 1500, 425);


  popMatrix();

  popMatrix();
}

float alpha=10;

// clickable ammo to replensih cannon
void ammo() {
  if (alpha!=10) {
    alpha++;
  }
  if (mousePressed&&alpha==10) { 
    alpha=0;
  }
  float ammoX=1050;
  float ammoY=100;
  pushMatrix();
  translate(ammoX, ammoY);

  rectMode(CENTER);
  fill(83, 137, 247, alpha*8);
  scale(1.2, 1.5);

  triangle(0, -20, 10, 0, -10, 0);
  rect(0, 40, 20, 80);
  beginShape();
  vertex(-10, 80);
  vertex(10, 80);
  vertex(15, 95);
  vertex(-15, 95);
  endShape();
  popMatrix();
}