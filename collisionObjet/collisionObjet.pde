
//1440 * 900
//60 t. Pour 24 * 15

Element maison;
Personnage chCh;

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
  background(255);
  //renduGraphiqueGrille();
  
  maison.afficher(3, 3, 3, 3);
  chCh.afficher(posX, posY);
  chCh.deplacer();
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