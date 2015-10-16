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
int q, s;

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
  pushMatrix();
  translate(q, s);
  maison[0].afficher(5, 5, 6, 6);
  maison[0].penetre();
  maison[1].afficher(25, 7, 7, 7);
  maison[2].afficher(17, 12, 5, 5);
  maison[2].afficher(15, 5, 4, 4);
  popMatrix();
  
  avatar[1].afficher(23, 9);
  avatar[0].afficher(width/2 / taille, height/2 / taille);
  avatar[0].deplacer();
  
  maison[0].evenement();
  grille();
  
  if(avatar[0].X() < 0){
    //ecran002();
    //q = taille;
  }
}