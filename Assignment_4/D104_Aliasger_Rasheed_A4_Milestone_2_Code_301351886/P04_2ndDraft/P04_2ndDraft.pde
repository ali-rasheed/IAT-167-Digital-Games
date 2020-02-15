//Controls include a and d for speeding up and down respectively
// UP and DOWN to change height of orbit;
//LEFT and RIGHT to change width of orbit
// SPACE shoots bullets, ALT shoots missiles
//protect the planet from invaders by modifying your orbit and shooting them down
// new features include missiles that were not there in milestone 1;
//level 2 enemies are bigger, faster and stronger


//--------------LEVEL VARIABLES------------------------//
final int MENU = 0;
final int LEVEL_1 = 1;
final int LEVEL_2 = 2;
final int LEVEL_3 = 3;
final int WIN = 4;
final int RESTART = 5;
int screenmode=MENU;
//-----------------CAMERA CONTROL AND WORLD DIMENSIONS----------------------//
final float worldHeight = 3900  ;
final float worldWidth = 3900;
PVector planetDim= new PVector(1000,1000);
//-----------INDIVIDUAL OBJECTS------------//
Star Vega;
Planet Traletera;
Player Rig;
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
PFont options;  
PGraphics mM;


//--------------------------------------------SETUP---------------------------------------//
float fWaveSize= 20;
void setup() {  
  mM = createGraphics(200, 200);
  options= loadFont("options.vlw");  
  Traletera = new Planet(new PVector(0, 0), planetDim);
  cluster();    
  Rig = new Player(new PVector(0, 0), new PVector(900, 900), new PVector(150, 150), 0);
  size(1200, 800);
  colorMode(HSB, 360, 100, 100, 100);
  setOne();
  setTwo();
  setThree();
  frameRate(30);
}
//---------------------------------------------DRAW--------------------------------------//
void draw() {   

  switch(screenmode) {
  case MENU:  
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
    translate(0.5*width, 0.5*height/*+100*/);
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
println(keys[shootM]);
  //println(screenmode);
}
