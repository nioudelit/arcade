class Personnage{
  
  PImage[] animation = new PImage[4];
  int curseurAnimation;
  int posX, posY;
  boolean col = false;
  
  Personnage(String imgAvatar){
    for(int i = 0; i < animation.length; i++){
      animation[i] = loadImage(imgAvatar + i + ".png");
    }
  }
  
  void afficher(int x, int y){
    curseurAnimation = curseur;
    fill(255, 0, 0);
    x *= taille;
    y *= taille;
    image(animation[curseurAnimation], posX + x, posY + y, taille * 3, taille * 3);
    //ellipse(posX + taille / 2, posY + taille / 2, taille, taille);
  }
  
  int X(){
    return posX + taille + taille / 2;
  }
  
  int Y(){
    return posY + taille + taille / 2;
  }
  
  boolean collision(){
    return true;
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
        posY -= (taille / 2 * collision);
      } 
      if(keyCode == DOWN){
        curseur = 1; 
        posY += (taille / 2 * collision);
      } 
      if(keyCode == LEFT){
        curseur = 2;
        posX-= (taille / 2 * collision);
      }
      if(keyCode == RIGHT){
        curseur = 3;
        posX += (taille / 2 * collision);
      }
    }
  }
}