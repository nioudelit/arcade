
//1440 * 900
//60 t. Pour 24 * 15
//ACTION
//COLLISION cheval préciser.
//mouvement PNG
//cases interaction
//MOUVements plus fluides 
//SON
//Générativité/récursivité du décor
//MAnifestation du programme dans la linéarité du récit`
//Synthèse Granulaire

Element maison;
Element arbre;
Personnage chCh;

//BROUILLARD
PImage fond;
PImage nuage;
float nuageX;
PImage[] brouillard = new PImage[3];
int C;
float TEST = 255;

//GRILLE****MATRICE***COLLISION
int col = 24;
int ligne = 15;
int HAUTEUR = ligne;
int LONGUEUR = col;

char[][] grille = new char[col][ligne];
String[] niveau;

//VARIABLES
int t = 60;

//COULEURS
color rouge = color(255, 0, 0);
color vert = color(0, 140, 0);
color bleu = color(0, 0, 255);

//PERSONNAGE
int posX = 4;
int posY = 2;
char p = '2';

int curseur;
int[] directions = new int[2];
int curseurDir;

void setup(){
  //size(600, 600, P2D);
  fullScreen(P2D, 1);
  frameRate(10);
  noCursor();
  
  fond = loadImage("fondJeu.jpg");
  nuage = loadImage("nuage.png");
  for(int i = 0; i < brouillard.length; i++){
    brouillard[i] = loadImage("fog" + i + ".jpg");
  }
  
  //OBJETS DECO
  maison = new Element("the");
  arbre = new Element("superarbre");
  chCh = new Personnage("chevalier");
  
  //CHARGEMENT NIVEAU en TXT
  niveau = loadStrings("test.txt");
  
  //GRILLE THÉORIQUE DESSIN (ici via fichier texte)
  for (int i = 0; i < col; i++){
    for (int j = 0; j < ligne; j++) {
     grille[i][j] = niveau[j].charAt(i);
    }
  }
  grille[posX][posY] = p;
}

void draw(){
  //translate(300, 300);
  TEST-=0.7;
  image(fond, 0, 0);
  renduGraphiqueGrille();
  
  maison.afficher(3, 3, 3, 3);
  arbre.afficher(12, 7, 3, 3);
  arbre.afficher(14, 5, 3, 3);
  arbre.afficher(16, 4, 3, 3);
  
  
  chCh.afficher(posX, posY);
  chCh.deplacer();
  maison.afficher(15, 10, 3, 3);
  
  brouillard();//PEU EFFICIENT ! MODIFIER CE TEST ABSOLUMENT!
  chCh.action();
  grille();
  if(TEST == - 100){
    println(millis()/1000);
  }
}

void renduGraphiqueGrille(){
  int test;
  test = int(map(mouseX, 0, width, 0, 255));

  for (int i = 0; i < col; i++) {
    for (int j = 0; j < ligne; j++) { 
      if (grille[i][j] == '1') {
        fill(0, test);
      } else {
        fill(255, test);
      }
      rect(i * t, j * t, t, t);
    }
  }
  fill(255, 0, 0);
  rect(posX * t, posY * t, t, t); 
}

void brouillard(){
  pushStyle();
  tint(255, 110);
  if(frameCount % 2 == 0){
     C++;
  }
  if(C > 2){
    C = 0;
  }
  nuageX += 0.5;
  image(nuage, nuageX - 100, 0, nuage.width/2, nuage.height/2);
  image(nuage, nuageX , 100, nuage.width/2, nuage.height/2);
  image(nuage, nuageX * 1.5 + 120, 69, nuage.width/2, nuage.height/2);
  image(nuage, nuageX + 180, 74, nuage.width/2, nuage.height/2);
  image(nuage, nuageX + 300, 100);
  image(nuage, nuageX - 100, 400, nuage.width/2, nuage.height/2);
  image(nuage, nuageX ,460, nuage.width/2, nuage.height/2);
  image(nuage, nuageX + width/2, 400);
  image(nuage, nuageX * 1.5 + 590, 69, nuage.width/2, nuage.height/2);
  image(nuage, nuageX + 180, 640, nuage.width/2, nuage.height/2);
  image(nuage, nuageX + 300, 690);
  tint(255, TEST);
  image(brouillard[C], 0, 0, width, height);
  popStyle();
}

void grille(){
  pushStyle();
  stroke(255, 255, 0);
  for(int i = 0; i < col; i++){
    text(i, i * t + 10, 30);
    line(i * t, 0, i*t, height);
  }
  for(int i = 0; i < ligne; i++){
    line(0, i * t, width, i * t);
    text(i, 10, i * t + 30);
  }
  popStyle();
}