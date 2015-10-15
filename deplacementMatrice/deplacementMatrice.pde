//TEST 000
//Un personnage se promène
//A Faire : collision maison (porte)
//Colision personnage
//Changement écran
//fondu au noir lorsqu'on entre ou attaque monstre

Personnage avatar;
Maison maison;

int taille = 40;
int curseur;

PImage test;

void settings(){
  fullScreen(P2D);
  //size(500, 500, P2D);
}

void setup(){
  avatar = new Personnage("chevalier");
  maison = new Maison("the");
  test = loadImage("ingrat.jpg");
  frameRate(10);
}

void draw(){
  background(255);
  
  maison.afficher(5, 5, 9, 9);
  maison.penetre();
  
  avatar.afficher();
  avatar.deplacer();
  
  maison.evenement();
  grille();
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