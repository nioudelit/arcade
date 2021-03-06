int colonne = 10;
int ligne = 10;
int p = 2; 
int posX = 1; 
int posY = 2;
int posXB = posX+1;
int t = 40;

int[][] grille = new int[colonne][ligne];

void setup() {
  size(400, 400);
  for (int i = 0; i < colonne; i++) {
    for (int j = 0; j < ligne; j++) {
      if ( i % 4 == 0 || j % 7 == 0) {
        grille[i][j] = 1;
      } else {
        grille[i][j] = 0;
      }
    }
  }
  grille[posX][posY] = p;
  grille[posXB][posY] = p;
  frameRate(16);
}

void draw() {
  for (int i = 0; i < colonne; i++) {
    for (int j = 0; j < ligne; j++) {
        if (grille[i][j] == 1) {
          fill(0);
        } else {
          fill(255);
        }
        rect(i * t, j * t, t, t);
      }
  }
  fill(255, 0, 0);
  rect(posX * t, posY * t, t, t);
  if(keyPressed){
    if(grille[posX+1][posY] != 1){
      if(keyCode == RIGHT){
        posX += 1;
      }
    }
    if(grille[posX-1][posY] != 1){
      if(keyCode == LEFT){
        posX -= 1;
      }
    }
    if(grille[posX][posY-1] != 1){
      if(keyCode == UP){
        posY -= 1;
      }
    }
    if(grille[posX][posY+1] != 1){
      if(keyCode == DOWN){
        posY += 1;
      }
    }
  }
}