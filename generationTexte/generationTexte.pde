
/*
Générer carte aléatoire
 Déplacement joueur
 Ajouter TEXTES antoine
 */

Personnage chCh;
Element arbre;

//BROUILLARD
PImage fond;
PImage nuage;
float nuageX;
PImage[] brouillard = new PImage[3];
int C;

//GRILLE****MATRICE***COLLISION
int col = 72;
int ligne = 90;
int HAUTEUR = ligne;
int LONGUEUR = col;

char[][] grille = new char[col][ligne];
String[] niveau;

//VARIABLES
int t = 60;
int taillePixelsX = t * col;
int taillePixelsY = t * ligne;
/// 60 * 72 = 4320 =/2 2160
/// 60 * 90 = 5400 =/2 2700

//PERSONNAGE
int posX = 10; //36
int posY = 7; //45
char p = '2';

int curseur;
int[] directions = new int[2];
int curseurDir;

//CAMERA
int tX, tY;
int[] tCamera = new int[4];
int tIndex;

void setup() {
  //size(600, 600, P2D);
  fullScreen(P3D, 1);
  frameRate(12);
  noStroke();
  noCursor();
  smooth();

  fond = loadImage("fondJeu.jpg");
  nuage = loadImage("nuage.png");
  for (int i = 0; i < brouillard.length; i++) {
    brouillard[i] = loadImage("fog" + i + ".jpg");
  }

  //OBJETS DECO
  chCh = new Personnage("chevalier");
  arbre = new Element("superarbre");

  //CHARGEMENT NIVEAU en TXT
  niveau = loadStrings("test.txt");

  //GRILLE THÉORIQUE DESSIN (ici via fichier texte)
  for (int i = 0; i < col; i++) {
    for (int j = 0; j < ligne; j++) {
      grille[i][j] = niveau[j].charAt(i);
      if(grille[i][j] == '0'){
        fill(0, 255, 0);
      } else {
        fill(0);
      }
      rect(i * t, j * t, t, t);
    }
  }
  grille[posX][posY] = p;
  fill(0, 0, 255);
  rect(posX * t, posY * t, t, t);
  
  //CAMERA
  tCamera[0] = 60;
  tCamera[1] = -60;
  tCamera[2] = 60;
  tCamera[3] = -60;
}

void draw() {
  background(120);
  println(posX + "     " + posY);
  
  translate(tX, tY);
  for (int i = 0; i < col; i++) {
    for (int j = 0; j < ligne; j++) {
      if(grille[i][j] == '0'){
        fill(0, 255, 0);
      } else {
        fill(0);
      }
      rect(i * t, j * t, t, t);
    }
  }
  
  fill(0, 0, 255);
  rect(posX * t, posY * t, t, t);
  
  //renduGraphiqueGrille();
  arbre.afficher(1, 6, 3, 3);
  arbre.afficher(4, 6, 3, 3);
  arbre.afficher(7, 6, 3, 3);
  chCh.afficher(posX, posY);
  chCh.deplacer();
  
  grille();
  
  pushMatrix();
  fill(0, 0, 255);
  rect(10 * t, 7 * t, t, t);
  popMatrix();
}

void renduGraphiqueGrille() {
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

void grille() {
  pushStyle();
  stroke(255, 255, 0);
  for (int i = 0; i < col; i++) {
    text(i, i * t + 10, 30);
    line(i * t, 0, i*t, height);
  }
  for (int i = 0; i < ligne; i++) {
    line(0, i * t, width, i * t);
    text(i, 10, i * t + 30);
  }
  popStyle();
}

void keyPressed(){
  if(key == 'i'){
    tY+= t;
  }
  if(key == 'k'){
    tY-= t;
  }
  if(key == 'j'){
    tX+= t;
  }
  if(key == 'l'){
    tX-= t;
  }
}