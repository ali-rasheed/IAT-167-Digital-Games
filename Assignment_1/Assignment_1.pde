color rd_l_c = #FFD500;

char rd_l_s = 6;
color bg = #C4BAFC;
color   inner_k_colour = color(random(0, 255), random(0, 255), random(0, 255));
color   outer_k_colour = color(random(0, 255), random(0, 255), random(0, 255));
color road = #343434;
float persY, persX;
float len, l, h;
float startingY, startingX;
color kite_Stroke = color(random(0, 100), random(0, 100), random(0, 100));
color window, widstroke;
float winstrokeweight, kite_StrokeWeight =  random(0, 1 );
float windx=50, windy=0;
float movementx = 0.5, movementy = 0.3;

void setup() {
  size(1200, 600);
}

void draw() {
  bg =color(#4667f7);
  background(bg);
  noStroke();
  fill(#a3a3a3);
  rect(0, 150, width, height);
  //road
  persY = 176;
  fill(#C1C1C1);
  stroke(20, 20, 20);
  // pavement
  rect(0, 480, 975, height);
  quad(975, 480, 973, 524, width, 461-persY, width, 431-persY);
  fill(road);
  //road
  noStroke();


  quad(983, 500, 1033, height, width, height-persY, width, 461-persY);
  rect(0, 500, 1034, 101);

  //road lines
  strokeWeight(rd_l_s);
  stroke(rd_l_c);
  pushMatrix();
  translate (385, 50);
  shearX(-PI/5);
  pushMatrix();
  line(0, 500, 50, 500);
  line(100, 500, 150, 500);
  line(200, 500, 250, 500);
  line(300, 500, 350, 500);
  line(400, 500, 450, 500);
  line(500, 500, 550, 500);
  line(600, 500, 650, 500);
  line(700, 500, 750, 500);  
  line(800, 500, 850, 500);
  line(900, 500, 950, 500);
  line(900, 500, 950, 500);
  line(900, 500, 950, 500);
  line(900, 500, 950, 500);  
  popMatrix();

  popMatrix();
  strokeWeight(rd_l_s-0);
  pushMatrix();
  //shearX(-PI/8);
  translate(50, 34);
  line(975, 500, 1005, 470);
  pushMatrix();
  translate(65, -65);
  line(975, 500, 1005, 470);
  translate(65, -65);
  line(975, 500, 1005, 470);
  translate(65, -65);
  line(975, 500, 1005, 470);

  popMatrix();
  popMatrix();


  persY=225;
  len=-120;
  persX=225;
  stroke(10);
  strokeWeight(0.6);
  pushMatrix();
  translate(persX+len, -persY-len);
  fill(#65bf49);  
  startingX = -20;
  startingY=569;
  l=341;
  h=-229;  
  len=-105;

  rect(startingX, startingY, l, h);
  quad(startingX+l, startingY, startingX+l, startingY+h, startingX+l+len+persX, startingY+h-len-persY, startingX+l+len+persX, startingY-len-persY);
  quad(startingX, startingY+h, startingX+l, startingY+h, startingX+l+len+persX, startingY+h-len-persY, startingX+len+persX, startingY-len-persY+h);
  popMatrix();

  fill(#95544A);  
  len=-179;

  //X base of buliding

  startingX = 0;
  //Y base of bulidingroad
  startingY=480;
  //length of building
  l=235;
  // width of building
  h=-147;
  rect(startingX, startingY, l, h);
  quad(startingX+l, startingY, startingX+l, startingY+h, startingX+l+len+persX, startingY+h-len-persY, startingX+l+len+persX, startingY-len-persY);
  quad(startingX, startingY+h, startingX+l, startingY+h, startingX+l+len+persX, startingY+h-len-persY, startingX+len+persX, startingY-len-persY+h);
  fill(#425320);

  startingX = 249;
  l=138;
  h=-262;
  len=-182;
  rect(startingX, startingY, l, h);  
  quad(startingX+l, startingY, startingX+l, startingY+h, startingX+l+len+persX, startingY+h-len-persY, startingX+l+len+persX, startingY-len-persY);
  quad(startingX, startingY+h, startingX+l, startingY+h, startingX+l+len+persX, startingY+h-len-persY, startingX+len+persX, startingY-len-persY+h);
  pushMatrix();
  translate(persX+len, -persY-len);
  fill(#8a3549);  
  startingX = 413;
  l=138;
  h=-262;  
  len=-19;
  rect(startingX, startingY, l, h);  
  quad(startingX+l, startingY, startingX+l, startingY+h, startingX+l+len+persX, startingY+h-len-persY, startingX+l+len+persX, startingY-len-persY);
  quad(startingX, startingY+h, startingX+l, startingY+h, startingX+l+len+persX, startingY+h-len-persY, startingX+len+persX, startingY-len-persY+h);
  popMatrix();

  fill(#768dc1);  
  startingX = 398;
  l=138;
  h=-262;  
  len=-161;
  rect(startingX, startingY, l, h);  
  quad(startingX+l, startingY, startingX+l, startingY+h, startingX+l+len+persX, startingY+h-len-persY, startingX+l+len+persX, startingY-len-persY);
  quad(startingX, startingY+h, startingX+l, startingY+h, startingX+l+len+persX, startingY+h-len-persY, startingX+len+persX, startingY-len-persY+h);
  pushMatrix();
  translate(persX+len, -persY-len);
  fill(#bfb349);  
  startingX = 560;
  l=138;
  h=-200;  
  len=-162;
  rect(startingX, startingY, l, h);  
  quad(startingX+l, startingY, startingX+l, startingY+h, startingX+l+len+persX, startingY+h-len-persY, startingX+l+len+persX, startingY-len-persY);
  quad(startingX, startingY+h, startingX+l, startingY+h, startingX+l+len+persX, startingY+h-len-persY, startingX+len+persX, startingY-len-persY+h);
  popMatrix();
  fill(#a97bac);  
  startingX = 560;
  l=138;
  h=-244;  
  len=-167;
  rect(startingX, startingY, l, h);  
  quad(startingX+l, startingY, startingX+l, startingY+h, startingX+l+len+persX, startingY+h-len-persY, startingX+l+len+persX, startingY-len-persY);
  quad(startingX, startingY+h, startingX+l, startingY+h, startingX+l+len+persX, startingY+h-len-persY, startingX+len+persX, startingY-len-persY+h);


  pushMatrix();
  translate(persX+len, -persY-len);
  fill(#4962bf);  
  startingX = 711;
  l=264;
  h=-137;  
  len=-124;
  rect(startingX, startingY, l, h);  
  quad(startingX+l, startingY, startingX+l, startingY+h, startingX+l+len+persX, startingY+h-len-persY, startingX+l+len+persX, startingY-len-persY);
  quad(startingX, startingY+h, startingX+l, startingY+h, startingX+l+len+persX, startingY+h-len-persY, startingX+len+persX, startingY-len-persY+h);
  popMatrix();
  fill(#bf9149);  
  startingX = 712;
  l=263;
  h=-299;  
  len=-171;
  rect(startingX, startingY, l, h);  
  quad(startingX+l, startingY, startingX+l, startingY+h, startingX+l+len+persX, startingY+h-len-persY, startingX+l+len+persX, startingY-len-persY);
  quad(startingX, startingY+h, startingX+l, startingY+h, startingX+l+len+persX, startingY+h-len-persY, startingX+len+persX, startingY-len-persY+h);
  // wind movement
  windx+=movementx;
  windy+=movementy;
  if (windx>107||windx<45) {
    movementx=-movementx;
  }   
  if (windy>50||windy<-10) {
    movementy=-movementy;
  } 
  //kite 1
  pushMatrix();
  scale(0.509);

  pushMatrix();
  scale(0.7);

  pushMatrix();  

  translate(windx+ -229, -87+windy);
  fill(inner_k_colour );
  stroke(kite_Stroke);
  triangle(1054, 173+60, 1054, 173+-24, 1054-24, 173 );
  triangle(1054, 173+60, 1054, 173+-24, 1054+24, 173 );
  rectMode(CENTER);
  fill(outer_k_colour );
  noStroke();
  strokeWeight(kite_StrokeWeight+0.5);
  rect(1054, 173+20, 11, 42);
  rectMode(CORNER);
  arc(1054-0, 173+3, 46, 17, radians(-180), radians(0));  
  noFill();      
  stroke(kite_Stroke);
  popMatrix();

  curve(1054+-51, 173+108, 1054+7, 173+201, 1054+0+windx+ -229, 173+60+windy+ -87, 443, -23);
  popMatrix();

  popMatrix(); 
  //kite 2
  pushMatrix();
  scale(0.380);
  translate(996, 11);
  pushMatrix();
  scale(0.6);

  pushMatrix();  

  translate(windx+ -229, -87+windy);
  fill(inner_k_colour );
  stroke(kite_Stroke);
  triangle(1054, 173+60, 1054, 173+-24, 1054-24, 173 );
  triangle(1054, 173+60, 1054, 173+-24, 1054+24, 173 );
  rectMode(CENTER);
  fill(outer_k_colour );
  noStroke();
  strokeWeight(kite_StrokeWeight+0.5);
  rect(1054, 173+20, 11, 42);
  rectMode(CORNER);
  arc(1054-0, 173+3, 46, 17, radians(-180), radians(0));  
  noFill();      
  stroke(kite_Stroke);
  popMatrix();

  curve(1054+-51, 173+108, 829+7, 242+201, 1054+0+windx+ -229, 173+60+windy+ -87, 443, -23);
  popMatrix();
  popMatrix();
  //kite 3
  pushMatrix();
  scale(0.604);
  pushMatrix();
  scale(0.7);

  pushMatrix();  

  translate(windx+0, windy+0);
  fill(inner_k_colour );
  stroke(kite_Stroke);
  triangle(210, 534+60, 210, 534+-24, 210-24, 534 );
  triangle(210, 534+60, 210, 534+-24, 210+24, 534 );
  rectMode(CENTER);
  fill(outer_k_colour );
  noStroke();
  strokeWeight(kite_StrokeWeight+0.5);
  rect(210, 534+20, 11, 42);
  rectMode(CORNER);
  arc(210-0, 534+3, 46, 17, radians(-180), radians(0));  
  noFill();      
  stroke(kite_Stroke);
  popMatrix();

  curve(210+-51, 534+108, 210+7, 534+201, 210+0+windx+0, 534+60+windy+0, 419, 475);
  popMatrix();

  popMatrix();
  //kite 4
  pushMatrix();
  scale(0.380);
  translate(996, 11);
  pushMatrix();
  scale(1.2);

  pushMatrix();  

  translate(windx+ -229, -87+windy);
  fill(inner_k_colour );
  stroke(kite_Stroke);
  triangle(1054, 173+60, 1054, 173+-24, 1054-24, 173 );
  triangle(1054, 173+60, 1054, 173+-24, 1054+24, 173 );
  rectMode(CENTER);
  fill(outer_k_colour );
  noStroke();
  strokeWeight(kite_StrokeWeight+0.5);
  rect(1054, 173+20, 11, 42);
  rectMode(CORNER);
  arc(1054-0, 173+3, 46, 17, radians(-180), radians(0));  
  noFill();      
  stroke(kite_Stroke);
  popMatrix();

  curve(1687+-51, 173+108, 947+7, 173+153, 1058+0+windx+ -229, 173+60+windy+ -87, 741, -245);
  popMatrix();
  popMatrix();
  pushMatrix();
  //satellite
  translate(600, 300);
  fill(255);
  shearX(radians(20));
  ellipse(0, 0, 20, 20);
line(0,0,14,-10);
  popMatrix();  pushMatrix();
  //satellite
  translate(600, 300);
  fill(255);
  shearX(radians(20));
  ellipse(0, 0, 20, 20);
line(0,0,14,-10);
  popMatrix();  pushMatrix();
  //satellite
  translate(600, 300);
  fill(255);
  shearX(radians(20));
  ellipse(0, 0, 20, 20);
line(0,0,14,-10);
  popMatrix();  pushMatrix();
  //satellite
  translate(462, 300);
  fill(255);
  shearX(radians(20));
  ellipse(0, 0, 20, 20);
line(0,0,14,-10);
  popMatrix();
}