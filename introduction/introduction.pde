
//ELEMENTS GRAPHIQUES
Element maison;
Element arbre;
Personnage chCh;
Animation brouillard;

//IMAGES ET VIDEO ADDITIONNELLES
PImage fond;
String titre = "Géroux & NiouDélit présentent";

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

int TESTX = 200;
int grosseur = 60;

void setup(){
  //size(600, 600, P2D);
  fullScreen(P2D, 1);
  frameRate(10);
  noCursor();
  
  fond = loadImage("fondJeu.jpg");
  
  //OBJETS DECO
  maison = new Element("the");
  arbre = new Element("superarbre");
  chCh = new Personnage("chevalier");
  brouillard = new Animation("fog", 3);
  
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
  cinematiqueDebut();
  textAlign(CENTER);
  textSize(60);
  if(millis() > 1000 || millis()< 5000){
    text(titre, width/2, height/2);
  } else {
    titre = " ";
  }
  //renduGraphiqueGrille();
}

void cinematiqueDebut(){
  println(TESTX);
  if(TESTX < 40){
    TESTX ++;
  } else {
    TESTX --;
  }
   brouillard.IN(0, 0, TESTX, TESTX, 1);
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
  //GRILLE
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