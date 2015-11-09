Element maison;
Personnage chCh;

//GRILLE****MATRICE***COLLISION
int col = 10;
int ligne = 10;
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
  size(600, 600);
  frameRate(8);
  noStroke();
  
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
  renduGraphiqueGrille();
  
  chCh.afficher(posX, posY);
  chCh.deplacer();
  maison.afficher(3, 3, 3, 3);
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
  //rect(posX * t, posY * t, t, t);
  if(keyPressed){
    if(grille[posX+1][posY] != '1'){
      if(keyCode == RIGHT){
        posX += 1;
      }
    }
    if(grille[posX-1][posY] != '1'){
      if(keyCode == LEFT){
        posX -= 1;
      }
    }
    if(grille[posX][posY-1] != '1'){
      if(keyCode == UP){
        posY -= 1;
      }
    }
    if(grille[posX][posY+1] != '1'){
      if(keyCode == DOWN){
        posY += 1;
      }
    }
  }
}