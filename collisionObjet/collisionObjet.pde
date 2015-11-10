
//1440 * 900
//60 t. Pour 24 * 15

Element maison;
Element arbre;
Personnage chCh;

//BROUILLARD
PImage fond;
PImage nuage;
float nuageX;
PImage[] brouillard = new PImage[3];
int C;

//GRILLE****MATRICE***COLLISION
int col = 24;
int ligne = 15;
int HAUTEUR = ligne;
int LONGUEUR = col;

char[][] grille = new char[col][ligne];
String[] niveau;

//VARIABLES
int t = 60;

//PERSONNAGE
int posX = 2;
int posY = 2;
char p = '2';

int curseur;
int[] directions = new int[2];
int curseurDir;

void setup(){
  //size(600, 600, P2D);
  fullScreen(P2D, 2);
  frameRate(10);
  //noStroke();
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
  image(fond, 0, 0);
  //renduGraphiqueGrille();
  
  maison.afficher(3, 3, 3, 3);
  maison.afficher(15, 10, 3, 3);
  arbre.afficher(12, 7, 3, 3);
  arbre.afficher(14, 5, 3, 3);
  arbre.afficher(16, 4, 3, 3);
  chCh.afficher(posX, posY);
  chCh.deplacer();

  brouillard();//PEU EFFICIENT ! MODIFIER CE TEST ABSOLUMENT!
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

void bruit(int quantite){
  for(int i = 0; i < quantite; i++){
    stroke(0, 127);
    point(random(width), random(height));
  }
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
  tint(255, 45);
  image(brouillard[C], 0, 0, width, height);
  popStyle();
}