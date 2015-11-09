class Personnage{
  
  PImage[] animation = new PImage[4];
  int curseurAnimation;
  int X, Y;
  
  Personnage(String imgAvatar){
    for(int i = 0; i < animation.length; i++){
      animation[i] = loadImage(imgAvatar + i + ".png");
    }
  }
  
  void afficher(int x, int y){
    curseurAnimation = curseur;
    fill(255, 0, 0);
    x *= t;
    y *= t;
    image(animation[curseurAnimation], posX + x, posY + y - t, t*2, t*2 );
  }
  
  void deplacer(){
    if(keyPressed){
      //VERIF DIRECTION
      curseurDir += 1;
      if(curseurDir > 1){
        curseurDir = 0;
      }
      directions[curseurDir] = curseur;
      
      if(keyCode == UP){
        curseur = 0;
        if(posY > 0){
          if(grille[posX][posY-1] != '1'){
            posY -= 1;
          }
        }
      } 
      if(keyCode == DOWN){
        curseur = 1; 
        if(posY < HAUTEUR - 1){
          if(grille[posX][posY+1] != '1'){
            posY += 1;
          }
        }
      } 
      if(keyCode == LEFT){
        curseur = 2;
        if(posX > 0){
          if(grille[posX-1][posY] != '1'){
            posX -= 1;
          }
        }
      }
      if(keyCode == RIGHT){
        curseur = 3;
        if( posX < LONGUEUR - 1){
          if(grille[posX+1][posY] != '1'){
            posX += 1;
          }
        }
      }
    }
  }
}