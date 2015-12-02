
//LE JEU VIDEO DONT VOUS ÊTES L'ÉCRIVAIN

Personnage chCh;
Element arbre;
Element[] fleur = new Element[24*15];

//GRILLE****MATRICE***COLLISION
int col = 24;
int ligne = 15;
int HAUTEUR = ligne;
int LONGUEUR = col;

char[][] grille = new char[col][ligne];

//VARIABLES, ECHELLE
int t = 60;

//PERSONNAGE
int posX = 2;
int posY = 11;
char p = '3';

int curseur;
int[] directions = new int[2];
int curseurDir;

//GENERARIVITE CARTE
char[][] lettres = new char[col][ligne];
char[] natureCases = {'0', '1', '2'};
int[][] foule = new int[col][ligne]; // 0 pas marché, 1//marché, //2 périme

//TEXTE GENERATIF
String texteGeneratif = "";
int indexTexte;

void setup() {
  //size(600, 600, P2D);
  fullScreen(P2D, 1);
  frameRate(10); noStroke(); noCursor(); smooth();
  
  //TEXTE GENERATIF
  if(hour() >= 8 && hour() < 12){
    texteGeneratif = "À Une bien belle matinée, à l'heure ou le brouillard… ";
  } else if (hour() >= 12 && hour() < 14){
    texteGeneratif = "Aux alentours de midi, à l'heure ou le brouillard… ";
  } else if(hour() >= 14 && hour() < 20){
    texteGeneratif = "Dans l'après-midi, à l'heure ou le brouillard… ";
  } else {
    texteGeneratif = "Dans la soirée, à l'heure ou le brouillard… ";
  }

  //OBJETS DECO
  chCh = new Personnage("chevalier");
  arbre = new Element("superarbre");
  for(int i = 0; i < fleur.length; i++){
    fleur[i] = new Element("fleurhop");
  }

  //GRILLE GENERATION
  for (int i = 0; i < col; i++) {
    for (int j = 0; j < ligne; j++) {
      lettres[i][j] = natureCases[int(random(3))];
      foule[i][j] = 0;
    }
  }
  //GRILLE ABSTRAITE
  for (int i = 0; i < col; i++) {
    for (int j = 0; j < ligne; j++) {
      grille[i][j] = lettres[i][j];
      if (grille[i][j] == '0') {
        fill(255);
      } else if (grille[i][j] == '1'){
        fill(255, 255, 0);
      } else if(grille[i][j] == '2'){
        fill(0, 0, 60);
      } else {
        fill(200, 0, 0);
      }
      rect(i * t, j * t, t, t);
    }
  }
  grille[posX][posY] = p;
}

void draw() {
  //background(255);
  //renduGraphiqueGrille();
    //if(posX * t > 600){
    //  translate(-t, 0);
    //  println("okok");
  //}
//  //GRILLE ABSTRAITE
  for (int i = 0; i < col; i++) {
    for (int j = 0; j < ligne; j++) {
      fleur[i].afficher(i, j, 1, 1, grille[i][j]);
    }
  }
  chCh.afficher(posX, posY);
  chCh.deplacer();
  //grille();
  if(mousePressed){
    println(texteGeneratif);
    noLoop();
  }
}