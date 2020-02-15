void keyPressed() {
  //--------------------MOVEMENT CONTROL----------------//
  if (key==CODED) {
    if (keyCode == UP)         keys[up]    = true;
    else if (keyCode == DOWN)  keys[down]  = true;
    else if (keyCode == RIGHT) keys[right] = true;
    else if (keyCode == LEFT)  keys[left]  = true;
  }
  //--------------VELOCITY AND WEAPON CONTROL---------------//
  if (key == 'a')      keys[speedDown] = true;
  else if (key == 'd') keys[speedUp]   = true;
  else if (key == ' ') keys[shootB]    = true;
  else if (key == 'q') keys[shootM]    = true;
  else if (key == 'c') keys[changeB]   = true;
  else if (key == 'x') keys[changeM]   = true;
}

void keyReleased() 
  //--------------------MOVEMENT CONTROL----------------//
{
  if (key==CODED) {
    if (keyCode == UP)        keys[up]    = false;
    else if (keyCode == DOWN) keys[down]  = false;
    else if (keyCode == RIGHT)keys[right] = false;
    else if (keyCode == LEFT) keys[left]  = false;
  } 
  //--------------VELOCITY AND WEAPON CONTROL---------------//
  if (key == 'a')      keys[speedDown] = false;
  else if (key == 'd') keys[speedUp]   = false;
  else if (key == ' ') keys[shootB]    = false;
  else if (key == 'q') keys[shootM]    = false;
  else if (key == 'c') keys[changeB]   = false;
  else if (key == 'x') keys[changeM]   = false;
}
void mousePressed() { 
  //---------------MENU BUTTON CONTROL----------//
  if (screenmode==MENU) {
    if (mouseX>buttonX_1-bMidW
      &&mouseX<buttonX_1+bMidW
      &&mouseY>buttonY_1-bMidH
      &&mouseY<buttonY_1+bMidH) {
      screenmode=LEVEL_1;
      menuThemeMusic.pause();
      levelThemeMusic.loop();
    }   
    if (mouseX>buttonX_2-bMidW
      &&mouseX<buttonX_2+bMidW
      &&mouseY>buttonY_2-bMidH
      &&mouseY<buttonY_2+bMidH) {
      screenmode=LEVEL_2;      
      menuThemeMusic.pause();
      levelThemeMusic.loop();
    }   
    if (mouseX>buttonX_3-bMidW
      &&mouseX<buttonX_3+bMidW
      &&mouseY>buttonY_3-bMidH
      &&mouseY<buttonY_3+bMidH) {
      screenmode=LEVEL_3;      
      menuThemeMusic.pause();
      levelThemeMusic.loop();
    }
  }
  if (screenmode==RESTART) {
    if (mouseX>menuButton.x-resButSize.x
      &&mouseX<menuButton.x+resButSize.x
      &&mouseY>menuButton.y-resButSize.y
      &&mouseY<menuButton.y+resButSize.y) {
      screenmode=MENU;      
      setOne();
      setTwo();
      setThree();
    }    
    if (mouseX>resButton.x-resButSize.x
      &&mouseX<resButton.x+resButSize.x
      &&mouseY>resButton.y-resButSize.y
      &&mouseY<resButton.y+resButSize.y) {
      screenmode=lastScreen;      
      setOne();
      setTwo();
      setThree();
    }
  }
}