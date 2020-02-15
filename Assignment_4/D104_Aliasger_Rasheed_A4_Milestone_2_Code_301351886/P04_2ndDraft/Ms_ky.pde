
void keyPressed() {
  //--------------------MOVEMENT CONTROL----------------//
  if (key==CODED) {
    if (keyCode == UP)    keys[up] = true;
    else if (keyCode == DOWN)  keys[down] = true;
    else if (keyCode == RIGHT) keys[right] = true;
    else if (keyCode == LEFT)  keys[left] = true;
  }
  //--------------VELOCITY AND WEAPON CONTROL---------------//
  if (key == 'a') keys[speedDown] = true;
  else if (key == 'd') keys[speedUp] = true;
  else if (key == ' ') keys[shootB] = true;
  else if (key == 'q' ) keys[shootM] = true;
  else if (key == 'c') keys[changeB] = true;
  else if (key == 'x') keys[changeM] = true;
}
void keyReleased() 
  //--------------------MOVEMENT CONTROL----------------//
{
  if (key==CODED) {
    if (keyCode == UP)    keys[up] = false;
    else if (keyCode == DOWN)  keys[down] = false;
    else if (keyCode == RIGHT) keys[right] = false;
    else if (keyCode == LEFT)  keys[left] = false;
  } 
  //--------------VELOCITY AND WEAPON CONTROL---------------//
  if (key == 'a') keys[speedDown] = false;
  else if (key == 'd') keys[speedUp] = false;
  else if (key == ' ') keys[shootB] = false;
  else if (key == 'q') keys[shootM] = false;
  else if (key == 'c') keys[changeB] = false;
  else if (key == 'x') keys[changeM] = false;
}
// ------difficulty slider control------------//
boolean lock;
void mousePressed() { 
  //---------------MENU BUTTON CONTROL----------//
  if (screenmode==MENU) {
    if (mouseX>buttonX_1-bMidW
      &&mouseX<buttonX_1+bMidW
      &&mouseY>buttonY_1-bMidH
      &&mouseY<buttonY_1+bMidH
      ) {
      screenmode=LEVEL_1;
      //--check if screen changes---//
    }   
    if (mouseX>buttonX_2-bMidW
      &&mouseX<buttonX_2+bMidW
      &&mouseY>buttonY_2-bMidH
      &&mouseY<buttonY_2+bMidH
      &&mousePressed) {
      screenmode=LEVEL_2;
      println("changed");
    }   
    if (mouseX>buttonX_3-bMidW
      &&mouseX<buttonX_3+bMidW
      &&mouseY>buttonY_3-bMidH
      &&mouseY<buttonY_3+bMidH
      &&mousePressed) {
      screenmode=LEVEL_3;
    }
  }

  //if (lock) {
  //  faux2_slider=faux_slider-(mouseY-pmouseY);
  //}
}
void mouseDragged() {    
  //if (lock==true) {  
  //  faux_slider=mouseY-faux2_slider;
  //}
}
void mouseReleased() {
  //lock=false;
}


//boolean re () {
//  if (mouseX>buttonX_1-72.5 
//    &&mouseX<buttonX_1+72.5
//    &&mouseY>buttonY_1-35 
//    &&mouseY<buttonY_1+35
//    &&mousePressed) {
//    return true;
//  } else {
//    return false;
//  }
//}
//boolean be() {
//  if (mouseX>buttonX_2-72.5 
//    &&mouseX<buttonX_2+72.5
//    &&mouseY>buttonY_2-35 
//    &&mouseY<buttonY_2+35
//    &&mousePressed) {    
//    return true;
//  } else {
//    return false;
//  }
//}
