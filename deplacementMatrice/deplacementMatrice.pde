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

PImage test;// faire classe cinématiques
PImage herbe;

void settings(){
  fullScreen(P2D);
  //size(600, 600, P2D);
}

void setup(){
  avatar[0] = new Personnage("chevalier");
  avatar[1] = new Personnage("baleze");
  
  maison[0] = new Maison("the");
  maison[1] = new Maison("superarbre");
  maison[2] = new Maison("superarbre");
  
  test = loadImage("ingrat.jpg");
  herbe = loadImage("herbe.jpg");
  frameRate(12);
}

void draw(){
  background(255);
  pushStyle();
  tint(200, 200, 5, 120);
  image(herbe, 0, 0, width, height);
  popStyle();
  
  maison[0].afficher(5, 5, 6, 6);
  maison[0].penetre();
  maison[1].afficher(25, 7, 7, 7);
  maison[2].afficher(17, 12, 5, 5);
  maison[2].afficher(15, 5, 4, 4);
  
  avatar[1].afficher(23, 9);
  avatar[0].afficher(0, 0);
  avatar[0].deplacer();
  
  maison[0].evenement();
  grille();
  println(opacite);
  //fondu();
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