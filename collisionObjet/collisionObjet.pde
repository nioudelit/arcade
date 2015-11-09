int col = 10;
int ligne = 10;
char[][] grille = new char[col][ligne];

int t = 40;
String[] niveau;

void setup(){
  size(400, 400);
  
  //CHARGEMENT NIVEAU en TXT
  niveau = loadStrings("test.txt");
  
  //GRILLE THÉORIQUE DESSIN (ici généré automatiquement)
  for (int i = 0; i < col; i++){
    for (int j = 0; j < ligne; j++) {
     grille[i][j] = niveau[j].charAt(i);
    }
  }
}

void draw(){
  renduGraphiqueGrille();
}

void renduGraphiqueGrille(){
  for (int i = 0; i < col; i++) {
    for (int j = 0; j < ligne; j++) {
      if (grille[i][j] == '1') {
        fill(0);
      } else {
        fill(255);
      }
      rect(i * t, j * t, t, t);
    }
  }
}