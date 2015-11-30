class Personnage {

  PImage[] animation = new PImage[4];
  int curseurAnimation;
  int X, Y;

  Personnage(String imgAvatar) {
    for (int i = 0; i < animation.length; i++) {
      animation[i] = loadImage(imgAvatar + i + ".png");
    }
  }

  void afficher(int x, int y) {
    curseurAnimation = curseur;
    fill(255, 0, 0);
    x *= t;
    y *= t;
    //image(animation[curseurAnimation], x, y, t*2, t*2 );
  }

  void deplacer() {
    if (keyPressed) {
      //VERIF DIRECTION
      curseurDir += 1;
      
      if (curseurDir > 1) {
        curseurDir = 0;
      }
      directions[curseurDir] = curseur;

      if (keyCode == UP) {
        curseur = 0;
        tIndex = 0;
        if(tY >= 0){
          tY+=60;
        }
        
        if (posY > 0) {
          if (grille[posX][posY-1] != '1') {
            posY -= 1;
          }
        }
      } 
      if (keyCode == DOWN) {
        curseur = 1; 
        tIndex = 1;
        
        if(tY <= taillePixelsY);{
          tY-=60;
        }
        
        if (posY < HAUTEUR - 1) {
          if (grille[posX][posY+1] != '1') {
            posY += 1;
          }
        }
      } 
      if (keyCode == LEFT) {
        curseur = 2;
        tIndex = 2;
        
        if(tX >= 0){
          tX += t;
        }
        
        if (posX > 0) {
          if (grille[posX-1][posY] != '1') {
            posX -= 1;
          }
        }
      }
      if (keyCode == RIGHT) {
        curseur = 3;
        tIndex = 3;
        
        if(tX <= taillePixelsX){
          tX -= t;
        }
        
        if ( posX < LONGUEUR - 1) {
          if (grille[posX+1][posY] != '1') {
            posX += 1;
          }
        }
      }
    }
  }
}