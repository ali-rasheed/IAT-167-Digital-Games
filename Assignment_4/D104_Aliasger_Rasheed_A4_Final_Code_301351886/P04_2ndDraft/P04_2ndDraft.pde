//----------MINIM LIBRARY IMPORT----------//
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Controls include a and d for speeding up and down respectively
// UP and DOWN to change height of orbit;
//LEFT and RIGHT to change width of orbit
// SPACE shoots bullets, ALT shoots missiles
//protect the planet from invaders by modifying your orbit and shooting them down
// new features include missiles that were not there in milestone 1;
//level 2 enemies are bigger, faster and stronger


//--------------LEVEL VARIABLES------------------------//
final int MENU    = 0;
final int LEVEL_1 = 1;
final int LEVEL_2 = 2;
final int LEVEL_3 = 3;
final int WIN     = 4;
final int RESTART = 5;
final int LOSS    = 6;
int screenmode=MENU; //initial screen
int lastScreen=0;

//-----------INDIVIDUAL OBJECTS------------//
Planet Traletera;
Player Rig;
//-----------------CAMERA CONTROL AND WORLD DIMENSIONS----------------------//
final float worldHeight = 4500;
final float worldWidth  = 5000;// dimensions regardless of screen size for background graphics and enemy spawn limit
PVector TraleteraDim= new PVector(1500, 1500); //planet dimensions
int miniWidth = 150, miniHeight = 150; //minimap dimenions
int hudWidth = 530, hudHeight= 70; //heads up display dimensions
// Global ArrayLists
//---------------------BACKGROUND---------------------//
ArrayList<Star> nebula = new ArrayList<Star>();
//---------------DIFFERENT LEVEL ENEMY ARRAYLISTS--------------------//
ArrayList<EnemyBsc> firstWave = new ArrayList<EnemyBsc>();
ArrayList<EnemyBsc> secondWave = new ArrayList<EnemyBsc>();
ArrayList<EnemyBsc> thirdWave = new ArrayList<EnemyBsc>();

//------------------CONTROLS BOOLEAN ARRAY---------------//
boolean[] keys = new boolean [10];
final int up = 0;
final int down = 1;
final int  left = 2;
final int right = 3;
final int speedUp = 4;
final int speedDown = 5;
final int shootB = 6;
final int shootM = 7;
final int changeM = 8;
final int changeB = 9;
//-------------FONTS AND SPRITE IMPORTS------------//
PFont regFont, capFont, subFont;  
PGraphics mp, hud;
PImage bulletB, bulletA;
Minim minim;
AudioPlayer bGuyScream1, bGuyScream2, bGuyScream3, bGuyScream4, bGuyScream5;
AudioPlayer explosion1, explosion2, explosion3, explosion4, explosion5;
AudioPlayer menuThemeMusic, levelThemeMusic, Victory;

//--------------------------------------------SETUP---------------------------------------//
float fWaveSize; //initial enemy size
void setup() {  
  size(1000, 1000);
  colorMode(HSB, 360, 100, 100, 100);

  mp = createGraphics(miniWidth, miniHeight); //MINIMAP
  hud = createGraphics(hudWidth, hudHeight);//HUD

  subFont= loadFont("fonts/Elianto-Regular-80.vlw");  
  capFont= loadFont("fonts/Exan-Regular-80.vlw");  
  regFont= loadFont("fonts/Quicksand-Regular-50.vlw");  

  loadProjectileImgs(); //loads the images of the enemy so as to make image loading more efficient and code conflict in the sub and super classes
  Traletera = new Planet(new PVector(0, 0), TraleteraDim);
  cluster();    //sets background
  Rig = new Player(new PVector(0, 0), new PVector(1400, 1400), new PVector(150, 150), 0);
  soundSet();
  setOne(); //initializes the first enemy wave
  setTwo();//initializes the second enemy wave
  setThree();//initializes the third enemy wave
  menuThemeMusic.loop();
}
//---------------------------------------------DRAW--------------------------------------//
void draw() {   
  //changes the screen between the menu, levels and the win/loss/restart screens
  switch(screenmode) {
  case MENU:  //menu screen
    translate(0.5*width, 0.5*height+100);
    menu();  
    break;

  case LEVEL_1:  
    translate(0.5*width, 0.5*height/*+100*/);
    level_1();
    break;

  case LEVEL_2:  
    translate(0.5*width, 0.5*height/*+100*/);
    level_2();
    break;

  case LEVEL_3:  
    translate(0.5*width, 0.5*height/*+100*/);
    level_3();
    break;

  case RESTART:   
    restartScreen();
    break;  

  case WIN:
    translate(0.5*width, 0.5*height/*+100*/);
    winScreen();
    break;
  }
  debug();
}
// ----------------------------------DEBUG : to check for whether variables work-------------------------//
void debug() {
  //println(Rig.basicMs.size());
  //println("rigs pos" +Rig.pos);
  //for (EnemyBsc e : firstwave) {
  //  println(e.health);
  //  if (e.isAlive)  print("true");
  //}
  //println(Rig.angVel);

  //println(Rig.health);
  //println(keys[shootM]);
  //println(screenmode);
  //println(Rig.switchB);
  //println(Rig.advancedBltCount);
  //println(Rig.bscBltCount);
  println(thirdWave.size());
}