
//1440 * 900
//60 t. Pour 24 * 15

Element maison;
Personnage chCh;

//BROUILLARD
PImage fond;
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
  fullScreen(P2D, 1);
  frameRate(10);
  //noStroke();
  fond = loadImage("fondJeu.jpg");
  for(int i = 0; i < brouillard.length; i++){
    brouillard[i] = loadImage("fog" + i + ".jpg");
  }
  
  //OBJETS DECO
  maison = new Element("the");
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
  chCh.afficher(posX, posY);
  chCh.deplacer();
  
  brouillard();
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
  tint(255, 60);
  if(frameCount % 2 == 0){
     C++;
  }
  if(C > 2){
    C = 0;
  }
  image(brouillard[C], 0, 0, width, height);
  popStyle();
}