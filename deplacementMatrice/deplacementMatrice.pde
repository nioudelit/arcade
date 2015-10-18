//TEST 000
//Un personnage se promène

//ANIMATION
//COLLISION
//PATTERNS MOUVEMENT PNG (CLASSE PNG?)
//CHANGEMENT écran

Personnage[] avatar = new Personnage[2];
Maison[] maison = new Maison[3];

int taille = 40;
int curseur;
int opacite = 0;

//gestion collision
//Permet de vérifier direct° du perso
int[] directions = new int[2];
int curseurDir;
int collision = 1;

PImage test;// faire classe cinématiques
PImage herbe;

void settings(){
  fullScreen(P2D);
  //size(800, 600, P2D);
}

void setup(){
  avatar[0] = new Personnage("chevalier");
  avatar[1] = new Personnage("baleze");
  
  maison[0] = new Maison("the");
  maison[1] = new Maison("superarbre");
  
  test = loadImage("ingrat.jpg");
  herbe = loadImage("herbe.jpg");
  frameRate(12);
}

void draw(){
  background(255);
  //pushStyle();
  //tint(200, 200, 5, 120);
  //image(herbe, 0, 0, width, height);
  //popStyle();
  ecran001();
}

void grille(){
  stroke(0, int(map(mouseX, 0, width, 0, 255)));
  for(int i = 0; i < width; i++){
    line(i * taille, 0, i * taille, height);
  }
  for(int i = 0; i < height; i++){
    line(0, i * taille, width, i * taille);
  }
}

void acc(){
}

void ecran001(){
  
  //MAISON
  maison[0].afficher(5, 5, 6, 6);
  maison[0].penetre();
  maison[0].collision();
  //maison[0].verifcollision();
  maison[1].collision();
  //maison[1].verifcollision();
  //PNG
  avatar[1].afficher(23, 9);
  
  //PERSONNAGE
  avatar[0].afficher(0, 0);
  avatar[0].deplacer();
  
  //ARBRES
  maison[1].afficher(25, 7, 7, 7);
  maison[1].afficher(17, 12, 5, 5);
  maison[1].afficher(15, 5, 4, 4);
  
  
  //ACTION MAISON
  maison[0].evenement();
  
  //GRILLE
  grille();
  
  //CHANGEMENT ECRAN
  if(avatar[0].X() < 0){
    ecran002();
    //q = taille;
  }
}

void ecran002(){
  background(0);
}